Imports System.Threading
Imports System.Net
Public Class MapView
    Dim web As New WebClient
    Public connected As String
    Dim positions As String
    Dim x As New Thread(AddressOf getmap)
    Delegate Sub WriteTextDelegate(ByVal Text As String)
    Private Sub MapView_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        PictureBox1.SizeMode = PictureBoxSizeMode.CenterImage
        PictureBox1.Image = My.Resources._488
        x.Start()
    End Sub
    Function displayinfo(ByVal info As String)
        Dim ip As String = info.Split(";")(0)
        Dim countrycode As String = info.Split(";")(1)
        Dim country As String = info.Split(";")(2)
        Dim province As String = info.Split(";")(3)
        Dim city As String = info.Split(";")(4)
        Dim zip As String = info.Split(";")(5)
        Dim lat As String = info.Split(";")(6)
        Dim lng As String = info.Split(";")(7)
        Dim gtm As String = info.Split(";")(8)

        Return "IP: " & ip & vbCrLf & "CountryCode: " & countrycode & vbCrLf & "Country: " & country & vbCrLf & "Province: " & province & vbCrLf & "City: " & city & vbCrLf & "Zip / Postal Code: " & zip & vbCrLf & "Latitude: " & lat & vbCrLf & "Longitude: " & lng & vbCrLf & "GMT: " & gtm & vbCrLf
    End Function
    Sub getmap()
        On Error Resume Next
        If Form1.CountCharacter(connected, "|") > 1 Then
            For i = 0 To Form1.CountCharacter(connected, "|") - 1
                Dim info As String = web.DownloadString("http://api.ipinfodb.com/v3/ip-city/?key=2800d97df94929ecca12c4ec7f15a1dae8e4964f2d29e7353dc41a27aaf11f16&ip=" & connected.Split("|")(i))
                info = info.Remove(0, 4)
                positions += "|" & info.Split(";")(6) & "," & info.Split(";")(7)
            Next
            positions = positions.Remove(0, 1)
            My.Computer.Clipboard.SetText("http://maps.google.com/maps/api/staticmap?center=1,1&zoom=4&markers=color:red|" & positions & "&size=538x295&sensor=false")
            PictureBox1.Image = ByteArray2Image(web.DownloadData("http://maps.google.com/maps/api/staticmap?center=1,1&zoom=1&markers=color:red|" & positions & "&size=538x295&sensor=false"))
            PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
        Else
            connected = connected.Replace("|", "")
            Dim info As String = web.DownloadString("http://api.ipinfodb.com/v3/ip-city/?key=2800d97df94929ecca12c4ec7f15a1dae8e4964f2d29e7353dc41a27aaf11f16&ip=" & connected)
            info = info.Remove(0, 4)
            Me.Invoke(New WriteTextDelegate(AddressOf writetext), displayinfo(info))
            PictureBox1.Image = ByteArray2Image(web.DownloadData("http://maps.google.com/maps/api/staticmap?center=" & info.Split(";")(6) & "," & info.Split(";")(7) & "&zoom=4&markers=color:red|" & info.Split(";")(6) & "," & info.Split(";")(7) & "&size=538x295&sensor=false"))
            PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage

            labelinfo.Location = New Point(12, 12)
            labelinfo.BackColor = Color.White
            labelinfo.AutoSize = True
            labelinfo.Show()
            PictureBox1.Controls.Add(labelinfo)
        End If
    End Sub
    Sub writetext(ByVal text As String)
        labelinfo.Text = text
    End Sub
    Public Function ByteArray2Image(ByVal ByAr() As Byte) As Image
        Dim img As Image
        Dim MS As New IO.MemoryStream(ByAr)
        Return Image.FromStream(MS)
    End Function
End Class