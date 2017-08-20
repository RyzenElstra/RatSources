Imports System.CodeDom.Compiler
Imports Microsoft.CSharp
Imports System.Collections.Generic
Imports System.IO

Class CodeDOM
    Public Shared Function Compile(ByVal Output As String, ByVal Source As String, ByVal Icon As String, ByVal resources As String) As Boolean
        Dim Parameters As New CompilerParameters()
        Dim cResults As CompilerResults = Nothing
        Dim providerOptions As New Dictionary(Of String, String)()
        providerOptions.Add("CompilerVersion", "v2.0")
        Dim Compiler As CodeDomProvider = CodeDomProvider.CreateProvider("VB", providerOptions)
        Parameters.GenerateExecutable = True
        Parameters.TreatWarningsAsErrors = False
        Parameters.OutputAssembly = Output
        If Not (String.IsNullOrEmpty(resources)) Then
            Parameters.EmbeddedResources.Add(resources)
        End If

        Parameters.ReferencedAssemblies.AddRange(New String() {"System.dll", "System.Drawing.dll", "System.Windows.Forms.dll", "System.Management.dll"})
        Parameters.CompilerOptions = "/platform:x86 /target:winexe"
        If Not String.IsNullOrEmpty(Icon) Then
            File.Copy(Icon, "icon.ico")
            Parameters.CompilerOptions += " /win32icon:" & "icon.ico"
        End If
        cResults = Compiler.CompileAssemblyFromSource(Parameters, Source)
        If cResults.Errors.Count > 0 Then
            For Each compile_error As CompilerError In cResults.Errors
                Dim [error] As CompilerError = compile_error
                Console.Beep()
                Console.WriteLine("Error: " & [error].ErrorText & vbCr & vbLf & [error].Line, "")
            Next
            Return False
        End If
        If Not (String.IsNullOrEmpty(Icon)) Then
            File.Delete("icon.ico")
        End If
        Return True
    End Function
End Class