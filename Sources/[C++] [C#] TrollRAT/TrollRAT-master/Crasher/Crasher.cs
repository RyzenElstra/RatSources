using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace Crasher
{
    static class Crasher
    {
        [DllImport("kernel32.dll", SetLastError = true)]
        static extern IntPtr CreateRemoteThread(IntPtr hProcess,
                IntPtr lpThreadAttributes, uint dwStackSize, IntPtr
                lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);

        [DllImport("kernel32.dll", SetLastError = true)]
        public static extern IntPtr OpenProcess(uint processAccess, bool bInheritHandle, int processId);

        [DllImport("ntdll.dll", SetLastError = true)]
        public static extern IntPtr RtlAdjustPrivilege(int Privilege, bool Enable,
                bool IsThreadPrivilege, out bool PreviousValue);

        static void Main()
        {
            string[] args = Environment.GetCommandLineArgs();

            if (args.Length != 2)
                Environment.Exit(-1);

            int pid;
            if (!int.TryParse(args[1], out pid))
                Environment.Exit(-2);

            try
            {
                Process process = Process.GetProcessById(pid);

                if (process.HasExited)
                    Environment.Exit(1);

                bool x;
                RtlAdjustPrivilege(20 /* SeDebugPrivilege */, true, false, out x);

                IntPtr hProcess = OpenProcess(2097151, false, process.Id);

                if (hProcess.ToInt32() != 0)
                {
                    IntPtr ret = CreateRemoteThread(hProcess, IntPtr.Zero, 0,
                        IntPtr.Zero /* Let it execute *0 => Access Violation */,
                        IntPtr.Zero, 0, new IntPtr());

                    if (ret.ToInt32() != 0)
                        Environment.Exit(0);
                    else
                        Environment.Exit(0x8000000 | Marshal.GetLastWin32Error());
                        
                } else
                    Environment.Exit(0x4000000 | Marshal.GetLastWin32Error());
                   
            }
            catch (Exception)
            {
                Environment.Exit(2);
            }
        }
    }
}
