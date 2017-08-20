package net.herorat.database;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;

import net.herorat.utils.Crypto;


public class DBServers
{
	private static String file = "config/servers.db";
	
	public static String getComment(String uid)
	{
		init();
		if (exists(uid))
		{
			try
			{
				FileInputStream fstream = new FileInputStream(file);
				DataInputStream in = new DataInputStream(fstream);
				BufferedReader br = new BufferedReader(new InputStreamReader(in));
				String line;
				while ((line = br.readLine()) != null)
				{
					line = new String(Crypto.decrypt( Crypto.hexToByte(line) ));
					if (line.startsWith(uid))
					{
						return line.split("###")[1];
					}
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			add(uid, " ");
		}
		
		return " ";
	}
	
	public static void add(String uid, String comment)
	{
		init();
		try
		{
			FileWriter writer = new FileWriter(file, true);
			BufferedWriter out = new BufferedWriter(writer);
			out.write(Crypto.byteToHex( Crypto.crypt(uid + "###" + (comment.isEmpty() ? " " : comment)) ));
			out.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void update(String uid, String comment)
	{
		init();
		try
		{
			StringBuffer buffer = new StringBuffer();
			FileInputStream fstream = new FileInputStream(file);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String line, decrypted_line;
			while ((line = br.readLine()) != null)
			{
				decrypted_line = new String(Crypto.decrypt( Crypto.hexToByte(line) ));
				if (decrypted_line.startsWith(uid))
				{
					line = Crypto.byteToHex( Crypto.crypt(uid + "###" + (comment.isEmpty() ? " " : comment)) );
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
	
	public static boolean exists(String uid)
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
				if (line.startsWith(uid)) return true;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static int getCount()
	{
		init();
		int count = 0;
		try
		{
			FileInputStream fstream = new FileInputStream(file);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			while (br.readLine() != null)
			{
				count ++;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
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
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}