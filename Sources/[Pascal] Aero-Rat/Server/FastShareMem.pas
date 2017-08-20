unit FastShareMem;

(*
 * Shared Memory Allocator for Delphi DLL's
 * Version: 2.10
 *
 * Features:
 *   No runtime dll required.
 *   No performance degradation.
 *   Faster than ShareMem/Borlndmm.dll.
 *
 * Usage:
 * Windows:
 *   Must be the FIRST unit listed in the project file's USES section
 *   for both dll and exe projects. If you install a memory manager for
 *   leak detection, it should be listed immediately AFTER this unit.
 * Linux:
 *   Not needed. May be commented out using conditional directives:
 *       uses {$IFDEF WIN32} FastShareMem, {$ENDIF}
 *
 * Author: Emil M. Santos
 *   You may use and modify this software as you wish, but this section
 *   must be kept intact. Please see Readme.txt for copyright and disclaimer.
 *
 * Send bugs/comments to fastsharemem@codexterity.com
 * On the web: http://www.codexterity.com
 * To be notified of new versions by email, subscribe to the site alerter facility.

   Revision History:
   2003 Dec 03: Version 2.10. Added GetAllocMemCount and GetAllocMemSize functions.
                From a contribution by Andrey Nikolayevich Aban'shin (andrey@ecobank.san.ru).
   2003 Dec 03: Version 2.00 released. Complete rewrite; now uses a window class
                to exchange data between modules. Safer, and *much* simpler.
                The code is also much shorter.
   2003 Aug 27: Removed reference to SysUtils. This was causing subtle bugs.
                Update by Alex Blach (entwicklung@zmi.de)
   2003 May  7: Fixed "Combining signed and unsigned types" warning. Replaced
				integers with longword where appropriate.
                Thanks to Nagy Krisztián (chris@manage.co.hu)
   2002 Oct  9: Separated MEM_DECOMMIT and MEM_RELEASE calls. Thanks to Maurice Fletcher and Alexandr Kozin.
   2002 Sep  9: Thanks to Ai Ming (aiming@ynxx.com) for these changes:
   				Modified to work with Windows NT/2000/XP.
   				Added reference-counting mechanism.
   2002 Aug 14: Rewrote address-computation code to better match windows 98
                allocation. VirtualAlloc may round down requested address *twice*.
                Replaced ASSERTs with (lower-level) Win32 MessageBox calls.
                (Thanks to Darryl Strickland (DStrickland@carolina.rr.com))
 *)

(*
	Note to contributors:
	If you're going to edit this code, keep in mind the following things:

	* We shouldn't dynamically allocate Delphi 'objects' here, like strings,
      obejcts etc. All memory should come from the Windows API, or be statically
      allocated.

	* We shouln't raise exceptions here, since an exception is a Delphi object,
	  and thus consumes heap memory.

    * For the above reasons, we cannot use most VCL facilities here.

 *)

interface

var
  GetAllocMemCount: function: integer;
  GetAllocMemSize : function: integer;


implementation
uses Windows;

const ClassName  = '_com.codexterity.fastsharemem.dataclass';

type
  TFastSharememPack = record
	MemMgr: TMemoryManager;
    _GetAllocMemSize  :function :integer;
    _GetAllocMemCount :function :integer;
  end;

  function _GetAllocMemCount: Integer;
  begin
    Result := System.AllocMemCount;
  end;

  function _GetAllocMemSize: Integer;
  begin
    Result := System.AllocMemSize;
  end;



var
  MemPack: TFastSharememPack;
  OldMemMgr: TMemoryManager;
  wc: TWndClass;
  isHost: boolean;

initialization

  if (not GetClassInfo(HInstance, ClassName, wc)) then
  begin
  	GetMemoryManager(MemPack.MemMgr);
    MemPack._GetAllocMemCount := @_GetAllocMemCount;
    MemPack._GetAllocMemSize  := @_GetAllocMemSize;
    GetAllocMemCount := @_GetAllocMemCount;
    GetAllocMemSize  := @_GetAllocMemSize;

  	FillChar(wc, sizeof(wc), 0);
    wc.lpszClassName := ClassName;
    wc.style := CS_GLOBALCLASS;
    wc.hInstance := hInstance;
  	wc.lpfnWndProc := @MemPack;

  	if RegisterClass(wc)=0 then
    begin
      MessageBox( 0, 'Shared Memory Allocator setup failed: Cannot register class.', 'FastShareMem', 0 );
      Halt;
    end;

    isHost := true;
  end else
  begin
    GetMemoryManager(OldMemMgr); // optional
	SetMemoryManager(TFastSharememPack(wc.lpfnWndProc^).MemMgr);
    GetAllocMemCount := TFastSharememPack(wc.lpfnWndProc^)._GetAllocMemCount;
    GetAllocMemSize  := TFastSharememPack(wc.lpfnWndProc^)._GetAllocMemSize;
    isHost := false;
  end;


finalization

  if isHost then UnregisterClass(ClassName, HInstance)
  else SetMemoryManager(OldMemMgr); // optional

end.
