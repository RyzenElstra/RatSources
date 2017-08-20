package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet8Message extends Packet
{	
	public Packet8Message()
	{
		super(8);
	}

	public Packet8Message(DataInputStream inputstream)
	{
		super(inputstream, 8);
	}
	
	public Packet8Message(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 8, objects);
	}
}