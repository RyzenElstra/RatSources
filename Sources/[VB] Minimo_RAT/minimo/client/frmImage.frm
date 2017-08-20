VERSION 5.00
Begin VB.Form frmImage
  Caption = "Image"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 1 'Fixed Single
  'Icon = n/a
  LinkTopic = "Form2"
  MaxButton = 0   'False
  MinButton = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 5730
  ClientHeight = 2880
  BeginProperty Font
    Name = "Tahoma"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  StartUpPosition = 3 'Windows Default
  Begin VB.CommandButton cmdCancel
    Caption = "Cancel"
    Left = 4560
    Top = 2400
    Width = 975
    Height = 280
    TabIndex = 6
  End
  Begin VB.CommandButton cmdConvert
    Caption = "Convert"
    Left = 240
    Top = 2400
    Width = 4215
    Height = 280
    TabIndex = 5
  End
  Begin VB.TextBox txtJPG
    Left = 240
    Top = 1920
    Width = 5295
    Height = 285
    TabIndex = 2
  End
  Begin VB.TextBox txtBMP
    Left = 240
    Top = 1320
    Width = 5295
    Height = 285
    TabIndex = 1
  End
  Begin VB.Frame Frame1
    Caption = "Frame1"
    BackColor = &HFFFFFF&
    Left = 65056
    Top = 65296
    Width = 6255
    Height = 1095
    TabIndex = 0
    BeginProperty Font
      Name = "MS Sans Serif"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Begin VB.Image Image1
      Picture = "frmImage.frx":0
      Left = 1080
      Top = 480
      Width = 4440
      Height = 405
    End
  End
  Begin VB.Label Label2
    Caption = "Destination path for JPG"
    Left = 240
    Top = 1680
    Width = 3855
    Height = 255
    TabIndex = 4
  End
  Begin VB.Label Label1
    Caption = "File path of Bitmap"
    Left = 240
    Top = 1080
    Width = 3255
    Height = 255
    TabIndex = 3
  End
End

Attribute VB_Name = "frmImage"


