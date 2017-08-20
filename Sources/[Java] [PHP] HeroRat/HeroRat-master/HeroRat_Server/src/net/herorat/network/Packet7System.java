package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet7System extends Packet
{	
	public Packet7System()
	{
		super(7);
	}

	public Packet7System(DataInputStream inputstream)
	{
		super(inputstream, 7);
	}
	
	public Packet7System(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 7, objects);
	}
}