@ECHO off
cls
cd %~dp0
if "%1"=="" (set /p compid="Enter Computer ID: ") else (set compid="%1")
ECHO.


:StartCompiler

del stub.res
del stub.exe
del dllcrypt.dll

cd stub
del CreateStub.exe
"C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe" CreateStub.dpr
CreateStub.exe
del CreateStub.exe
"C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe" stub.dpr
del *.~dpr
del *.dcu
del *.~pas
del *.~ddp
del *.~dfm
del *.ddp

cd..

if not exist stub.exe goto StartCompiler

"C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe" cryptfile.dpr
cryptfile.exe stub.exe %compid%
del cryptfile.exe
"C:\Program Files (x86)\Borland\Delphi7\Bin\brcc32.exe" stub.rc
"C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe" dllcrypt.dpr
del *.~dpr
del *.dcu
del *.~pas
del *.~ddp
del *.~dfm
del *.ddp

upx -9 -f dllcrypt.dll
del stub.exe