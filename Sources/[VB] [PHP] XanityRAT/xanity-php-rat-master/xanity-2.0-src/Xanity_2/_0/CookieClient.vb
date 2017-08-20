Imports System
Imports System.Collections.Generic
Imports System.Diagnostics
Imports System.Net
Imports System.Runtime.CompilerServices

Namespace Xanity_2._0
    Friend NotInheritable Class CookieClient
        Inherits WebClient
        ' Methods
        Public Sub New()
            CookieClient.__ENCAddToList(Me)
            Me.Cookies = New CookieContainer
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = CookieClient.__ENCList
            SyncLock list
                If (CookieClient.__ENCList.Count = CookieClient.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (CookieClient.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = CookieClient.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                CookieClient.__ENCList.Item(index) = CookieClient.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    CookieClient.__ENCList.RemoveRange(index, (CookieClient.__ENCList.Count - index))
                    CookieClient.__ENCList.Capacity = CookieClient.__ENCList.Count
                End If
                CookieClient.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Public Sub ClearCookies()
            Me.Cookies = New CookieContainer
        End Sub

        Protected Overrides Function GetWebRequest(ByVal address As Uri) As WebRequest
            Me.Request = DirectCast(MyBase.GetWebRequest(address), HttpWebRequest)
            Me.Request.Timeout = &H1F40
            Me.Request.ReadWriteTimeout = &H7530
            Me.Request.KeepAlive = False
            Me.Request.CookieContainer = Me.Cookies
            Me.Request.Proxy = Nothing
            Return Me.Request
        End Function


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Public Cookies As CookieContainer
        Private Request As HttpWebRequest
    End Class
End Namespace

