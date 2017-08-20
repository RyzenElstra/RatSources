VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Cmdlg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private Type OPENFILENAME
    nStructSize As Long
    hwndOwner As Long
    hInstance As Long
    sFilter As String
    sCustomFilter As String
    nCustFilterSize As Long
    nFilterIndex As Long
    sFile As String
    nFileSize As Long
    sFileTitle As String
    nTitleSize As Long
    sInitDir As String
    sDlgTitle As String
    Flags As Long
    nFileOffset As Integer
    nFileExt As Integer
    sDefFileExt As String
    nCustDataSize As Long
    fnHook As Long
    sTemplateName As String
 End Type
 
Private Const OFN_ALLOWMULTISELECT = &H200
Private Const FNERR_INVALIDFILENAME = &H3002
Private Const FNERR_BUFFERTOOSMALL = &H3003

Private OFN As OPENFILENAME

Private Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
   
Private Declare Function CommDlgExtendedError Lib "comdlg32.dll" () As Long
Private Declare Function GetShortPathName Lib "kernel32" Alias "GetShortPathNameA" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long

Private m_bShowSave As Boolean
Private m_bCancelError As Boolean
Private m_sDefaultExtension As String
Private m_sDialogTitle As String
Private m_sFilename As String
Private m_sFiletitle As String
Private m_iFilterIndex As Integer
Private m_sInitDir As String
Private m_sFilter As String
Private m_bCancelPressed As Boolean
Private m_sFileExtension As String
Private m_lFlags As Long
Private m_bMultiSelect As Boolean
Private m_iMaxFileSize As Integer

Public Sub ShowOpen()
  Dim ret&

  Call Initialize
  ret = GetOpenFileName(OFN)
  Call HandleReturn(ret)

End Sub

Public Sub ShowSave()
  Dim ret&

  m_bShowSave = True
  Call Initialize
  ret = GetSaveFileName(OFN)
  Call HandleReturn(ret)

End Sub

Private Sub Initialize()
  OFN.nStructSize = Len(OFN)

  OFN.sFilter = m_sFilter
  OFN.nFilterIndex = m_iFilterIndex

  If m_sFilename = vbNullString Then
    OFN.sFile = Chr(0) & Space$(m_iMaxFileSize)
  Else
    OFN.sFile = m_sFilename & Space$(m_iMaxFileSize)
  End If

  OFN.nFileSize = Len(OFN.sFile)

  If m_sDefaultExtension <> vbNullString Then OFN.sDefFileExt = m_sDefaultExtension

  OFN.sFileTitle = Space$(m_iMaxFileSize / 2)
  OFN.nTitleSize = Len(OFN.sFileTitle)
  OFN.sInitDir = m_sInitDir
  OFN.sDlgTitle = m_sDialogTitle
  OFN.Flags = m_lFlags
End Sub

Private Sub HandleReturn(lReturn As Long)
  Dim lError&

  If lReturn > 0 Then
    
    Let Filename = RTrim(OFN.sFile)
    Let Filetitle = OFN.sFileTitle

    If m_bShowSave = True Then m_bShowSave = False
    

    If Asc(Mid$(OFN.sFile, (InStr(OFN.sFile, Chr(0))) + 1, 1)) = 0 And (OFN_ALLOWMULTISELECT = OFN_ALLOWMULTISELECT And OFN.Flags) Then
      m_sFileExtension = Mid$(OFN.sFile, OFN.nFileExt + 1, Len(OFN.sFile) - OFN.nFileExt)
      m_bMultiSelect = False
    Else
      m_bMultiSelect = True
      m_sFileExtension = ""
    End If
    If Not OFN_ALLOWMULTISELECT = (OFN_ALLOWMULTISELECT And OFN.Flags) Then m_bMultiSelect = False
    
    m_bCancelPressed = False
  Else
    lError = CommDlgExtendedError()
      If lError > 0 Then
        Select Case lError
          Case FNERR_BUFFERTOOSMALL

           
          Case FNERR_INVALIDFILENAME
            
          Case Else
             Err.Raise 666, , "The Devil you say...."
        End Select
      End If
    Let Filename = ""
    Let Filetitle = ""
    m_sFileExtension = ""
    m_bCancelPressed = True
    m_bMultiSelect = False
  End If
  
End Sub


Public Property Let InitDir(ByVal sInitDir As String)

  m_sInitDir = sInitDir
    
End Property

Public Property Get InitDir() As String

  InitDir = m_sInitDir
  
End Property

Public Property Let FilterIndex(ByVal iFilterIndex As Integer)
 
 If iFilterIndex = 0 Then iFilterIndex = 1
 m_iFilterIndex = iFilterIndex
 
End Property

Public Property Get FilterIndex() As Integer

  FilterIndex = m_iFilterIndex
  
End Property

Public Property Let Filetitle(ByVal sFileTitle As String)

  m_sFiletitle = sFileTitle
    
End Property

Public Property Get Filetitle() As String
    
  Filetitle = m_sFiletitle
  
End Property

Public Property Let Filename(ByVal sFilename As String)
    
  m_sFilename = sFilename
  
End Property

Public Property Get Filename() As String

  Filename = m_sFilename
    
End Property

Public Property Let DialogTitle(ByVal sDialogTitle As String)

  m_sDialogTitle = sDialogTitle
  
End Property

Public Property Get DialogTitle() As String

  DialogTitle = m_sDialogTitle
  
End Property

Public Property Let DefaultExtension(ByVal sDefaultExtension As String)

  m_sDefaultExtension = sDefaultExtension
    
End Property

Public Property Get DefaultExtension() As String

  DefaultExtension = m_sDefaultExtension
  
End Property

Public Property Get CancelPressed() As Boolean

  CancelPressed = m_bCancelPressed
  
End Property

Public Property Get FileExtension() As String

  FileExtension = m_sFileExtension
  
End Property

Public Property Get MultiSelect() As Boolean

  MultiSelect = m_bMultiSelect
 
End Property

Public Property Let Filter(ByVal sFilter As String)

  m_sFilter = sFilter
  
End Property

Public Property Let Flags(ByVal lFlags As Long)

  m_lFlags = lFlags
  
End Property

Public Property Let MaxFileSize(ByVal iMaxFileSize As Integer)

  If iMaxFileSize < 1024 Then iMaxFileSize = 1024
  m_iMaxFileSize = iMaxFileSize

End Property


Private Sub Class_Initialize()
  m_bMultiSelect = False
  m_bShowSave = False
  MaxFileSize = 2048
  InitDir = ""
  FilterIndex = 1
  Filetitle = ""
  Filename = ""
  DialogTitle = App.Path
  DefaultExtension = ""
  Filter = "All Files (*.*)" & Chr(0) & "*.*" & Chr(0) & Chr(0)
End Sub
