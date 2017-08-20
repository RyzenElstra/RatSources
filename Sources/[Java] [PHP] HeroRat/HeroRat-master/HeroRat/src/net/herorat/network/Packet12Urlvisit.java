package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet12Urlvisit extends Packet
{	
	public Packet12Urlvisit()
	{
		super(12);
	}

	public Packet12Urlvisit(DataInputStream inputstream)
	{
		super(inputstream, 12);
	}
	
	public Packet12Urlvisit(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 12, objects);
	}
}