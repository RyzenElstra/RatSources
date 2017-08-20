package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet1Ping extends Packet
{	
	public Packet1Ping()
	{
		super(1);
	}

	public Packet1Ping(DataInputStream inputstream)
	{
		super(inputstream, 1);
	}
	
	public Packet1Ping(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 1, objects);
	}
}