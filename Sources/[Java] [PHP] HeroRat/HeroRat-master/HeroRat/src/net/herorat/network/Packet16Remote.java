package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet16Remote extends Packet
{	
	public Packet16Remote()
	{
		super(16);
	}

	public Packet16Remote(DataInputStream inputstream)
	{
		super(inputstream, 16);
	}
	
	public Packet16Remote(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 16, objects);
	}
}