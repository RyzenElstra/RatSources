package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;

import net.herorat.utils.Crypto;


public abstract class Packet
{
	protected int packet_id;
	protected String[] objects;
	
	protected DataInputStream inputstream;
	protected DataOutputStream outputstream;
	
	public Packet(int packet_id)
	{
		this.packet_id = packet_id;
	}
	
	public Packet(DataInputStream inputstream, int packet_id)
	{
		this.inputstream = inputstream;
		this.packet_id = packet_id;
	}
	
	public Packet(DataOutputStream outputstream, int packet_id, String[] objects)
	{
		this.outputstream = outputstream;
		this.packet_id = packet_id;
		this.objects = objects;
	}
	
	public void write()
	{
		try
		{
			int packet_size = 0;
			for (String s: objects)
			{
				if (s.length() > 20000)
					packet_size += (s.length() / 20000) + (s.length() % 20000 == 0 ? 0 : 1);
				else
					packet_size += 1;
			}
			
			this.outputstream.writeInt(this.packet_id);
			this.outputstream.writeInt(packet_size);
			for (String s: objects)
			{
				int parts = (s.length() / 20000) + (s.length() % 20000 == 0 ? 0 : 1);
				for (int i=0; i<parts; i++)
				{
					String data = s.substring(i * 20000, (i * 20000 + 20000 < s.length()) ? i * 20000 + 20000 : s.length());
					this.outputstream.writeUTF( Crypto.byteToHex( Crypto.crypt(data.getBytes()) ) );
				}
			}
			this.outputstream.flush();
		}
		catch (Exception e) {}
	}
	
	public String[] read()
	{
		try
		{
			int size = this.inputstream.readInt();
			this.objects = new String[size];
			for (int i=0; i<size; i++)
			{
				this.objects[i] = new String(Crypto.decrypt( Crypto.hexToByte(this.inputstream.readUTF())));
			}
			return this.objects;
		}
		catch (Exception e) {}
		
		return new String[] {};
	}
}