package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet5Chat extends Packet
{	
	public Packet5Chat()
	{
		super(5);
	}

	public Packet5Chat(DataInputStream inputstream)
	{
		super(inputstream, 5);
	}
	
	public Packet5Chat(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 5, objects);
	}
}