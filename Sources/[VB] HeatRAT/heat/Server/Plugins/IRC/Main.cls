VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Public Server As String, Port As String, Channel As String, Nick As String

Public Function Execute(WinSock As Object, IrcServer As String, IrcPort As Single, IrcChannel As String, IrcNick As String) As String
    Load frmIRC
    Set frmIRC.MainSock = WinSock
End Function
