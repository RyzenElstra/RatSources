Imports System.Drawing.Drawing2D
Class DotNetBarTabcontrol
    Inherits TabControl

    Sub New()
        SetStyle(ControlStyles.AllPaintingInWmPaint Or ControlStyles.ResizeRedraw Or ControlStyles.UserPaint Or ControlStyles.DoubleBuffer, True)
        DoubleBuffered = True
        SizeMode = TabSizeMode.Fixed
        ItemSize = New Size(44, 136)
    End Sub
    Protected Overrides Sub CreateHandle()
        MyBase.CreateHandle()
        Alignment = TabAlignment.Left
    End Sub

    Function ToPen(ByVal color As Color) As Pen
        Return New Pen(color)
    End Function

    Function ToBrush(ByVal color As Color) As Brush
        Return New SolidBrush(color)
    End Function

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        Dim B As New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)
        Try : SelectedTab.BackColor = Color.White : Catch : End Try
        G.Clear(Color.White)
        G.FillRectangle(New SolidBrush(Color.FromArgb(246, 248, 252)), New Rectangle(0, 0, ItemSize.Height + 4, Height))
        'G.DrawLine(New Pen(Color.FromArgb(170, 187, 204)), New Point(Width - 1, 0), New Point(Width - 1, Height - 1))    'comment out to get rid of the borders
        'G.DrawLine(New Pen(Color.FromArgb(170, 187, 204)), New Point(ItemSize.Height + 1, 0), New Point(Width - 1, 0))                   'comment out to get rid of the borders
        'G.DrawLine(New Pen(Color.FromArgb(170, 187, 204)), New Point(ItemSize.Height + 3, Height - 1), New Point(Width - 1, Height - 1)) 'comment out to get rid of the borders
        G.DrawLine(New Pen(Color.FromArgb(170, 187, 204)), New Point(ItemSize.Height + 3, 0), New Point(ItemSize.Height + 3, 999))
        For i = 0 To TabCount - 1
            If i = SelectedIndex Then
                Dim x2 As Rectangle = New Rectangle(New Point(GetTabRect(i).Location.X - 2, GetTabRect(i).Location.Y - 2), New Size(GetTabRect(i).Width + 3, GetTabRect(i).Height - 1))
                Dim myBlend As New ColorBlend()
                myBlend.Colors = {Color.FromArgb(232, 232, 240), Color.FromArgb(232, 232, 240), Color.FromArgb(232, 232, 240)}
                myBlend.Positions = {0.0F, 0.5F, 1.0F}
                Dim lgBrush As New LinearGradientBrush(x2, Color.Black, Color.Black, 90.0F)
                lgBrush.InterpolationColors = myBlend
                G.FillRectangle(lgBrush, x2)
                G.DrawRectangle(New Pen(Color.FromArgb(170, 187, 204)), x2)


                G.SmoothingMode = SmoothingMode.HighQuality
                Dim p() As Point = {New Point(ItemSize.Height - 3, GetTabRect(i).Location.Y + 20), New Point(ItemSize.Height + 4, GetTabRect(i).Location.Y + 14), New Point(ItemSize.Height + 4, GetTabRect(i).Location.Y + 27)}
                G.FillPolygon(Brushes.White, p)
                G.DrawPolygon(New Pen(Color.FromArgb(170, 187, 204)), p)

                If ImageList IsNot Nothing Then
                    Try
                        If ImageList.Images(TabPages(i).ImageIndex) IsNot Nothing Then

                            G.DrawImage(ImageList.Images(TabPages(i).ImageIndex), New Point(x2.Location.X + 8, x2.Location.Y + 6))
                            G.DrawString("      " & TabPages(i).Text, Font, Brushes.DimGray, x2, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
                        Else
                            G.DrawString(TabPages(i).Text, New Font(Font.FontFamily, Font.Size, FontStyle.Bold), Brushes.DimGray, x2, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
                        End If
                    Catch ex As Exception
                        G.DrawString(TabPages(i).Text, New Font(Font.FontFamily, Font.Size, FontStyle.Bold), Brushes.DimGray, x2, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
                    End Try
                Else
                    G.DrawString(TabPages(i).Text, New Font(Font.FontFamily, Font.Size, FontStyle.Bold), Brushes.DimGray, x2, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
                End If

                G.DrawLine(New Pen(Color.FromArgb(200, 200, 250)), New Point(x2.Location.X - 1, x2.Location.Y - 1), New Point(x2.Location.X, x2.Location.Y))
                G.DrawLine(New Pen(Color.FromArgb(200, 200, 250)), New Point(x2.Location.X - 1, x2.Bottom - 1), New Point(x2.Location.X, x2.Bottom))
            Else
                Dim x2 As Rectangle = New Rectangle(New Point(GetTabRect(i).Location.X - 2, GetTabRect(i).Location.Y - 2), New Size(GetTabRect(i).Width + 3, GetTabRect(i).Height + 1))
                G.FillRectangle(New SolidBrush(Color.FromArgb(246, 248, 252)), x2)
                G.DrawLine(New Pen(Color.FromArgb(170, 187, 204)), New Point(x2.Right, x2.Top), New Point(x2.Right, x2.Bottom))
                If ImageList IsNot Nothing Then
                    Try
                        If ImageList.Images(TabPages(i).ImageIndex) IsNot Nothing Then
                            G.DrawImage(ImageList.Images(TabPages(i).ImageIndex), New Point(x2.Location.X + 8, x2.Location.Y + 6))
                            G.DrawString("      " & TabPages(i).Text, Font, Brushes.DimGray, x2, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
                        Else
                            G.DrawString(TabPages(i).Text, Font, Brushes.DimGray, x2, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
                        End If
                    Catch ex As Exception
                        G.DrawString(TabPages(i).Text, Font, Brushes.DimGray, x2, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
                    End Try
                Else
                    G.DrawString(TabPages(i).Text, Font, Brushes.DimGray, x2, New StringFormat With {.LineAlignment = StringAlignment.Center, .Alignment = StringAlignment.Center})
                End If
            End If
        Next

        e.Graphics.DrawImage(B.Clone, 0, 0)
        G.Dispose() : B.Dispose()
    End Sub
End Class