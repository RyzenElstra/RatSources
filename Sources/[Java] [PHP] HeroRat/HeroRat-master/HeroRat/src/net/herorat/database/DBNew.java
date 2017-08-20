package net.herorat.database;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;

import net.herorat.utils.Crypto;


public class DBNew
{
	private static String file = "config/configuration.db";
	
	public static void saveCreate(String ip, String password, int port, String directory, boolean startup, String process)
	{
		init();
		try
		{
			StringBuffer buffer = new StringBuffer();
			FileInputStream fstream = new FileInputStream(file);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			
			boolean first = true;
			String line;
			while ((line = br.readLine()) != null)
			{
				if (first)
				{
					line = Crypto.byteToHex( Crypto.crypt(ip + "###" + password + "###" + port + "###" + directory + "###" + (startup ? "checked" : "unchecked") + "###" + process) );
					first = false;
				}
				buffer.append(line + "\n");
			}
			in.close();
			
			FileWriter writer = new FileWriter(file);
			BufferedWriter out = new BufferedWriter(writer);
			out.write(buffer.toString());
			out.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void saveConnect(String password, String port)
	{
		init();
		try
		{
			StringBuffer buffer = new StringBuffer();
			FileInputStream fstream = new FileInputStream(file);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			
			boolean first = true;
			String line;
			while ((line = br.readLine()) != null)
			{
				if (first) first = false;
				else line = Crypto.byteToHex( Crypto.crypt(password + "###" + port) );
				
				buffer.append(line + "\n");
			}
			in.close();
			
			FileWriter writer = new FileWriter(file);
			BufferedWriter out = new BufferedWriter(writer);
			out.write(buffer.toString());
			out.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static String[] getCreate()
	{
		init();
		try
		{
			FileInputStream fstream = new FileInputStream(file);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			
			String line;
			while ((line = br.readLine()) != null)
			{
				line = new String(Crypto.decrypt( Crypto.hexToByte(line) ));
				if (!line.equals("")) return line.split("###");
			}
			in.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return new String[] { "", "", "2001", "", "unchecked", "Adobe Reader Update" };
	}
	
	public static String[] getConnect()
	{
		init();
		try
		{
			FileInputStream fstream = new FileInputStream(file);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			
			boolean first = true;
			String line;
			while ((line = br.readLine()) != null)
			{
				line = new String(Crypto.decrypt( Crypto.hexToByte(line) ));
				if (first) first = false;
				else if (!line.equals("")) return line.split("###");
			}
			in.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return new String[] { "SECRET_PASSWORD", "2001" };
	}
	
	public static void init()
	{
		try
		{
			File folder = new File("config");
			if (!folder.exists())
			{
				folder.mkdir();
			}
			
			File dbFile = new File(file);
			if (!dbFile.exists())
			{
				dbFile.createNewFile();
				FileWriter writer = new FileWriter(file);
				BufferedWriter out = new BufferedWriter(writer);
				out.write("\n");
				out.write("\n");
				out.close();
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
