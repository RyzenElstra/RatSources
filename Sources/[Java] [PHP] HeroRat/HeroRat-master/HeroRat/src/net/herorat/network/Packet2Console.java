package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

public class Packet2Console extends Packet
{	
	public Packet2Console()
	{
		super(2);
	}

	public Packet2Console(DataInputStream inputstream)
	{
		super(inputstream, 2);
	}
	
	public Packet2Console(DataOutputStream outputstream, String[] objects)
	{
		super(outputstream, 2, objects);
	}
}