Imports System.Windows.Forms
Imports System.Net
Imports System.Text

Public Class RazorScanner

    Private wc As New System.Net.WebClient ' The webclient that will be used to interact with the API
    Private Const N As String = vbNewLine ' Just some random stuff so I had to write less ^-^

    Public Sub Scan(ByVal Username As String, ByVal Key As String, ByVal File As String)
        AddHandler wc.UploadFileCompleted, AddressOf uploadDone
        AddHandler wc.UploadProgressChanged, AddressOf progressChanged
        Try
            frmMain.lstScan.Items.Add("Scanning...")
            wc.QueryString.Add("username", Username)
            wc.QueryString.Add("secret", Key)
            wc.QueryString.Add("api", "file")
            wc.UploadFileAsync(New Uri("http://s2.razorscanner.com/public_api.php"), "POST", File)
        Catch ex As WebException
            MessageBox.Show("An error occured!" & N & N & ex.ToString, "RazorScanner", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub uploadDone(sender As Object, e As UploadFileCompletedEventArgs)
        Dim Result As String = Encoding.UTF8.GetString(e.Result)
        frmMain.lstScan.Items.Clear()
        Result = Result.Replace("{", "")
        Result = Result.Replace("}", "")
        Result = Result.Replace(Chr(34), "")
        Dim lsplit() As String = Result.Split(",")
        Dim rsplit() As String
        Dim lvi As New ListViewItem
        For i = 0 To 59
            rsplit = lsplit(i).Split(":")
            frmMain.lstScan.Items.Add(rsplit(0))
            frmMain.lstScan.Items(frmMain.lstScan.Items.Count - 1).SubItems.Add(rsplit(1))
            If rsplit(1).ToLower = "ok" Then
                frmMain.lstScan.Items(frmMain.lstScan.Items.Count - 1).ForeColor = Color.Green
            Else
                frmMain.lstScan.Items(frmMain.lstScan.Items.Count - 1).ForeColor = Color.Red
            End If
        Next
    End Sub

    Private Sub progressChanged(sender As Object, e As UploadProgressChangedEventArgs)
        ' Here you can put some increment for your Progressbar
    End Sub

End Class