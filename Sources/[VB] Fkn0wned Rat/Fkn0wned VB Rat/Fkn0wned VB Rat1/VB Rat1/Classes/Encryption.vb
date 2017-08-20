Public Class Encryption
    Public Shared Function rc4(ByVal input As Byte(), ByVal key As Byte()) As Byte()
        Dim i As UInteger = 0
        Dim j As UInteger = 0
        Dim swap As UInteger = 0
        Dim s As UInteger() = New UInteger(255) {}

        For i = 0 To 255
            s(i) = CByte(i)
        Next

        For i = 0 To 255
            j = (j + key(i Mod key.Length) + s(i)) And 255
            swap = s(i)
            s(i) = s(j)
            s(j) = CByte(swap)
        Next

        i = 0
        j = 0
        For c As Integer = 0 To input.Length - 1
            i = (i + 1) And 255
            j = (j + s(i)) And 255
            swap = s(i)
            s(i) = s(j)
            s(j) = CByte(swap)
            input(c) = input(c) Xor CByte(s((s(i) + s(j)) And 255))
        Next
        Return input
    End Function
End Class
