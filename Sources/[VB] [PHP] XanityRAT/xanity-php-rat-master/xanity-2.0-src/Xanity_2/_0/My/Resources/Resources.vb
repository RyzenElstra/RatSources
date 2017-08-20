Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.CodeDom.Compiler
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Globalization
Imports System.IO
Imports System.Resources
Imports System.Runtime.CompilerServices

Namespace Xanity_2._0.My.Resources
    <DebuggerNonUserCode, StandardModule, GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0"), CompilerGenerated, HideModuleName> _
    Friend NotInheritable Class Resources
        ' Properties
        <EditorBrowsable(EditorBrowsableState.Advanced)> _
        Friend Shared Property Culture As CultureInfo
            Get
                Return Resources.resourceCulture
            End Get
            Set(ByVal value As CultureInfo)
                Resources.resourceCulture = value
            End Set
        End Property

        Friend Shared ReadOnly Property document__arrow As Bitmap
            Get
                Return DirectCast(RuntimeHelpers.GetObjectValue(Resources.ResourceManager.GetObject("document__arrow", Resources.resourceCulture)), Bitmap)
            End Get
        End Property

        Friend Shared ReadOnly Property folder__arrow As Bitmap
            Get
                Return DirectCast(RuntimeHelpers.GetObjectValue(Resources.ResourceManager.GetObject("folder__arrow", Resources.resourceCulture)), Bitmap)
            End Get
        End Property

        Friend Shared ReadOnly Property gif_load As Bitmap
            Get
                Return DirectCast(RuntimeHelpers.GetObjectValue(Resources.ResourceManager.GetObject("gif_load", Resources.resourceCulture)), Bitmap)
            End Get
        End Property

        Friend Shared ReadOnly Property gif_load2 As Bitmap
            Get
                Return DirectCast(RuntimeHelpers.GetObjectValue(Resources.ResourceManager.GetObject("gif_load2", Resources.resourceCulture)), Bitmap)
            End Get
        End Property

        Friend Shared ReadOnly Property host As Bitmap
            Get
                Return DirectCast(RuntimeHelpers.GetObjectValue(Resources.ResourceManager.GetObject("host", Resources.resourceCulture)), Bitmap)
            End Get
        End Property

        Friend Shared ReadOnly Property logo As Bitmap
            Get
                Return DirectCast(RuntimeHelpers.GetObjectValue(Resources.ResourceManager.GetObject("logo", Resources.resourceCulture)), Bitmap)
            End Get
        End Property

        Friend Shared ReadOnly Property network_status As Bitmap
            Get
                Return DirectCast(RuntimeHelpers.GetObjectValue(Resources.ResourceManager.GetObject("network_status", Resources.resourceCulture)), Bitmap)
            End Get
        End Property

        Friend Shared ReadOnly Property notify As UnmanagedMemoryStream
            Get
                Return Resources.ResourceManager.GetStream("notify", Resources.resourceCulture)
            End Get
        End Property

        <EditorBrowsable(EditorBrowsableState.Advanced)> _
        Friend Shared ReadOnly Property ResourceManager As ResourceManager
            Get
                If Object.ReferenceEquals(Resources.resourceMan, Nothing) Then
                    Dim manager2 As New ResourceManager("Xanity_2._0.Resources", GetType(Resources).Assembly)
                    Resources.resourceMan = manager2
                End If
                Return Resources.resourceMan
            End Get
        End Property

        Friend Shared ReadOnly Property scanload As Bitmap
            Get
                Return DirectCast(RuntimeHelpers.GetObjectValue(Resources.ResourceManager.GetObject("scanload", Resources.resourceCulture)), Bitmap)
            End Get
        End Property


        ' Fields
        Private Shared resourceCulture As CultureInfo
        Private Shared resourceMan As ResourceManager
    End Class
End Namespace

