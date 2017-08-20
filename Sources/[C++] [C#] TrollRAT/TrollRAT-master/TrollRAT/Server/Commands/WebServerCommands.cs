using System;
using System.Net;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using TrollRAT.Actions;
using TrollRAT.Payloads;
using TrollRAT.Plugins;
using TrollRAT.Utils;

namespace TrollRAT.Server.Commands
{
    public class RootCommand : WebServerCommand
    {
        public override Regex Path => new Regex("^/?(index(\\.html|\\.php)?)?$");

        private string site;

        public RootCommand(WebServer server) : base(server)
        {
            site = ResourceUtil.getResourceString("TrollRAT.Web.HTML.main.html");
        }

        public override void execute(HttpListenerContext context)
        {
            string newSite = site;

            foreach (string placeholder in server.injections.Keys)
            {
                StringBuilder replacement = new StringBuilder();

                foreach (string injection in server.injections[placeholder])
                {
                    replacement.Append(injection);
                }

                newSite = newSite.Replace(placeholder, replacement.ToString());
            }

            respondString(newSite, context.Response, "text/html");
        }
    }

    public class PayloadsCommand : WebServerCommand
    {
        public PayloadsCommand(WebServer server) : base(server) { }
        public override Regex Path => new Regex("^/payloads$");

        public override void execute(HttpListenerContext context)
        {
            StringBuilder content = new StringBuilder();
            foreach (Payload payload in server.Payloads)
            {
                content.Append("<a href=\"javascript:void(0);\" onclick=\"onPayloadSelected(this);\" class=\"list-group-item clearfix\">");
                content.Append(payload.Name);
                content.Append("<span class=\"pull-right\">");

                foreach (PayloadAction action in payload.Actions)
                {
                    string btn = action.getListButton();
                    if (btn != null)
                    {
                        content.Append(btn);
                    }
                }

                content.Append("</span></a>");
            }

            string response = content.ToString();
            if (response.Length < 1)
            {
                response = "<p>Nothing defined.</p>";
            }

            respondString(response, context.Response, "text/html");
        }
    }

    public class GlobalActionsCommand : WebServerCommand
    {
        public GlobalActionsCommand(WebServer server) : base(server) { }
        public override Regex Path => new Regex("^/globalactions$");

        public override void execute(HttpListenerContext context)
        {
            StringBuilder content = new StringBuilder();
            foreach (GlobalAction action in server.Actions)
            {
                content.Append(action.getHTML(null) + "\n");
            }

            string response = content.ToString();
            respondString(response, context.Response, "text/html");
        }
    }

    public class AboutCommand : WebServerCommandBase
    {
        public override Regex Path => new Regex("^/about$");

        public override void execute(HttpListenerContext context)
        {
            StringBuilder about = new StringBuilder();

            Version version = Assembly.GetCallingAssembly().GetName().Version;
            about.Append(String.Format("<p><strong>TrollRAT {0}.{1}</strong> - Remote Trolling Software by Leurak</p>", version.Major, version.Minor));
            about.Append("<p><strong>Source Code</strong> is <a href=\"http://github.com/Leurak/TrollRAT\">on GitHub</a>, Licensed under MIT License</p>");

            about.Append("<p><strong>Loaded Plugins: </strong>");
            foreach (ITrollRATPlugin plugin in TrollRAT.pluginManager.plugins)
            {
                about.Append(plugin.Name + ", ");
            }

            if (TrollRAT.pluginManager.plugins.Length == 0)
                about.Append("None");
            else
                about.Remove(about.Length - 2, 2);

            about.Append("</p>");

            respondString(about.ToString(), context.Response, "text/html");
        }
    }
}
