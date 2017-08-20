Attribute VB_Name = "mdSound"
Declare Function mixerOpen Lib "winmm.dll" _
               (phmx As Long, _
               ByVal uMxId As Long, _
               ByVal dwCallback As Long, _
               ByVal dwInstance As Long, _
               ByVal fdwOpen As Long) As Long
               
Declare Function mixerGetLineControls Lib "winmm.dll" _
               Alias "mixerGetLineControlsA" _
               (ByVal hmxobj As Long, _
               pmxlc As MIXERLINECONTROLS, _
               ByVal fdwControls As Long) As Long
               
Declare Function mixerSetControlDetails Lib "winmm.dll" _
               (ByVal hmxobj As Long, _
               pmxcd As MIXERCONTROLDETAILS, _
               ByVal fdwDetails As Long) As Long
               
Declare Function mixerGetControlDetails Lib "winmm.dll" _
               Alias "mixerGetControlDetailsA" _
               (ByVal hmxobj As Long, _
               pmxcd As MIXERCONTROLDETAILS, _
               ByVal fdwDetails As Long) As Long
               
Declare Function mixerGetLineInfo Lib "winmm.dll" _
               Alias "mixerGetLineInfoA" _
               (ByVal hmxobj As Long, _
               pmxl As MIXERLINE, _
               ByVal fdwInfo As Long) As Long
               
Declare Sub CopyStructFromPtr Lib "kernel32" _
               Alias "RtlMoveMemory" _
               (struct As Any, _
               ByVal Ptr As Long, ByVal cb As Long)
               
Declare Sub CopyPtrFromStruct Lib "kernel32" _
               Alias "RtlMoveMemory" _
               (ByVal Ptr As Long, _
               struct As Any, _
               ByVal cb As Long)
               
Declare Function GlobalAlloc Lib "kernel32" _
               (ByVal wFlags As Long, _
               ByVal dwBytes As Long) As Long
               
Declare Function GlobalLock Lib "kernel32" _
               (ByVal hMem As Long) As Long
               
Declare Function GlobalFree Lib "kernel32" _
               (ByVal hMem As Long) As Long

Dim rc As Long

Public Const MMSYSERR_NOERROR = 0
Public Const MIXERCONTROL_CT_CLASS_FADER = &H50000000
Public Const MIXERCONTROL_CT_UNITS_UNSIGNED = &H30000
Public Const MIXERLINE_COMPONENTTYPE_DST_FIRST = &H0&
Public Const MIXERLINE_COMPONENTTYPE_SRC_FIRST = &H1000&
Public Const MIXER_SETCONTROLDETAILSF_VALUE = &H0&
Public Const MIXER_GETLINEINFOF_COMPONENTTYPE = &H3&
Public Const MIXER_GETLINECONTROLSF_ONEBYTYPE = &H2& ' separate left-right volume control
Public Const MIXERLINE_COMPONENTTYPE_SRC_WAVEDSVol = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 8)
Public Const MIXERLINE_COMPONENTTYPE_SRC_CDVol = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 5)
Public Const MIXERLINE_COMPONENTTYPE_DST_SPEAKERS = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 4)
Public Const MIXERCONTROL_CONTROLTYPE_FADER = (MIXERCONTROL_CT_CLASS_FADER Or MIXERCONTROL_CT_UNITS_UNSIGNED)
Public Const MIXERCONTROL_CONTROLTYPE_VOLUME = (MIXERCONTROL_CONTROLTYPE_FADER + 1)
Public Const MIXERCONTROL_CT_CLASS_SWITCH = &H20000000
Public Const MIXERCONTROL_CT_SC_SWITCH_BOOLEAN = &H0&
Public Const MIXERCONTROL_CT_UNITS_BOOLEAN = &H10000
Public Const MIXERCONTROL_CONTROLTYPE_BOOLEAN = (MIXERCONTROL_CT_CLASS_SWITCH Or MIXERCONTROL_CT_SC_SWITCH_BOOLEAN Or MIXERCONTROL_CT_UNITS_BOOLEAN)
Public Const MIXERCONTROL_CONTROLTYPE_MUTE = (MIXERCONTROL_CONTROLTYPE_BOOLEAN + 2)
Public Const MAXPNAMELEN = 32
Public Const MIXER_LONG_NAME_CHARS = 64
Public Const MIXER_SHORT_NAME_CHARS = 16

Type MIXERLINECONTROLS
   cbStruct As Long       '  size in Byte of MIXERLINECONTROLS
   dwLineID As Long       '  line id (from MIXERLINE.dwLineID)
                          '  MIXER_GETLINECONTROLSF_ONEBYID or
   dwControl As Long      '  MIXER_GETLINECONTROLSF_ONEBYTYPE
   cControls As Long      '  count of controls pmxctrl points to
   cbmxctrl As Long       '  size in Byte of _one_ MIXERCONTROL
   pamxctrl As Long       '  pointer to first MIXERCONTROL array
End Type

Type MIXERCONTROL
   cbStruct As Long           '  size in Byte of MIXERCONTROL
   dwControlID As Long        '  unique control id for mixer device
   dwControlType As Long      '  MIXERCONTROL_CONTROLTYPE_xxx
   fdwControl As Long         '  MIXERCONTROL_CONTROLF_xxx
   cMultipleItems As Long     '  if MIXERCONTROL_CONTROLF_MULTIPLE set
   szShortName As String * MIXER_SHORT_NAME_CHARS  ' short name of control
   szName As String * MIXER_LONG_NAME_CHARS        ' long name of control
   lMinimum As Long           '  Minimum value
   lMaximum As Long           '  Maximum value
   Reserved(10) As Long       '  reserved structure space
   End Type
   
Type MIXERCONTROLDETAILS
   cbStruct As Long       '  size in Byte of MIXERCONTROLDETAILS
   dwControlID As Long    '  control id to get/set details on
   cChannels As Long      '  number of channels in paDetails array
   Item As Long           '  hwndOwner or cMultipleItems
   cbDetails As Long      '  size of _one_ details_XX struct
   paDetails As Long      '  pointer to array of details_XX structs
End Type

Type MIXERCONTROLDETAILS_UNSIGNED
   dwValue As Long        '  value of the control (volume level)
End Type

Type MIXERLINE
   cbStruct As Long               '  size of MIXERLINE structure
   dwDestination As Long          '  zero based destination index
   dwSource As Long               '  zero based source index (if source)
   dwLineID As Long               '  unique line id for mixer device
   fdwLine As Long                '  state/information about line
   dwUser As Long                 '  driver specific information
   dwComponentType As Long        '  component type line connects to
   cChannels As Long              '  number of channels line supports
   cConnections As Long           '  number of connections (possible)
   cControls As Long              '  number of controls at this line
   szShortName As String * MIXER_SHORT_NAME_CHARS
   szName As String * MIXER_LONG_NAME_CHARS
   dwType As Long
   dwDeviceID As Long
   wMid  As Integer
   wPid As Integer
   vDriverVersion As Long
   szPname As String * MAXPNAMELEN
End Type

Declare Function auxGetNumDevs Lib "winmm.dll" () As Long


Function GetMixerControl(ByVal hmixer As Long, _
                        ByVal componentType As Long, _
                        ByVal ctrlType As Long, _
                        ByRef mxc As MIXERCONTROL) As Boolean
                        
' This function attempts to obtain a mixer control. Returns True if successful.
   Dim mxlc As MIXERLINECONTROLS
   Dim mxl As MIXERLINE
   Dim hMem As Long
   Dim rc As Long
       
   mxl.cbStruct = Len(mxl)
   mxl.dwComponentType = componentType
   ' Obtain a line corresponding to the component type
   rc = mixerGetLineInfo(hmixer, mxl, MIXER_GETLINEINFOF_COMPONENTTYPE)
   If (MMSYSERR_NOERROR = rc) Then
       mxlc.cbStruct = Len(mxlc)
       mxlc.dwLineID = mxl.dwLineID
       mxlc.dwControl = ctrlType
       mxlc.cControls = 1
       mxlc.cbmxctrl = Len(mxc)
       ' Allocate a buffer for the control
       hMem = GlobalAlloc(&H40, Len(mxc))
       mxlc.pamxctrl = GlobalLock(hMem)
       mxc.cbStruct = Len(mxc)
       ' Get the control
       rc = mixerGetLineControls(hmixer, mxlc, MIXER_GETLINECONTROLSF_ONEBYTYPE)
       If (MMSYSERR_NOERROR = rc) Then
           GetMixerControl = True
           ' Copy the control into the destination structure
           CopyStructFromPtr mxc, mxlc.pamxctrl, Len(mxc)
       Else
           GetMixerControl = False
       End If
       GlobalFree (hMem)
       Exit Function
   End If
   GetMixerControl = False
End Function

Function GetVolumeControlValue(ByVal hmixer As Long, mxc As MIXERCONTROL) As Long
'This function Gets the value for a volume control. Returns True if successful
    Dim mxcd As MIXERCONTROLDETAILS
    Dim vol As MIXERCONTROLDETAILS_UNSIGNED
    
    mxcd.cbStruct = Len(mxcd)
    mxcd.dwControlID = mxc.dwControlID
    mxcd.cChannels = 1
    mxcd.Item = 0
    mxcd.cbDetails = Len(vol)
    mxcd.paDetails = 0
    hMem = GlobalAlloc(&H40, Len(vol))
    mxcd.paDetails = GlobalLock(hMem)
    rc = mixerGetControlDetails(hmixer, mxcd, MIXER_GETCONTROLDETAILSF_VALUE)
    CopyStructFromPtr vol, mxcd.paDetails, Len(vol)
    GlobalFree (hMem)
    If (MMSYSERR_NOERROR = rc) Then
       GetVolumeControlValue = vol.dwValue
    Else
        GetVolumeControlValue = -1
    End If
End Function

Function SetVolumeControl(ByVal hmixer As Long, mxc As MIXERCONTROL, ByVal volume As Long) As Boolean
   Dim mxcd As MIXERCONTROLDETAILS
   Dim vol As MIXERCONTROLDETAILS_UNSIGNED
   
   mxcd.cbStruct = Len(mxcd)
   mxcd.dwControlID = mxc.dwControlID
   mxcd.cChannels = 1
   mxcd.Item = 0
   mxcd.cbDetails = Len(vol)
   hMem = GlobalAlloc(&H40, Len(vol))
   mxcd.paDetails = GlobalLock(hMem)
   vol.dwValue = volume
   ' Copy the data into the control value buffer
   CopyPtrFromStruct mxcd.paDetails, vol, Len(vol)
   rc = mixerSetControlDetails(hmixer, mxcd, MIXER_SETCONTROLDETAILSF_VALUE)
   GlobalFree (hMem)
   If (MMSYSERR_NOERROR = rc) Then
       SetVolumeControl = True
   Else
       SetVolumeControl = False
   End If
End Function

Function SetMuteControl(ByVal hmixer As Long, mxc As MIXERCONTROL, mute As Boolean) As Boolean
   Dim mxcd As MIXERCONTROLDETAILS
   Dim vol As MIXERCONTROLDETAILS_UNSIGNED
   
   mxcd.cbStruct = Len(mxcd)
   mxcd.dwControlID = mxc.dwControlID
   mxcd.cChannels = 1
   mxcd.Item = 0
   mxcd.cbDetails = Len(vol)
   hMem = GlobalAlloc(&H40, Len(vol))
   mxcd.paDetails = GlobalLock(hMem)
   vol.dwValue = volume
   CopyPtrFromStruct mxcd.paDetails, vol, Len(vol)
   rc = mixerSetControlDetails(hmixer, mxcd, MIXER_SETCONTROLDETAILSF_VALUE)
   GlobalFree (hMem)
   If (MMSYSERR_NOERROR = rc) Then
       SetMuteControl = True
   Else
       SetMuteControl = False
   End If
End Function

Function unSetMuteControl(ByVal hmixer As Long, mxc As MIXERCONTROL, ByVal unmute As Long) As Boolean
   Dim mxcd As MIXERCONTROLDETAILS
   Dim vol As MIXERCONTROLDETAILS_UNSIGNED
   
   mxcd.cbStruct = Len(mxcd)
   mxcd.dwControlID = mxc.dwControlID
   mxcd.cChannels = 1
   mxcd.Item = 0
   mxcd.cbDetails = Len(vol)
   hMem = GlobalAlloc(&H40, Len(vol))
   mxcd.paDetails = GlobalLock(hMem)
   vol.dwValue = unmute
   CopyPtrFromStruct mxcd.paDetails, vol, Len(vol)
   rc = mixerSetControlDetails(hmixer, mxcd, MIXER_SETCONTROLDETAILSF_VALUE)
   GlobalFree (hMem)
   If (MMSYSERR_NOERROR = rc) Then
       unSetMuteControl = True
   Else
       unSetMuteControl = False
   End If
End Function

Public Function SoundCardExits() As Boolean
Dim i As Integer

   i = auxGetNumDevs()
   If i <> 0 Then
      SoundCardExits = True
   Else
      SoundCardExits = False
   End If
End Function

