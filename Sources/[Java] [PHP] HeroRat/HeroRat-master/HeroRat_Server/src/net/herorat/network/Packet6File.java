package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet6File extends Packet
{	
	public Packet6File()
	{
		super(6);
	}

	public Packet6File(DataInputStream inputstream)
	{
		super(inputstream, 6);
	}
	
	public Packet6File(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 6, objects);
	}
}