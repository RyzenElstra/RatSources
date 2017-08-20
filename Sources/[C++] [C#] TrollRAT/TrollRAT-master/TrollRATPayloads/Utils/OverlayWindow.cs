using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Threading;

namespace TrollRATPayloads.Utils
{
    public static class OverlayWindow
    {
        [DllImport("TrollRATNative.dll")]
        public static extern IntPtr getOverlayDC();

        [DllImport("TrollRATNative.dll")]
        public static extern void updateOverlay();

        [DllImport("TrollRATNative.dll")]
        public static extern void initOverlay();

        [DllImport("user32.dll")]
        public static extern IntPtr GetDesktopWindow();

        public static readonly Graphics OverlayGrahpics;
        public static readonly Graphics ScreenGraphics = Graphics.FromHwndInternal(GetDesktopWindow());

        static OverlayWindow()
        {
            initOverlay();

            while (getOverlayDC() == IntPtr.Zero) { }
            Thread.Sleep(1000); // idk why I have to do this

            OverlayGrahpics = Graphics.FromHdc(getOverlayDC());
        }
    }
}
