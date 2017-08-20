package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet9Process extends Packet
{	
	public Packet9Process()
	{
		super(9);
	}

	public Packet9Process(DataInputStream inputstream)
	{
		super(inputstream, 9);
	}
	
	public Packet9Process(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 9, objects);
	}
}