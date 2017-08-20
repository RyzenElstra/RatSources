package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet17Suicide extends Packet
{	
	public Packet17Suicide()
	{
		super(17);
	}

	public Packet17Suicide(DataInputStream inputstream)
	{
		super(inputstream, 17);
	}
	
	public Packet17Suicide(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 17, objects);
	}
}