Module GlobalFunctions
    Public Sub Notify(ByRef tray As NotifyIcon, ByVal Title As String, ByVal Text As String, ByVal icon As ToolTipIcon, ByVal time As Integer, Optional ByVal path As String = Nothing)
        tray.BalloonTipIcon = icon
        tray.BalloonTipText = Text
        tray.BalloonTipTitle = Title
        tray.ShowBalloonTip(time * 1000)
        If (path <> Nothing) Then
            AddHandler tray.BalloonTipClicked, AddressOf OpenPath
            sPath = path
        End If
    End Sub
    Private sPath As String
    Private Sub OpenPath(ByVal sender As Object, ByVal e As EventArgs)
        Process.Start("explorer.exe", sPath)
    End Sub
End Module
