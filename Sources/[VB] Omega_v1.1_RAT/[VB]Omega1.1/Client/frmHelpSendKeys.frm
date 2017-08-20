VERSION 5.00
Begin VB.Form frmHelpSendKeys 
   Caption         =   "Help - SendKeys"
   ClientHeight    =   6600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6885
   Icon            =   "frmHelpSendKeys.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6600
   ScaleWidth      =   6885
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text1 
      BackColor       =   &H8000000F&
      Height          =   6405
      Left            =   90
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   90
      Width           =   6705
   End
End
Attribute VB_Name = "frmHelpSendKeys"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
Dim txtHelp As String

txtHelp = "SendKeys Formatting" & vbCrLf
txtHelp = txtHelp & "---------------------------------" & vbCrLf
txtHelp = txtHelp & "When using the SendKeys command to send keys to other windows, each key is represented by one or more characters. To specify a single keyboard character, use the character itself. For example, to send the letter A to an application, just type " & Chr(34) & "A" & Chr(34) & " (without quotes) for the keys to send. To represent more than one character, append each additional character to the one preceding it. To represent the letters A, B, and C, use ABC for the string." & vbCrLf
txtHelp = txtHelp & vbCrLf
txtHelp = txtHelp & "The plus sign (+), caret (^), percent sign (%), tilde (~), and parentheses ( ) have special meanings to the SendKeys command. To send one of these characters, you must enclose it within braces ({}). For example, to specify the plus sign, use {+}. Brackets ([ ]) have no special meaning to SendKeys, but you must also enclose them in braces. To specify brace characters, use {{} and {}}." & vbCrLf
txtHelp = txtHelp & vbCrLf
txtHelp = txtHelp & "To specify characters that aren't displayed when you press a key, such as ENTER or TAB, and keys that represent actions rather than characters, use the codes shown below:" & vbCrLf
txtHelp = txtHelp & vbCrLf
txtHelp = txtHelp & "Key" & vbTab & vbTab & "Code" & vbCrLf
txtHelp = txtHelp & "------" & vbTab & vbTab & "--------" & vbCrLf
txtHelp = txtHelp & "BACKSPACE" & vbTab & "{BACKSPACE}, {BS}, or {BKSP}" & vbCrLf
txtHelp = txtHelp & "BREAK" & vbTab & vbTab & "{BREAK}" & vbCrLf
txtHelp = txtHelp & "CAPS LOCK" & vbTab & "{CAPSLOCK}" & vbCrLf
txtHelp = txtHelp & "DEL or DELETE" & vbTab & "{DELETE} or {DEL}" & vbCrLf
txtHelp = txtHelp & "DOWN ARROW" & vbTab & "{DOWN}" & vbCrLf
txtHelp = txtHelp & "End" & vbTab & vbTab & "{END}" & vbCrLf
txtHelp = txtHelp & "ENTER" & vbTab & vbTab & "{ENTER} or ~" & vbCrLf
txtHelp = txtHelp & "ESC" & vbTab & vbTab & "{ESC}" & vbCrLf
txtHelp = txtHelp & "HELP" & vbTab & vbTab & "{HELP}" & vbCrLf
txtHelp = txtHelp & "HOME" & vbTab & vbTab & "{HOME}" & vbCrLf
txtHelp = txtHelp & "INS or INSERT" & vbTab & "{INSERT} or {INS}" & vbCrLf
txtHelp = txtHelp & "Left ARROW" & vbTab & "{LEFT}" & vbCrLf
txtHelp = txtHelp & "NUM LOCK" & vbTab & "{NUMLOCK}" & vbCrLf
txtHelp = txtHelp & "Page DOWN" & vbTab & "{PGDN}" & vbCrLf
txtHelp = txtHelp & "Page UP" & vbTab & vbTab & "{PGUP}" & vbCrLf
txtHelp = txtHelp & "Print Screen" & vbTab & "{PRTSC}" & vbCrLf
txtHelp = txtHelp & "Right ARROW" & vbTab & "{RIGHT}" & vbCrLf
txtHelp = txtHelp & "SCROLL LOCK" & vbTab & "{SCROLLLOCK}" & vbCrLf
txtHelp = txtHelp & "Space" & vbTab & vbTab & "{ }  note space between brackets" & vbCrLf
txtHelp = txtHelp & "TAB" & vbTab & vbTab & "{TAB}" & vbCrLf
txtHelp = txtHelp & "UP ARROW" & vbTab & "{UP}" & vbCrLf
txtHelp = txtHelp & "F1" & vbTab & vbTab & "{F1}" & vbCrLf
txtHelp = txtHelp & "F2" & vbTab & vbTab & "{F2}" & vbCrLf
txtHelp = txtHelp & "F3" & vbTab & vbTab & "{F3}" & vbCrLf
txtHelp = txtHelp & "F4" & vbTab & vbTab & "{F4}" & vbCrLf
txtHelp = txtHelp & "F5" & vbTab & vbTab & "{F5}" & vbCrLf
txtHelp = txtHelp & "F6" & vbTab & vbTab & "{F6}" & vbCrLf
txtHelp = txtHelp & "F7" & vbTab & vbTab & "{F7}" & vbCrLf
txtHelp = txtHelp & "F8" & vbTab & vbTab & "{F8}" & vbCrLf
txtHelp = txtHelp & "F9" & vbTab & vbTab & "{F9}" & vbCrLf
txtHelp = txtHelp & "F10" & vbTab & vbTab & "{F10}" & vbCrLf
txtHelp = txtHelp & "F11" & vbTab & vbTab & "{F11}" & vbCrLf
txtHelp = txtHelp & "F12" & vbTab & vbTab & "{F12}" & vbCrLf
txtHelp = txtHelp & "F13" & vbTab & vbTab & "{F13}" & vbCrLf
txtHelp = txtHelp & "F14" & vbTab & vbTab & "{F14}" & vbCrLf
txtHelp = txtHelp & "F15" & vbTab & vbTab & "{F15}" & vbCrLf
txtHelp = txtHelp & "F16" & vbTab & vbTab & "{F16}" & vbCrLf
txtHelp = txtHelp & vbCrLf
txtHelp = txtHelp & "To specify keys combined with any combination of the SHIFT, CTRL, and ALT keys, precede the key code with one or more of the following codes:" & vbCrLf
txtHelp = txtHelp & vbCrLf
txtHelp = txtHelp & "Key" & vbTab & vbTab & "Code" & vbCrLf
txtHelp = txtHelp & "------" & vbTab & vbTab & "--------" & vbCrLf
txtHelp = txtHelp & "Shift" & vbTab & vbTab & "+" & vbCrLf
txtHelp = txtHelp & "CTRL" & vbTab & vbTab & "^" & vbCrLf
txtHelp = txtHelp & "ALT" & vbTab & vbTab & "%" & vbCrLf
txtHelp = txtHelp & vbCrLf
txtHelp = txtHelp & "To specify that any combination of SHIFT, CTRL, and ALT should be held down while several other keys are pressed, enclose the code for those keys in parentheses. For example, to specify to hold down SHIFT while E and C are pressed, use " & Chr(34) & "+(EC)" & Chr(34) & ". To specify to hold down SHIFT while E is pressed, followed by C without SHIFT, use " & Chr(34) & "+EC" & Chr(34) & "." & vbCrLf
txtHelp = txtHelp & vbCrLf
txtHelp = txtHelp & "To specify repeating keys, use the form {key number}. You must put a space between key and number. For example, {LEFT 42} means press the LEFT ARROW key 42 times; {h 10} means press H 10 times."
Text1 = txtHelp
End Sub

Private Sub Form_Resize()
Text1.Width = Me.Width - 240
Text1.Height = Me.Height - 570
End Sub
