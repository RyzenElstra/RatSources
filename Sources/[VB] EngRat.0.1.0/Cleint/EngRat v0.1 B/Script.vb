Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class Script
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.script_FormClosing)
        Me.RunAs = "vbs"
        Me.Code = ""
        Me.InitializeComponent()
    End Sub

    Public Code As String
    Public F As Form1
    Public RunAs As String

    Private Sub ToolStripStatusLabel2_Click(sender As Object, e As EventArgs) Handles ToolStripStatusLabel2.Click
        Me.Code = Me.TextBox1.Text
        Me.Close()
    End Sub

    Private Sub ToolStripStatusLabel1_Click(sender As Object, e As EventArgs) Handles ToolStripStatusLabel1.Click
        Dim str As String = Interaction.InputBox("Run As :", "", "vbs", -1, -1)
        If (str.Length > 0) Then
            Me.RunAs = str
            Me.ToolStripStatusLabel2.Text = ("RunAs: " & str)
        End If
    End Sub

    Private Sub Script_FormClosing(sender As Object, e As FormClosingEventArgs) Handles MyBase.FormClosing

    End Sub
End Class