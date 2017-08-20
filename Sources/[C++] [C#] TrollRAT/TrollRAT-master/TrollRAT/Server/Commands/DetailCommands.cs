using System;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

using TrollRAT.Payloads;

namespace TrollRAT.Server.Commands
{
    public abstract class DetailCommandBase : WebServerCommand
    {
        public DetailCommandBase(WebServer server) : base(server) { }

        public abstract void writeHTML(Payload payload, StringBuilder builder);

        public override void execute(HttpListenerContext context)
        {
            StringBuilder content = new StringBuilder();

            try
            {
                int pl = Int32.Parse(HttpUtility.ParseQueryString(context.Request.Url.Query).Get("payload"));

                if (pl >= 0 && pl < server.Payloads.Count)
                {
                    Payload payload = server.Payloads[pl];
                    writeHTML(payload, content);
                }
                else
                {
                    content.Append("<p>Please select something.</p>");
                }

                string response = content.ToString();
                if (response.Length < 1)
                {
                    response = "<p>Nothing defined.</p>";
                }

                respondString(response, context.Response, "text/html");
            }
            catch (Exception ex) when (ex is FormatException || ex is OverflowException || ex is ArgumentNullException)
            {
                context.Response.StatusCode = 400;
            }
        }
    }

    public class SettingsCommand : DetailCommandBase
    {
        public SettingsCommand(WebServer server) : base(server) { }

        public override Regex Path => new Regex("^/settings$");

        public override void writeHTML(Payload payload, StringBuilder builder)
        {
            foreach (PayloadSetting setting in payload.Settings)
            {
                setting.writeHTML(builder);
            }
        }
    }

    public class ActionsCommand : DetailCommandBase
    {
        public ActionsCommand(WebServer server) : base(server) { }

        public override Regex Path => new Regex("^/actions$");

        public override void writeHTML(Payload payload, StringBuilder builder)
        {
            foreach (PayloadAction action in payload.Actions)
            {
                string btn = action.getSettingsButton();
                if (btn != null)
                {
                    builder.Append(btn);
                }
            }
        }
    }
}
