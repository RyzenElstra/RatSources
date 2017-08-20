Option Strict On
Imports System.Drawing.Text
Imports System.Drawing.Drawing2D
Class CodePlexTabControl
    Inherits TabControl
    Dim SideOffset As Integer = 3
    Sub New()
        SetStyle(DirectCast(139286, ControlStyles), True)
        SetStyle(ControlStyles.Selectable, False)

        SizeMode = TabSizeMode.Fixed
        Alignment = TabAlignment.Top
        ItemSize = New Size(140, 41)

        DrawMode = TabDrawMode.OwnerDrawFixed

        Font = New Font("Segoe UI", 10)
        _Colors.AddRange({Color.FromArgb(94, 168, 222), Color.FromArgb(255, 90, 226), Color.FromArgb(44, 54, 255), Color.FromArgb(123, 79, 157), Color.FromArgb(255, 0, 180), Color.FromArgb(158, 0, 217)})
    End Sub

    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        Dim B As Bitmap = New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)
        G.TextRenderingHint = TextRenderingHint.ClearTypeGridFit

        G.Clear(Parent.BackColor)


        For i = 0 To TabCount - 1
            Dim TR As Rectangle = GetTabRect(i)
            Dim DrawTR As Rectangle = New Rectangle(TR.X + SideOffset, TR.Y, TR.Width - (2 * SideOffset), 32)
            Dim BGCol As Color = Color.FromArgb(240, 241, 244)
            Dim BGLine As Color = Color.FromArgb(216, 217, 220)
            G.FillRectangle(New SolidBrush(BGCol), DrawTR)
            G.DrawRectangle(New Pen(BGCol), DrawTR)
            For p = 0 To 2
                G.DrawLine(New Pen(BGLine), DrawTR.X, DrawTR.Y + DrawTR.Height - p, DrawTR.X + DrawTR.Width, DrawTR.Y + DrawTR.Height - p)
            Next
            Dim DrawString As String = TabPages(i).Text.ToUpper
            Dim DrawSize As SizeF = G.MeasureString(DrawString, Font)

            G.DrawString(DrawString, Font, New SolidBrush(Color.FromArgb(30, 30, 30)), DrawTR.X + 10, DrawTR.Y + CInt(DrawTR.Height / 2 - DrawSize.Height / 2))

        Next

        If True Then
            Try
                Dim TR As Rectangle = GetTabRect(RealIndex)
                Dim DrawTR As Rectangle = New Rectangle(TR.X + SideOffset + MarginX, TR.Y, TR.Width - (2 * SideOffset), 32)
                Dim BGCol As Color = CombineColor(Color1, Color2, ColorRatio)
                Dim BGLine As Color = ModColor(BGCol)
                G.FillRectangle(New SolidBrush(BGCol), DrawTR)
                G.DrawRectangle(New Pen(BGCol), DrawTR)

                For p = 0 To 2
                    G.DrawLine(New Pen(BGLine), DrawTR.X, DrawTR.Y + DrawTR.Height - p, DrawTR.X + DrawTR.Width, DrawTR.Y + DrawTR.Height - p)
                Next

                Dim DrawString As String = TabPages(SelectedIndex).Text.ToUpper
                Dim DrawSize As SizeF = G.MeasureString(DrawString, Font)

                G.DrawString(DrawString, Font, Brushes.White, New Point(DrawTR.X + 10, DrawTR.Y + CInt(DrawTR.Height / 2 - DrawSize.Height / 2)))

                Dim _X As Integer = DrawTR.X + 22
                Dim _Y As Integer = 35
                Dim GP As GraphicsPath = New GraphicsPath(FillMode.Alternate)
                GP.AddLine(_X, _Y, _X + 9, _Y + 9)
                GP.AddLine(_X + 9, _Y + 9, _X + 18, _Y)
                GP.CloseFigure()
                G.FillPath(New SolidBrush(BGLine), GP)
            Catch ex As Exception

            End Try
        End If

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose()
        B.Dispose()

    End Sub
    Dim ColorRatio As Double = 0
    Dim Color1 As Color = Color.FromArgb(94, 168, 222)
    Dim Color2 As Color = Color1
    Dim _Colors As List(Of Color) = New List(Of Color)
    Function ModColor(c As Color) As Color
        Return Color.FromArgb(CInt(IIf(c.R - 16 < 0, 0, c.R - 16)), CInt(IIf(c.G - 16 < 0, 0, c.G - 16)), CInt(IIf(c.B - 16 < 0, 0, c.B - 16)))
    End Function
    Function CombineColor(c1 As Color, c2 As Color, ratio As Double) As Color
        Return Color.FromArgb(CInt((c1.R * (1 - ratio)) + (c2.R * ratio)), CInt((c1.G * (1 - ratio)) + (c2.G * ratio)), CInt((c1.B * (1 - ratio)) + (c2.B * ratio)))
    End Function
    Dim WithEvents T As Timer = New Timer With {.Enabled = False, .Interval = 1}
    Dim CurVal As Double = 0
    Sub StopTimer()
        T.Stop()
        PrevIndex = GotoIndex
        SelectedIndex = GotoIndex
        TotalPixelMove = 0
        MarginX = 0
        RealIndex = GotoIndex
    End Sub
    Dim RealIndex As Integer = 0
    Dim TotalTime As Double = 0.16
    Sub Tick() Handles T.Tick
        If CurVal > TotalTime - 0.01 Then
            StopTimer()
        Else
            CurVal += 0.01
            MarginX = CInt((CurVal / TotalTime) * TotalPixelMove)
            ColorRatio = CurVal / TotalTime
        End If
        Invalidate()
    End Sub
    Dim TotalPixelMove As Integer = 0
    Dim MarginX As Integer = 0
    Sub ZoomTo(ind As Integer)
        GotoIndex = ind

        Dim OldTabRectTemp As Rectangle = GetTabRect(RealIndex)
        Dim OldTabRect As Rectangle = New Rectangle(OldTabRectTemp.X + SideOffset, OldTabRectTemp.Y, OldTabRectTemp.Width - (2 * SideOffset), 32)

        Dim NewTabRectTemp As Rectangle = GetTabRect(ind)
        Dim NewTabRect As Rectangle = New Rectangle(NewTabRectTemp.X + SideOffset, NewTabRectTemp.Y, NewTabRectTemp.Width - (2 * SideOffset), 32)


        TotalPixelMove = CInt((NewTabRect.X + (NewTabRect.Width / 2)) - (OldTabRect.X + (OldTabRect.Width / 2)))

        CurVal = 0

        Color1 = Color2
        Color2 = _Colors(CInt(((ind + 1) - ((Math.Ceiling((ind + 1) / _Colors.Count) - 1) * _Colors.Count)) - 1))


        T.Start()


    End Sub
    Dim PrevIndex As Integer = 0
    Public GotoIndex As Integer = -1337
    Private Sub CodePlexTabControl_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Me.SelectedIndexChanged
        T.Stop()

        ZoomTo(SelectedIndex)
    End Sub
End Class