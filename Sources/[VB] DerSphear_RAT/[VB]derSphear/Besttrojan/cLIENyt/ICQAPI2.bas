Attribute VB_Name = "Module2"
Option Explicit

Private icq As cICQ
Public ObjPointer&
Public bs As BSICQAPI_User
Public fwd As BSICQAPI_FireWallData


Sub ICQAPINotify_AppBarStateChange(ByVal iDockingState As Long)

End Sub


Sub ICQAPINotify_FileReceived(ByVal pszFileNames As Long)
  Debug.Print pszFileNames

End Sub

Sub ICQAPINotify_OnlineFullUserDataChange(ByVal iUIN As Long)

End Sub

Sub ICQAPINotify_OnlineListChange(ByVal iType As Long)
  RtlMoveMemory icq, ObjPointer, 4
    icq.ListChanged (iType)
  RtlMoveMemory icq, 0&, 4
End Sub

Sub ICQAPINotify_OnlineListHandleChange(ByVal hWindow As Long)

End Sub

Sub ICQAPINotify_OnlinePlacement_Change()

End Sub


Sub ICQAPINotify_OwnerChange(ByVal iUIN As Long)

End Sub


Sub ICQAPINotify_OwnerFullDataChange()

End Sub



