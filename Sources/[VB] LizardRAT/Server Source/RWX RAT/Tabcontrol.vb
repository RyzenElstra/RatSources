Option Strict On
Imports System.Drawing.Text
Imports System.Drawing.Drawing2D
'--[=============================LEAVE CREDITS IN SOURCE============================]--'
'--[                               CodePlex TabControl                              ]--'
'--[ Author: Temploit                                                               ]--'
'--[ This control may not be redistributed without permission                       ]--'
'--[                                                                                ]--'
'--[================================================================================]--'

Class CodePlexTabControl
    Inherits TabControl
    Private SideOffset As Integer = 3
    Dim WithEvents T As Timer = New Timer With {.Enabled = False, .Interval = 1}
    Private TotalChangeTime As Double = 0.16

    Private TabColors() As Color = {Color.FromArgb(94, 168, 222)}
    Private UnSelected_Background As Color = Color.FromArgb(240, 241, 244)
    Private UnSelected_Underline As Color = Color.FromArgb(216, 217, 220)
    Private UnSelected_Font_Color As Color = Color.FromArgb(30, 30, 30)
    Private Selected_Font_Color As Color = Color.White

    Sub New()
        SetStyle(DirectCast(139286, ControlStyles), True)
        SetStyle(ControlStyles.Selectable, False)
        SizeMode = TabSizeMode.Fixed
        Alignment = TabAlignment.Top
        ItemSize = New Size(140, 41)
        DrawMode = TabDrawMode.OwnerDrawFixed
        Font = New Font("Segoe UI", 10)
    End Sub

    Private Color1 As Color = TabColors(0)
    Private Color2 As Color = Color1

    Private TotalHeaderCheckSum As String = ""
    Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        Dim B As Bitmap = New Bitmap(Width, Height)
        Dim G As Graphics = Graphics.FromImage(B)
        G.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
        G.Clear(BackColor)

        If TabPages.Count > 0 Then

            Dim CompareS As String = ""
            For i = 0 To TabPages.Count - 1
                CompareS &= TabPages(i).Text.ToUpper
            Next
            If Not TotalHeaderCheckSum = CompareS Then
                TotalHeaderCheckSum = CompareS
                Dim BiggestItemSize As Integer = 140
                For i = 0 To TabPages.Count - 1
                    BiggestItemSize = Math.Max(CInt(CreateGraphics.MeasureString(TabPages(i).Text.ToUpper, Font).Width), BiggestItemSize)
                Next
                If Not ItemSize.Width = BiggestItemSize Then
                    ItemSize = New Size(BiggestItemSize, 41)
                End If
            End If

            For i = 0 To TabCount - 1
                Dim TR As Rectangle = GetTabRect(i)
                Dim DrawTR As Rectangle = New Rectangle(TR.X + SideOffset, TR.Y, TR.Width - (2 * SideOffset), 32)

                G.FillRectangle(New SolidBrush(UnSelected_Background), DrawTR)
                G.DrawRectangle(New Pen(UnSelected_Background), DrawTR)
                For p = 0 To 2
                    G.DrawLine(New Pen(UnSelected_Underline), DrawTR.X, DrawTR.Y + DrawTR.Height - p, DrawTR.X + DrawTR.Width, DrawTR.Y + DrawTR.Height - p)
                Next

                Dim DrawString As String = TabPages(i).Text.ToUpper
                Dim DrawSize As SizeF = G.MeasureString(DrawString, Font)
                G.DrawString(DrawString, Font, New SolidBrush(UnSelected_Font_Color), DrawTR.X + 10, DrawTR.Y + CInt(DrawTR.Height / 2 - DrawSize.Height / 2))
            Next

            Dim TR_2 As Rectangle = GetTabRect(RealIndex)
            Dim DrawTR_2 As Rectangle = New Rectangle(TR_2.X + SideOffset + MarginX, TR_2.Y, TR_2.Width - (2 * SideOffset), 32)
            Dim BGCol As Color = CombineColor(Color1, Color2, ColorRatio)
            Dim BGLine As Color = ModColor(Selected_Font_Color)

            G.FillRectangle(New SolidBrush(BGCol), DrawTR_2)
            G.DrawRectangle(New Pen(BGCol), DrawTR_2)
            G.DrawLine(New Pen(BGLine), DrawTR_2.X, DrawTR_2.Y - 1, DrawTR_2.X + DrawTR_2.Width, DrawTR_2.Y - 1)

            Dim DrawString_2 As String = TabPages(SelectedIndex).Text.ToUpper
            Dim DrawSize_2 As SizeF = G.MeasureString(DrawString_2, Font)
            G.DrawString(DrawString_2, Font, New SolidBrush(Selected_Font_Color), New Point(DrawTR_2.X + 10, DrawTR_2.Y + CInt(DrawTR_2.Height / 2 - DrawSize_2.Height / 2)))

            
        End If

        e.Graphics.DrawImage(B, 0, 0)
        G.Dispose()
        B.Dispose()
    End Sub

    Function ModColor(c As Color) As Color
        Return Color.FromArgb(CInt(IIf(c.R - 16 < 0, 0, c.R - 16)), CInt(IIf(c.G - 16 < 0, 0, c.G - 16)), CInt(IIf(c.B - 16 < 0, 0, c.B - 16)))
    End Function

    Function CombineColor(c1 As Color, c2 As Color, ratio As Double) As Color
        Return Color.FromArgb(CInt((c1.R * (1 - ratio)) + (c2.R * ratio)), CInt((c1.G * (1 - ratio)) + (c2.G * ratio)), CInt((c1.B * (1 - ratio)) + (c2.B * ratio)))
    End Function

    Private CurVal As Double = 0
    Private RealIndex As Integer = 0
    Private MarginX As Integer = 0
    Private PrevIndex As Integer = 0
    Private GotoIndex As Integer = -1337
    Sub StopTimer()
        T.Stop()
        PrevIndex = GotoIndex
        SelectedIndex = GotoIndex
        TotalPixelMove = 0
        MarginX = 0
        RealIndex = GotoIndex
    End Sub

    Private ColorRatio As Double = 0
    Sub Tick() Handles T.Tick
        If CurVal > TotalChangeTime - 0.01 Then
            StopTimer()
        Else
            CurVal += 0.01
            MarginX = CInt((CurVal / TotalChangeTime) * TotalPixelMove)
            ColorRatio = CurVal / TotalChangeTime
        End If
        Invalidate()
    End Sub

    Private TotalPixelMove As Integer = 0
    Sub ZoomTo(ind As Integer)
        GotoIndex = ind

        Dim OldTabRectTemp As Rectangle = GetTabRect(RealIndex)
        Dim OldTabRect As Rectangle = New Rectangle(OldTabRectTemp.X + SideOffset, OldTabRectTemp.Y, OldTabRectTemp.Width - (2 * SideOffset), 32)
        Dim NewTabRectTemp As Rectangle = GetTabRect(ind)
        Dim NewTabRect As Rectangle = New Rectangle(NewTabRectTemp.X + SideOffset, NewTabRectTemp.Y, NewTabRectTemp.Width - (2 * SideOffset), 32)

        TotalPixelMove = CInt((NewTabRect.X + (NewTabRect.Width / 2)) - (OldTabRect.X + (OldTabRect.Width / 2)))
        CurVal = 0
        Color1 = Color2
        Color2 = TabColors(CInt(((ind + 1) - ((Math.Ceiling((ind + 1) / TabColors.Count) - 1) * TabColors.Count)) - 1))

        T.Start()
    End Sub

    Private Sub CodePlexTabControl_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Me.SelectedIndexChanged
        T.Stop()
        ZoomTo(SelectedIndex)
    End Sub
End Class