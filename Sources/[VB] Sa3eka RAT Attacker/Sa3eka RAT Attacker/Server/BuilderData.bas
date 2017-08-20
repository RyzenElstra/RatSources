Attribute VB_Name = "Module10"
Option Explicit
    Dim settings As String
Public Function Builderdata()
settings = "123456789012345678901234567890123456789012345678901234567890"
Builderdata = Split(settings, "[Settings]")(1)
End Function
