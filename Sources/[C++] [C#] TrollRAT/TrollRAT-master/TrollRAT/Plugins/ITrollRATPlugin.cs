namespace TrollRAT.Plugins
{
    public interface ITrollRATPlugin
    {
        string Name { get; }
        void onLoad();
    }
}
