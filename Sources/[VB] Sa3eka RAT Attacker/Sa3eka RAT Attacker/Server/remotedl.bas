Attribute VB_Name = "Module9"
Const INTERNET_OPEN_TYPE_PRECONFIG = 0
Const INTERNET_FLAG_EXISTING_CONNECT = &H20000000

Private Declare Function InternetOpen Lib "wininet.dll" Alias "InternetOpenA" _
    (ByVal lpszAgent As String, ByVal dwAccessType As Long, _
    ByVal lpszProxyName As String, ByVal lpszProxyBypass As String, _
    ByVal dwFlags As Long) As Long
Private Declare Function InternetOpenUrl Lib "wininet.dll" Alias _
    "InternetOpenUrlA" (ByVal hInternetSession As Long, ByVal lpszUrl As String, _
    ByVal lpszHeaders As String, ByVal dwHeadersLength As Long, _
    ByVal dwFlags As Long, ByVal dwContext As Long) As Long
Private Declare Function InternetCloseHandle Lib "wininet.dll" (ByVal hInet As _
    Long) As Integer
Private Declare Function InternetReadFile Lib "wininet.dll" (ByVal hFile As _
    Long, ByVal lpBuffer As String, ByVal dwNumberOfBytesToRead As Long, _
    lNumberOfBytesRead As Long) As Integer

' Download a file from Internet and save it to a local file
'
' it works with HTTP and FTP, but you must explicitly include
' the protocol name in the URL, as in
'    CopyURLToFile "http://www.vb2themax.com/default.asp", "C:\vb2themax.htm"

Sub CopyURLToFile(ByVal URL As String, ByVal FileName As String)
    Dim hInternetSession As Long
    Dim hUrl As Long
    Dim FileNum As Integer
    Dim ok As Boolean
    Dim NumberOfBytesRead As Long
    Dim Buffer As String
    Dim fileIsOpen As Boolean

    On Error GoTo ErrorHandler

    ' check obvious syntax errors
    If Len(URL) = 0 Or Len(FileName) = 0 Then Err.Raise 5

    ' open an Internet session, and retrieve its handle
    hInternetSession = InternetOpen(App.EXEName, INTERNET_OPEN_TYPE_PRECONFIG, _
        vbNullString, vbNullString, 0)
    If hInternetSession = 0 Then Err.Raise vbObjectError + 1000, , _
        "An error occurred calling InternetOpen function"

    ' open the file and retrieve its handle
    hUrl = InternetOpenUrl(hInternetSession, URL, vbNullString, 0, _
        INTERNET_FLAG_EXISTING_CONNECT, 0)
    If hUrl = 0 Then Err.Raise vbObjectError + 1000, , _
        "An error occurred calling InternetOpenUrl function"

    ' ensure that there is no local file
    On Error Resume Next
    Kill FileName

    On Error GoTo ErrorHandler
    
    ' open the local file
    FileNum = FreeFile
    Open FileName For Binary As FileNum
    fileIsOpen = True

    ' prepare the receiving buffer
    Buffer = Space(4096)
    
    Do
        ' read a chunk of the file - returns True if no error
        ok = InternetReadFile(hUrl, Buffer, Len(Buffer), NumberOfBytesRead)

        ' exit if error or no more data
        If NumberOfBytesRead = 0 Or Not ok Then Exit Do
        
        ' save the data to the local file
        Put #FileNum, , Left$(Buffer, NumberOfBytesRead)
    Loop
    
    ' flow into the error handler

ErrorHandler:
    ' close the local file, if necessary
    If fileIsOpen Then Close #FileNum
    ' close internet handles, if necessary
    If hUrl Then InternetCloseHandle hUrl
    If hInternetSession Then InternetCloseHandle hInternetSession
    
    ' report the error to the client, if there is one
    If Err Then Err.Raise Err.Number, , Err.Description
End Sub


