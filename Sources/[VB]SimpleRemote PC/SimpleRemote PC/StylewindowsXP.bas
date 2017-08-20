Attribute VB_Name = "StylewindowsXP"
Declare Function InitCommonControls Lib "Comctl32.dll" () As Long

Sub cMain()
InitCommonControls
XPStyle
End Sub
Function XPStyle(Optional AutoRestart As Boolean = True, Optional CreateNew As Boolean) As Boolean
InitCommonControls
On Error Resume Next
Dim XML             As String
Dim ManifestCheck   As String
Dim strManifest     As String
Dim FreeFileNo      As Integer

If AutoRestart = True Then CreateNew = False
XML = ("<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?> " & vbCrLf & "<assembly " & vbCrLf & "   xmlns=""urn:schemas-microsoft-com:asm.v1"" " & vbCrLf & "   manifestVersion=""1.0"">" & vbCrLf & "<assemblyIdentity " & vbCrLf & "    processorArchitecture=""x86"" " & vbCrLf & "    version=""EXEVERSION""" & vbCrLf & "    type=""win32""" & vbCrLf & "    name=""EXENAME""/>" & vbCrLf & "    <description>EXEDESCRIBTION</description>" & vbCrLf & "    <dependency>" & vbCrLf & "    <dependentAssembly>" & vbCrLf & "    <assemblyIdentity" & vbCrLf & "         type=""win32""" & vbCrLf & "         name=""Microsoft.Windows.Common-Controls""" & vbCrLf & "         version=""6.0.0.0""" & vbCrLf & "         publicKeyToken=""6595b64144ccf1df""" & vbCrLf & "         language=""*""" & vbCrLf & "         processorArchitecture=""x86""/>" & vbCrLf & "    </dependentAssembly>" & vbCrLf & "    </dependency>" & vbCrLf & "</assembly>" & vbCrLf & "")
strManifest = App.Path & "\" & App.EXEName & ".exe.manifest"
ManifestCheck = Dir(strManifest, vbNormal + vbSystem + vbHidden + vbReadOnly + vbArchive)
If ManifestCheck = "" Or CreateNew = True Then
XML = Replace(XML, "EXENAME", App.EXEName & ".exe")
XML = Replace(XML, "EXEVERSION", App.Major & "." & App.Minor & "." & App.Revision & ".0")
XML = Replace(XML, "EXEDESCRIBTION", App.FileDescription)
FreeFileNo = FreeFile
If ManifestCheck <> "" Then
SetAttr strManifest, vbNormal
Kill strManifest
End If
Open strManifest For Binary As #(FreeFileNo)
Put #(FreeFileNo), , XML
Close #(FreeFileNo)
SetAttr strManifest, vbHidden + vbSystem
If ManifestCheck = "" Then
XPStyle = False
Else
XPStyle = True
End If
If AutoRestart = True Then
Shell App.Path & "\" & App.EXEName & ".exe " & Command$, vbNormalFocus
End
End If
Else
XPStyle = True
End If
End Function

