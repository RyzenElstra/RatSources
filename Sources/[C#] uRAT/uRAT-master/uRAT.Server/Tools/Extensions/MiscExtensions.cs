using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;

namespace uRAT.Server.Tools.Extensions
{
    public static class MiscExtensions
    {
        public static void FlexibleInvoke<T>(this T ctrl, Action<T> action) where T : Control
        {
            if (ctrl.InvokeRequired)
            {
                ctrl.BeginInvoke(new Action<T, Action<T>>(FlexibleInvoke), ctrl, action);
                return;
            }

            action(ctrl);
        }

        public static string GetFileName(this string path)
        {
            return Path.GetFileName(path);
        }

        public static bool SequenceEquals(this byte[] data1, byte[] data2)
        {
            if (data1.Length != data2.Length)
                return false;
            return !data1.Where((t, i) => t != data2[i]).Any();
        }

        public static XmlElement QuickRetrieve(this XmlDocument doc, string elementName, int depth = 0,
            params string[] subElements)
        {
            XmlElement outElement;

            if (depth == 0)
                outElement = doc[elementName];
            else
                outElement = (XmlElement) doc.GetElementsByTagName(elementName)[depth];

            for (var i = 0; i < subElements.Length; i++)
                outElement = outElement[subElements[i]];

            return outElement;
        }

        public static void ForEach(this IEnumerable<XElement> elements, Action<XElement> action)
        {
            foreach (var elem in elements)
                action(elem);
        }
    }
}
