using System;
using TrollRAT.Utils;

namespace TrollRAT.Payloads
{
    public abstract class PayloadAction : IDBase<PayloadAction>
    {
        protected Payload payload;
        public Payload Payload => payload;

        public PayloadAction(Payload payload)
        {
            this.payload = payload;
        }

        public abstract string getListButton();
        public abstract string getSettingsButton();

        // Returns JavaScript to be executed by the client
        public abstract string execute();

        // Returns the JavaScript that should be used for the button
        // in order to trigger its server routine
        public virtual string getExecuteJavascript()
        {
            return String.Format("execute({0});", id);
        }
    }

    public abstract class SimplePayloadAction : PayloadAction
    {
        public SimplePayloadAction(Payload payload) : base(payload) { }

        public abstract string Title { get; }
        public abstract string Icon { get; }
        public virtual string Color => "default";

        public override string getListButton()
        {
            if (Icon == null)
                return null;

            return String.Format("<span onclick=\"{0}\" class=\"btn btn-{2} btn-xs\">" +
                "<span class=\"glyphicon glyphicon-{1}\" aria-hidden=\"true\"></span></span> ",
                getExecuteJavascript(), Icon, Color);
        }

        public override string getSettingsButton()
        {
            return String.Format("<button type=\"button\" onclick=\"{0}\" class=\"btn btn-{2} btn-xl\">" +
               "{1}</button> ", getExecuteJavascript(), Title, Color);
        }
    }

    public abstract class DangerousPayloadAction : SimplePayloadAction
    {
        public DangerousPayloadAction(Payload payload) : base(payload) { }

        // TODO Proper Escaping
        public abstract string WarningMessage { get; }

        public override string Color => "danger";

        public override string getExecuteJavascript()
        {
            return String.Format("showYesNo('{0}', '{2}', '{1}');", WarningMessage, base.getExecuteJavascript(), Title);
        }
    }

    public class PayloadActionExecute : SimplePayloadAction
    {
        public override string Title => "Execute";
        public override string Icon => "cog";

        public PayloadActionExecute(Payload payload) : base(payload) { }

        public override string execute()
        {
            if (payload is ExecutablePayload)
            {
                ExecutablePayload pl = ((ExecutablePayload)payload);
                pl.Execute();
            }
            else
            {
                throw new ArgumentException("Payload is not an ExecutablePayload");
            }

            return "void(0);";
        }
    }

    public class PayloadActionStartStop : SimplePayloadAction
    {
        LoopingPayload pl;
        public PayloadActionStartStop(Payload payload) : base(payload)
        {
            if (payload is LoopingPayload)
                pl = ((LoopingPayload)payload);
            else
                throw new ArgumentException("Payload is not a LoopingPayload");
        }

        public override string execute()
        {
            if (pl.Running)
                pl.Stop();
            else
                pl.Start();

            return "update();";
        }
        
        public override string Icon => pl.Running ? "stop" : "play";
        public override string Title => pl.Running ? "Stop" : "Start";
    }
}
