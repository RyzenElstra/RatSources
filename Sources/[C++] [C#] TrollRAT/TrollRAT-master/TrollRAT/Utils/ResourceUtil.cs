using System.IO;
using System.Reflection;

namespace TrollRAT.Utils
{
    public static class ResourceUtil
    {
        public static string getResourceString(string path)
        {
            Assembly assembly = Assembly.GetExecutingAssembly();
            using (var stream = assembly.GetManifestResourceStream(path))
            using (var reader = new StreamReader(stream))
            {
                return reader.ReadToEnd();
            }
        }
    }
}
