using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using uRAT.Server.Builder;
using uRAT.Server.Tools.Extensions;

namespace uRAT.Server.Tools
{
    internal class SettingsHelper
    {
        public class PluginMetadata
        {
            public Guid Guid { get; set; }
            public string Name { get; set; }
            public string Author { get; set; }
            public Version Version { get; set; }
            public string Description { get; set; }
            public bool Enabled { get; set; }
        }

        public void CreateSettingsFile()
        {
            var xmlDoc = new XDocument();
            var globalRoot = new XElement("doc");
            var rootElem = new XElement("Plugins");
            foreach (var pluginHost in Globals.PluginAggregator.LoadedPlugins)
            {
                var pluginElem =
                    new XElement("Plugin",
                        new XAttribute("GUID", pluginHost.PluginHostGuid.ToString()),
                        new XElement("Name", pluginHost.PluginHost.Name),
                        new XElement("Author", pluginHost.PluginHost.Author),
                        new XElement("Version", pluginHost.PluginHost.Version.ToString()),
                        new XElement("Description", pluginHost.PluginHost.Description),
                        new XElement("Enabled", pluginHost.Enabled ? "True" : "False")
                        );
                rootElem.Add(pluginElem);
            }
            globalRoot.Add(rootElem);
            xmlDoc.Add(globalRoot);
            xmlDoc.Save("settings.xml");
        }

        #region Plugin

        public List<PluginMetadata> FetchAllPlugins()
        {
            return FetchAllPluginsImpl().ToList();
        }

        public PluginMetadata FetchPlugin(Guid pluginGuid)
        {
            var xmlDoc = XDocument.Load("settings.xml");
            var elem =
                xmlDoc.Root
                    .Element("Plugins").Elements()
                    .First(e => e.Attribute("GUID").Value == pluginGuid.ToString());
            var linko = elem.Element("Name");
            Console.WriteLine(linko);
            return new PluginMetadata
            {
                Guid = pluginGuid,
                Name = elem.Element("Name").Value,
                Author = elem.Element("Author").Value,
                Description = elem.Element("Description").Value,
                Version = new Version(elem.Element("Version").Value),
                Enabled = elem.Element("Enabled").Value == "True"
            };
        }

        private IEnumerable<PluginMetadata> FetchAllPluginsImpl()
        {
            var xmlDoc = XDocument.Load("settings.xml");
            return xmlDoc.Root
                .Element("Plugins").Elements().Select(elem => new PluginMetadata
                {
                    Guid = new Guid(elem.Attribute("GUID").Value),
                    Name = elem.Element("Name").Value,
                    Author = elem.Element("Author").Value,
                    Description = elem.Element("Description").Value,
                    Version = new Version(elem.Element("Version").Value),
                    Enabled = elem.Element("Enabled").Value == "True"
                });
        }

        public void UpdatePlugin(Guid pluginGuid, Action<PluginMetadata> action)
        {
            var xmlDoc = XDocument.Load("settings.xml");
            var elem =
                xmlDoc.Element("PluginSettings")
                    .Element("Plugins").Elements()
                    .First(e => e.Attribute("GUID").Value == pluginGuid.ToString());
            var pluginMd = FetchPlugin(pluginGuid);
            action(pluginMd);

            elem.Element("Name").Value = pluginMd.Name;
            elem.Element("Author").Value = pluginMd.Author;
            elem.Element("Version").Value = pluginMd.Version.ToString();
            elem.Element("Description").Value = pluginMd.Description;
            elem.Element("Enabled").Value = pluginMd.Enabled ? "True" : "False";

            xmlDoc.Save("settings.xml");
        }

        public void TogglePluginStatus(Guid pluginGuid, bool status)
        {
            UpdatePlugin(pluginGuid, p => p.Enabled = status);
        }

        #endregion

        #region Builder
        public void CreateBuilderProfile(string name, BuildSettings settings)
        {
            var xmlDoc = XDocument.Load("settings.xml", LoadOptions.None);
            if (xmlDoc.Root.Elements().FirstOrDefault(e => e.Name == "BuilderProfiles") == null)
            {
                var rootElem = new XElement("BuilderProfiles");
                var profile =
                    new XElement("Profile",
                        new XAttribute("Name", name),
                        new XElement("Hostname", settings.Hostname),
                        new XElement("Port", settings.Port.ToString()),
                        new XElement("ReconnectDelay", settings.ReconnectDelay.ToString()),
                        new XElement("InstallationPath", ((int) settings.InstallationPath).ToString()),
                        new XElement("Filename", settings.Filename),
                        new XElement("MergeDependencies", settings.MergeDependencies ? "True" : "False")
                        );
                        
                rootElem.Add(profile);
                xmlDoc.Root.Add(rootElem);
            }
            else
            {
                var profile =
                    new XElement("Profile",
                        new XAttribute("Name", name),
                        new XElement("Hostname", settings.Hostname),
                        new XElement("Port", settings.Port.ToString()),
                        new XElement("ReconnectDelay", settings.ReconnectDelay.ToString()),
                        new XElement("InstallationPath", ((int) settings.InstallationPath).ToString()),
                        new XElement("Filename", settings.Filename),
                        new XElement("MergeDependencies", settings.MergeDependencies ? "True" : "False")
                        );
                xmlDoc.Root.Element("BuilderProfiles").Add(profile);
            }

            xmlDoc.Save("settings.xml");
        }

        public List<string> FetchAllBuilderProfiles()
        {
            var xmlDoc = XDocument.Load("settings.xml", LoadOptions.None);
            if (xmlDoc.Root.Elements().FirstOrDefault(e => e.Name == "BuilderProfiles") == null)
                return new List<string>();
            return FetchAllBuilderProfilesImpl().ToList();
        }

        public BuildSettings FetchBuilderProfile(string name)
        {
            var xmlDoc = XDocument.Load("settings.xml");
            var elem =
                xmlDoc.Root.Element("BuilderProfiles").Elements()
                    .First(e => e.Attribute("Name").Value == name);
            return new BuildSettings
            {
                Filename = elem.Element("Filename").Value,
                Hostname = elem.Element("Hostname").Value,
                InstallationPath = (InstallationPath) Int32.Parse(elem.Element("InstallationPath").Value),
                Port = Int32.Parse(elem.Element("Port").Value),
                ReconnectDelay = Int32.Parse(elem.Element("ReconnectDelay").Value),
                MergeDependencies = elem.Element("MergeDependencies").Value == "True"
            };
        }

        public void UpdateBuilderProfile(string name, Action<BuildSettings> action)
        {
            var xmlDoc = XDocument.Load("settings.xml");
            var elem =
                xmlDoc.Root.Element("BuilderProfiles").Elements()
                    .First(e => e.Attribute("Name").Value == name);
            var settings = FetchBuilderProfile(name);
            action(settings);

            elem.Element("Hostname").Value = settings.Hostname;
            elem.Element("Port").Value = settings.Port.ToString();
            elem.Element("ReconnectDelay").Value = settings.ReconnectDelay.ToString();
            elem.Element("InstallationPath").Value = ((int)settings.InstallationPath).ToString();
            elem.Element("Filename").Value = settings.Filename;
            elem.Element("MergeDependencies").Value = settings.MergeDependencies ? "True" : "False";

            xmlDoc.Save("settings.xml");
        }

        private static IEnumerable<string> FetchAllBuilderProfilesImpl()
        {
            var xmlDoc = XDocument.Load("settings.xml", LoadOptions.None);
            return xmlDoc.Root.Element("BuilderProfiles").Elements().Select(elem => elem.Attribute("Name").Value);
        }

        #endregion
    }
}