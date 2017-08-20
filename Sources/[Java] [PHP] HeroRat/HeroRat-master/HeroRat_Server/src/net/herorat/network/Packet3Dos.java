package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet3Dos extends Packet
{	
	public Packet3Dos()
	{
		super(3);
	}

	public Packet3Dos(DataInputStream inputstream)
	{
		super(inputstream, 3);
	}
	
	public Packet3Dos(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 3, objects);
	}
}