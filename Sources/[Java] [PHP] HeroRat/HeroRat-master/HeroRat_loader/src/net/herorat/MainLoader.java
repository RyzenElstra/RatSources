package net.herorat;

import javax.swing.UIManager;

import net.herorat.gui.FrameSplash;
import net.herorat.utils.Lock;

public class MainLoader
{
	public static void main(String[] args)
	{
		try
		{
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
 			UIManager.put("AuditoryCues.playList", UIManager.get("AuditoryCues.allAuditoryCues"));
		}
		catch (Exception e) {}
		
		new Lock();
		new FrameSplash();
	}
}