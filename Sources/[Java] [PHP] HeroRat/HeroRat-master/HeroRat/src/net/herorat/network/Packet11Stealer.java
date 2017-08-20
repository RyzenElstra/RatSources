package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet11Stealer extends Packet
{	
	public Packet11Stealer()
	{
		super(11);
	}

	public Packet11Stealer(DataInputStream inputstream)
	{
		super(inputstream, 11);
	}
	
	public Packet11Stealer(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 11, objects);
	}
}