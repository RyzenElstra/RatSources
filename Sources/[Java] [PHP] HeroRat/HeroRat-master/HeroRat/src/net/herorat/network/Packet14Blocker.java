package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;


public class Packet14Blocker extends Packet
{	
	public Packet14Blocker()
	{
		super(14);
	}

	public Packet14Blocker(DataInputStream inputstream)
	{
		super(inputstream, 14);
	}
	
	public Packet14Blocker(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 14, objects);
	}
}