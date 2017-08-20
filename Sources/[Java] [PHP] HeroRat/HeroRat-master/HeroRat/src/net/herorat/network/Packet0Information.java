package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet0Information extends Packet
{	
	public Packet0Information()
	{
		super(0);
	}

	public Packet0Information(DataInputStream inputstream)
	{
		super(inputstream, 0);
	}
	
	public Packet0Information(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 0, objects);
	}
}