package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet15Clipboard extends Packet
{	
	public Packet15Clipboard()
	{
		super(15);
	}

	public Packet15Clipboard(DataInputStream inputstream)
	{
		super(inputstream, 15);
	}
	
	public Packet15Clipboard(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 15, objects);
	}
}