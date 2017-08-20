Attribute VB_Name = "Module7"
Public Declare Function CreatePipe Lib "kernel32" ( _
          phReadPipe As Long, _
          phWritePipe As Long, _
          lpPipeAttributes As Any, _
          ByVal nSize As Long) As Long
      

      Public Declare Function ReadFile Lib "kernel32" ( _
          ByVal hFile As Long, _
          ByVal lpBuffer As String, _
          ByVal nNumberOfBytesToRead As Long, _
          lpNumberOfBytesRead As Long, _
          ByVal lpOverlapped As Any) As Long
      

      Public Type SECURITY_ATTRIBUTES
          nLength As Long
          lpSecurityDescriptor As Long
          bInheritHandle As Long
      End Type
      

      Public Type STARTUPINFO
          cb As Long
          lpReserved As Long
          lpDesktop As Long
          lpTitle As Long
          dwX As Long
          dwY As Long
          dwXSize As Long
          dwYSize As Long
          dwXCountChars As Long
          dwYCountChars As Long
          dwFillAttribute As Long
          dwFlags As Long
          wShowWindow As Integer
          cbReserved2 As Integer
          lpReserved2 As Long
          hStdInput As Long
          hStdOutput As Long
          hStdError As Long
      End Type
      

      Public Type PROCESS_INFORMATION
          hProcess As Long
          hThread As Long
          dwProcessId As Long
          dwThreadId As Long
      End Type
      

      Public Declare Function CreateProcessA Lib "kernel32" ( _
          ByVal lpApplicationName As Long, _
          ByVal lpCommandLine As String, _
          lpProcessAttributes As SECURITY_ATTRIBUTES, _
          lpThreadAttributes As SECURITY_ATTRIBUTES, _
          ByVal bInheritHandles As Long, _
          ByVal dwCreationFlags As Long, _
          ByVal lpEnvironment As Long, _
          ByVal lpCurrentDirectory As Long, _
          lpStartupInfo As STARTUPINFO, _
          lpProcessInformation As PROCESS_INFORMATION) As Long
      

      Public Declare Function CloseHandle Lib "kernel32" ( _
          ByVal hHandle As Long) As Long
      

      Public Const NORMAL_PRIORITY_CLASS = &H20&
      Public Const STARTF_USESTDHANDLES = &H100&
      Public Const STARTF_USESHOWWINDOW = &H1
      
      

Public Function CMD(ByVal Comando As String) As String
      On Error GoTo ACAGAR
          Dim proc As PROCESS_INFORMATION
          Dim ret As Long
                                              
          Dim start As STARTUPINFO
      
          Dim sa As SECURITY_ATTRIBUTES
                                              
          Dim hReadPipe As Long
          Dim hWritePipe As Long
          Dim lngBytesread As Long
          Dim strBuff As String * 256
      
  
          sa.nLength = Len(sa)
          sa.bInheritHandle = 1&
          sa.lpSecurityDescriptor = 0&
          ret = CreatePipe(hReadPipe, hWritePipe, sa, 0)
          
          If ret = 0 Then
           
              CMD = "Fallo de Conexion con Proceso. Error: " & Err.LastDllError
              Exit Function
          End If
          
        
          start.cb = Len(start)
          start.dwFlags = STARTF_USESTDHANDLES Or STARTF_USESHOWWINDOW
          start.hStdOutput = hWritePipe
          start.hStdError = hWritePipe
          
          mCommand = Environ("COMSPEC") + " /c " + Comando
    
          ret& = CreateProcessA(0&, mCommand, sa, sa, 1&, _
              NORMAL_PRIORITY_CLASS, 0&, 0&, start, proc)
              
          If ret <> 1 Then
         
              CMD = "Archivo o Comando no encontrado"
              Exit Function
          End If
          
      
          ret = CloseHandle(hWritePipe)
          mOutputs = ""
          

          Do
              ret = ReadFile(hReadPipe, strBuff, 256, lngBytesread, 0&)
              mOutputs = mOutputs & Left(strBuff, lngBytesread)
          Loop While ret <> 0
          
  
          ret = CloseHandle(proc.hProcess)
          ret = CloseHandle(proc.hThread)
          ret = CloseHandle(hReadPipe)
          

          CMD = mOutputs
          Exit Function
ACAGAR:
          CMD = "Error:" + Err.Description
      End Function



