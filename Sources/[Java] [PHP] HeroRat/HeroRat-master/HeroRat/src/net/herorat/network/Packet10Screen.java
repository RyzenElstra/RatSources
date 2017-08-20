package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;


public class Packet10Screen extends Packet
{	
	public Packet10Screen()
	{
		super(10);
	}

	public Packet10Screen(DataInputStream inputstream)
	{
		super(inputstream, 10);
	}
	
	public Packet10Screen(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 10, objects);
	}
}