Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Runtime.InteropServices

Namespace Xanity_2._0
    <StandardModule> _
    Friend NotInheritable Class Helpers
        ' Methods
        Shared Sub New()
            Dim format As New StringFormat With { _
                .Alignment = StringAlignment.Near, _
                .LineAlignment = StringAlignment.Near _
            }
            Helpers.NearSF = format
            format = New StringFormat With { _
                .Alignment = StringAlignment.Center, _
                .LineAlignment = StringAlignment.Center _
            }
            Helpers.CenterSF = format
        End Sub

        Public Shared Function DrawArrow(ByVal x As Integer, ByVal y As Integer, ByVal flip As Boolean) As GraphicsPath
            Dim path2 As New GraphicsPath
            Dim num2 As Integer = 12
            Dim num As Integer = 6
            If flip Then
                path2.AddLine((x + 1), y, ((x + num2) + 1), y)
                path2.AddLine((x + num2), y, (x + num), ((y + num) - 1))
            Else
                path2.AddLine(x, (y + num), (x + num2), (y + num))
                path2.AddLine((x + num2), (y + num), (x + num), y)
            End If
            path2.CloseFigure
            Return path2
        End Function

        Public Shared Function RoundRec(ByVal Rectangle As Rectangle, ByVal Curve As Integer) As GraphicsPath
            Dim path As New GraphicsPath
            Dim width As Integer = (Curve * 2)
            Dim rect As New Rectangle(Rectangle.X, Rectangle.Y, width, width)
            path.AddArc(rect, -180!, 90!)
            rect = New Rectangle(((Rectangle.Width - width) + Rectangle.X), Rectangle.Y, width, width)
            path.AddArc(rect, -90!, 90!)
            rect = New Rectangle(((Rectangle.Width - width) + Rectangle.X), ((Rectangle.Height - width) + Rectangle.Y), width, width)
            path.AddArc(rect, 0!, 90!)
            rect = New Rectangle(Rectangle.X, ((Rectangle.Height - width) + Rectangle.Y), width, width)
            path.AddArc(rect, 90!, 90!)
            Dim point As New Point(Rectangle.X, ((Rectangle.Height - width) + Rectangle.Y))
            Dim point2 As New Point(Rectangle.X, (Curve + Rectangle.Y))
            path.AddLine(point, point2)
            Return path
        End Function

        Public Shared Function RoundRect(ByVal x As Single, ByVal y As Single, ByVal w As Single, ByVal h As Single, ByVal Optional r As Single = 0.3!, ByVal Optional TL As Boolean = True, ByVal Optional TR As Boolean = True, ByVal Optional BR As Boolean = True, ByVal Optional BL As Boolean = True) As GraphicsPath
            Dim width As Single = (Math.Min(w, h) * r)
            Dim num2 As Single = (x + w)
            Dim num3 As Single = (y + h)
            Dim path As New GraphicsPath
            Dim path2 As GraphicsPath = path
            If TL Then
                path2.AddArc(x, y, width, width, 180!, 90!)
            Else
                path2.AddLine(x, y, x, y)
            End If
            If TR Then
                path2.AddArc((num2 - width), y, width, width, 270!, 90!)
            Else
                path2.AddLine(num2, y, num2, y)
            End If
            If BR Then
                path2.AddArc((num2 - width), (num3 - width), width, width, 0!, 90!)
            Else
                path2.AddLine(num2, num3, num2, num3)
            End If
            If BL Then
                path2.AddArc(x, (num3 - width), width, width, 90!, 90!)
            Else
                path2.AddLine(x, num3, x, num3)
            End If
            path2.CloseFigure
            path2 = Nothing
            Return path
        End Function


        ' Fields
        Friend Shared _FlatColor As Color = Color.FromArgb(&H23, &HA8, &H6D)
        Friend Shared B As Bitmap
        Friend Shared CenterSF As StringFormat
        Friend Shared G As Graphics
        Friend Shared NearSF As StringFormat
    End Class
End Namespace

