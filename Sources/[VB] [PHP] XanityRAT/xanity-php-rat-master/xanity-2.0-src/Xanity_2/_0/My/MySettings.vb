Imports Microsoft.VisualBasic.ApplicationServices
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.CodeDom.Compiler
Imports System.ComponentModel
Imports System.Configuration
Imports System.Diagnostics
Imports System.Runtime.CompilerServices

Namespace Xanity_2._0.My
    <CompilerGenerated, EditorBrowsable(EditorBrowsableState.Advanced), GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "12.0.0.0")> _
    Friend NotInheritable Class MySettings
        Inherits ApplicationSettingsBase
        ' Methods
        <DebuggerNonUserCode, EditorBrowsable(EditorBrowsableState.Advanced)> _
        Private Shared Sub AutoSaveSettings(ByVal sender As Object, ByVal e As EventArgs)
            If MyProject.Application.SaveMySettingsOnExit Then
                MySettingsProperty.Settings.Save
            End If
        End Sub


        ' Properties
        <UserScopedSetting, DefaultSettingValue("False"), DebuggerNonUserCode> _
        Public Property autoconnect As Boolean
            Get
                Return Conversions.ToBoolean(Me.Item("autoconnect"))
            End Get
            Set(ByVal value As Boolean)
                Me.Item("autoconnect") = value
            End Set
        End Property

        <DebuggerNonUserCode, UserScopedSetting, DefaultSettingValue("False")> _
        Public Property autoscan As Boolean
            Get
                Return Conversions.ToBoolean(Me.Item("autoscan"))
            End Get
            Set(ByVal value As Boolean)
                Me.Item("autoscan") = value
            End Set
        End Property

        Public Shared ReadOnly Property [Default] As MySettings
            Get
                If Not MySettings.addedHandler Then
                    Dim addedHandlerLockObject As Object = MySettings.addedHandlerLockObject
                    ObjectFlowControl.CheckForSyncLockOnValueType(addedHandlerLockObject)
                    SyncLock addedHandlerLockObject
                        If Not MySettings.addedHandler Then
                            AddHandler MyProject.Application.Shutdown, New ShutdownEventHandler(AddressOf MySettings.AutoSaveSettings)
                            MySettings.addedHandler = True
                        End If
                    End SyncLock
                End If
                Return MySettings.defaultInstance
            End Get
        End Property

        <UserScopedSetting, DebuggerNonUserCode, DefaultSettingValue("")> _
        Public Property hosts As String
            Get
                Return Conversions.ToString(Me.Item("hosts"))
            End Get
            Set(ByVal value As String)
                Me.Item("hosts") = value
            End Set
        End Property

        <DebuggerNonUserCode, DefaultSettingValue("False"), UserScopedSetting> _
        Public Property notification As Boolean
            Get
                Return Conversions.ToBoolean(Me.Item("notification"))
            End Get
            Set(ByVal value As Boolean)
                Me.Item("notification") = value
            End Set
        End Property

        <DefaultSettingValue(""), DebuggerNonUserCode, UserScopedSetting> _
        Public Property onc_down As String
            Get
                Return Conversions.ToString(Me.Item("onc_down"))
            End Get
            Set(ByVal value As String)
                Me.Item("onc_down") = value
            End Set
        End Property

        <UserScopedSetting, DefaultSettingValue(""), DebuggerNonUserCode> _
        Public Property onc_website As String
            Get
                Return Conversions.ToString(Me.Item("onc_website"))
            End Get
            Set(ByVal value As String)
                Me.Item("onc_website") = value
            End Set
        End Property

        <UserScopedSetting, DefaultSettingValue("False"), DebuggerNonUserCode> _
        Public Property onconnect_down As Boolean
            Get
                Return Conversions.ToBoolean(Me.Item("onconnect_down"))
            End Get
            Set(ByVal value As Boolean)
                Me.Item("onconnect_down") = value
            End Set
        End Property

        <UserScopedSetting, DebuggerNonUserCode, DefaultSettingValue("False")> _
        Public Property onconnect_web As Boolean
            Get
                Return Conversions.ToBoolean(Me.Item("onconnect_web"))
            End Get
            Set(ByVal value As Boolean)
                Me.Item("onconnect_web") = value
            End Set
        End Property

        <DebuggerNonUserCode, DefaultSettingValue("False"), UserScopedSetting> _
        Public Property sound As Boolean
            Get
                Return Conversions.ToBoolean(Me.Item("sound"))
            End Get
            Set(ByVal value As Boolean)
                Me.Item("sound") = value
            End Set
        End Property


        ' Fields
        Private Shared addedHandler As Boolean
        Private Shared addedHandlerLockObject As Object = RuntimeHelpers.GetObjectValue(New Object)
        Private Shared defaultInstance As MySettings = DirectCast(SettingsBase.Synchronized(New MySettings), MySettings)
    End Class
End Namespace

