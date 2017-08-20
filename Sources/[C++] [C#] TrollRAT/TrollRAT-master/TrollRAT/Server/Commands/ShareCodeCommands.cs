using System;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;
using TrollRAT.Utils;

namespace TrollRAT.Server.Commands
{
    public class GenerateCodeCommand : WebServerCommandBase
    {
        public override Regex Path => new Regex("^/generatecode$");

        public override void execute(HttpListenerContext context)
        {
            string code = ShareCodeUtil.createShareCode();
            respondString(code, context.Response, "text/plain");
        }
    }

    public class UseCodeCommand : WebServerCommandBase
    {
        public override Regex Path => new Regex("^/usecode$");

        public override void execute(HttpListenerContext context)
        {
            var code = new StreamReader(context.Request.InputStream).ReadToEnd();

            try
            {
                ShareCodeUtil.readShareCode(code);
            } catch (ShareCodeUtil.ShareCodeWrongVersionException)
            {
                respondString("alert('The share code version hash is different from the current one.\\n\\n" +
                    "This means, the code is either made for a different version of TrollRAT, " +
                    "uses a different set of plugins or is simply corrupted.');", context.Response, "text/javascript");
            } catch (Exception)
            {
                respondString("alert('An error occured while parsing the share code.\\n\\nIs the code invalid or corrupted?');", context.Response, "text/javascript");
            }

            context.Response.StatusCode = 200;
        }
    }
}
