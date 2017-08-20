using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace uRAT.Server.Builder
{
    internal enum InstallationPath
    {
        Default,
        AppData,
        ProgramFiles
    }

    internal class BuildSettings
    {
        public string Hostname;
        public int Port;
        public string Filename;
        public InstallationPath InstallationPath;
        public int ReconnectDelay;
        public bool MergeDependencies;

        public BuildSettings()
        {
        }

        public BuildSettings(string hostname, int port, string filename, InstallationPath installationPath, int reconnectDelay, bool mergeDependencies)
        {
            Hostname = hostname;
            Port = port;
            Filename = filename;
            InstallationPath = installationPath;
            ReconnectDelay = reconnectDelay;
            MergeDependencies = mergeDependencies;
        }
    }
}
