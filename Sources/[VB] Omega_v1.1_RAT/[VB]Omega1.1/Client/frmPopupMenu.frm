VERSION 5.00
Begin VB.Form frmPopupMenu 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Popup Menu"
   ClientHeight    =   1170
   ClientLeft      =   150
   ClientTop       =   675
   ClientWidth     =   2145
   Icon            =   "frmPopupMenu.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1170
   ScaleWidth      =   2145
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuAddrBook 
      Caption         =   "AddrBook"
      Begin VB.Menu mnuPing 
         Caption         =   "Ping"
      End
      Begin VB.Menu mnuPingAll 
         Caption         =   "Ping All"
      End
      Begin VB.Menu mnuConnect 
         Caption         =   "Connect"
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "Delete"
      End
   End
   Begin VB.Menu mnuPass 
      Caption         =   "GetPass"
      Begin VB.Menu mnuCopy 
         Caption         =   "Copy"
      End
      Begin VB.Menu mnuCopyAll 
         Caption         =   "Copy All"
      End
   End
End
Attribute VB_Name = "frmPopupMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'for frmAddressBook
Private Sub mnuPing_Click()
Call frmAddressBook.PingSelectedIP
End Sub

Private Sub mnuPingAll_Click()
Call frmAddressBook.PingAllIP
End Sub

Private Sub mnuConnect_Click()
Call frmAddressBook.cmdConnect_Click
End Sub

Private Sub mnuDelete_Click()
Call frmAddressBook.cmdDelete_Click
End Sub

'for get password function 2
Private Sub mnuCopy_Click()
Call frmMain.Copy_2
End Sub

Private Sub mnuCopyAll_Click()
Call frmMain.CopyAll_2
End Sub
