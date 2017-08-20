Imports System.Runtime.InteropServices
Module APIs
    Const EM_SETCUEBANNER As Integer = &H1501
    <DllImport("user32.dll", CharSet:=CharSet.Auto)> _
    Private Function SendMessage(ByVal hWnd As IntPtr, ByVal msg As Integer, ByVal wParam As Integer, <MarshalAs(UnmanagedType.LPWStr)> ByVal lParam As String) As Int32
    End Function
    Public Sub SetCueText(ByRef textbox As List(Of TextBox), ByVal CueText As List(Of String))
        For i As Integer = 0 To textbox.Count - 1
            SendMessage(textbox(i).Handle, EM_SETCUEBANNER, 1, CueText(i))
        Next
    End Sub
End Module
