Public Class ThumbNail
    Dim p As New Panel
    Dim pb As New PictureBox
    Dim l As New Label
    Dim cs As New ContextMenuStrip
    Dim itemtag As Object
#Region "Properties"
    Public Property Image As System.Drawing.Image
        Set(value As System.Drawing.Image)
            pb.Image = value
        End Set
        Get
            Return pb.Image
        End Get
    End Property
    Public Property caption As String
        Get
            Return l.Text
        End Get
        Set(value As String)
            l.Text = value
        End Set
    End Property
    Public Property LocationX As Integer
        Get
            Return p.Location.X
        End Get
        Set(value As Integer)
            p.Location = New Point(value, p.Location.Y)
        End Set
    End Property
    Public Property LocationY As Integer
        Get
            Return p.Location.Y
        End Get
        Set(value As Integer)
            p.Location = New Point(p.Location.X, value)
        End Set
    End Property
    Public Property ContextMenuStrip As ContextMenuStrip
        Set(value As ContextMenuStrip)
            cs = value
        End Set
        Get
            Return cs
        End Get
    End Property
    Public Property Tag
        Get
            Return itemtag
        End Get
        Set(value)
            itemtag = value
        End Set
    End Property
#End Region
    Public Sub NewThumbnail()
        With p
            .ContextMenuStrip = cs
            .BackColor = Color.White
            .BorderStyle = BorderStyle.FixedSingle
            .Size = New Size(274, 190)
            .Location = New Point(LocationX, LocationY)
        End With
        With pb
            .ContextMenuStrip = cs
            .SizeMode = PictureBoxSizeMode.StretchImage
            .Size = New Size(242, 152)
            .Location = New Point(15, 13)
            .Image = Image
        End With
        With l
            .ContextMenuStrip = cs
            .Text = caption
            .TextAlign = ContentAlignment.MiddleCenter
            .Size = New Size(242, 13)
            .Location = New Point(15, 170)
        End With
        With p.Controls
            .Add(pb)
            .Add(l)
        End With

        AddHandler p.MouseEnter, AddressOf ChangeColortoBlue
        AddHandler p.MouseLeave, AddressOf ChangeColortoWhite
        AddHandler pb.MouseEnter, AddressOf ChangeColortoBlue
        AddHandler pb.MouseLeave, AddressOf ChangeColortoWhite
        AddHandler l.MouseEnter, AddressOf ChangeColortoBlue
        AddHandler l.MouseLeave, AddressOf ChangeColortoWhite
        AddHandler cs.Closed, AddressOf rightclick_Closed
        AddHandler cs.Opened, AddressOf rightclick_Opened

        With Thumbnails.Panel1.Controls
            .Add(p)
        End With
    End Sub
#Region "Events"
    Private Sub ChangeColortoBlue()
        p.BackColor = Color.FromArgb(229, 243, 251)
    End Sub
    Private Sub ChangeColortoWhite()
        If Not cs.Visible = True Then
            p.BackColor = Color.White
        End If
    End Sub
    Private Sub rightclick_Closed(sender As Object, e As ToolStripDropDownClosedEventArgs)
        p.BackColor = Color.White
    End Sub
    Private Sub rightclick_Opened(sender As Object, e As EventArgs)
        p.BackColor = Color.FromArgb(203, 232, 246)
    End Sub
#End Region
End Class
