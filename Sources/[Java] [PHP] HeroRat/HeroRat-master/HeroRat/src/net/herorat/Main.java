package net.herorat;

import java.io.IOException;

import javax.swing.UIManager;

import net.herorat.gui.FrameCluf;

import net.herorat.gui.MainWindow;
import net.herorat.network.Network;

public class Main
{	
	public static String expiration_date = "1356044400000";
	
	public static MainWindow mainWindow = null;
	public static Network network = null;
	
	public static void main(String[] args) throws IOException
	{
		if (args.length == 1) expiration_date = args[0] + "000";
		
		try
		{
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
 			UIManager.put("AuditoryCues.playList", UIManager.get("AuditoryCues.allAuditoryCues"));
		}
		catch(RuntimeException ex)
		{
			javax.swing.JOptionPane.showMessageDialog(null, "This program is already running!");
			System.exit(0);
		}
		catch (Exception e) {}
		
		new FrameCluf();
	}
}