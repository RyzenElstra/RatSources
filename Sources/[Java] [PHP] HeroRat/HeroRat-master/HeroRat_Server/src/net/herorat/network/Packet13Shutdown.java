package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet13Shutdown extends Packet
{
	public Packet13Shutdown()
	{
		super(13);
	}

	public Packet13Shutdown(DataInputStream inputstream)
	{
		super(inputstream, 13);
	}
	
	public Packet13Shutdown(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 13, objects);
	}
}