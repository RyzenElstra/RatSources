Imports System.Security.Cryptography

Public Class Encryption
    Public Function AES_Encrypt(ByVal input As String, ByVal pass As String) As String
        Dim AES As New System.Security.Cryptography.RijndaelManaged
        Dim Hash_AES As New System.Security.Cryptography.MD5CryptoServiceProvider
        Dim encrypted As String = ""
        Try
            Dim hash(31) As Byte
            Dim temp As Byte() = Hash_AES.ComputeHash(System.Text.ASCIIEncoding.ASCII.GetBytes(pass))
            Array.Copy(temp, 0, hash, 0, 16)
            Array.Copy(temp, 0, hash, 15, 16)
            AES.Key = hash
            AES.Mode = Security.Cryptography.CipherMode.ECB
            Dim DESEncrypter As System.Security.Cryptography.ICryptoTransform = AES.CreateEncryptor
            Dim Buffer As Byte() = System.Text.ASCIIEncoding.ASCII.GetBytes(input)
            encrypted = Convert.ToBase64String(DESEncrypter.TransformFinalBlock(Buffer, 0, Buffer.Length))
            Return encrypted
        Catch ex As Exception
        End Try
    End Function
    Public Function AES_Decrypt(ByVal input As String, ByVal pass As String) As String
        Dim AES As New System.Security.Cryptography.RijndaelManaged
        Dim Hash_AES As New System.Security.Cryptography.MD5CryptoServiceProvider
        Dim decrypted As String = ""
        Try
            Dim hash(31) As Byte
            Dim temp As Byte() = Hash_AES.ComputeHash(System.Text.ASCIIEncoding.ASCII.GetBytes(pass))
            Array.Copy(temp, 0, hash, 0, 16)
            Array.Copy(temp, 0, hash, 15, 16)
            AES.Key = hash
            AES.Mode = Security.Cryptography.CipherMode.ECB
            Dim DESDecrypter As System.Security.Cryptography.ICryptoTransform = AES.CreateDecryptor
            Dim Buffer As Byte() = Convert.FromBase64String(input)
            decrypted = System.Text.ASCIIEncoding.ASCII.GetString(DESDecrypter.TransformFinalBlock(Buffer, 0, Buffer.Length))
            Return decrypted
        Catch ex As Exception
        End Try
    End Function
    Public Function DecryptBase64(ByVal txt As String)
        Return Convert.FromBase64String(txt)
    End Function
    Public Function EncryptBase64(ByVal b() As Byte)
        Return Convert.ToBase64String(b)
    End Function
    Public Function RijndaelDecrypt(ByVal UDecryptU As String, ByVal UKeyU As String)
        Dim XoAesProviderX As New RijndaelManaged
        Dim XbtCipherX() As Byte
        Dim XbtSaltX() As Byte = New Byte() {1, 2, 3, 4, 5, 6, 7, 8}
        Dim XoKeyGeneratorX As New Rfc2898DeriveBytes(UKeyU, XbtSaltX)
        XoAesProviderX.Key = XoKeyGeneratorX.GetBytes(XoAesProviderX.Key.Length)
        XoAesProviderX.IV = XoKeyGeneratorX.GetBytes(XoAesProviderX.IV.Length)
        Dim XmsX As New IO.MemoryStream
        Dim XcsX As New CryptoStream(XmsX, XoAesProviderX.CreateDecryptor(), _
          CryptoStreamMode.Write)
        Try
            XbtCipherX = Convert.FromBase64String(UDecryptU)
            XcsX.Write(XbtCipherX, 0, XbtCipherX.Length)
            XcsX.Close()
            UDecryptU = System.Text.Encoding.UTF8.GetString(XmsX.ToArray)
        Catch
        End Try
        Return UDecryptU
    End Function
End Class
