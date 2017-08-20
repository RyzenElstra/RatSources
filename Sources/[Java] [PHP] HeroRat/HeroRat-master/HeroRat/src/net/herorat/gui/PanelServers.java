package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.DropMode;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTable;

import net.herorat.Main;
import net.herorat.database.DBServers;
import net.herorat.features.clipboard.Clipboard;
import net.herorat.features.servers.Server;
import net.herorat.features.shutdown.Shutdown;
import net.herorat.features.suicide.Suicide;
import net.herorat.network.Network;
import net.herorat.utils.Utils;


public class PanelServers extends JPanel
{
	private static final long serialVersionUID = 4945328026932295178L;
	
	public TableModel model_servers;
	
	private JPopupMenu menu_dropdown;
	
	private JTable table_servers;
	private JScrollPane scroll_servers;
	
	public PanelServers()
	{
		initComponents();
		display();
	}
	
	private void initComponents()
	{
		setLayout(new BorderLayout(5, 0));
		createModel();
		createDropDown();
		createTable();
	}
	
	private void display()
	{
		setVisible(true);
	}
	
	private void createModel()
	{
		model_servers = new TableModel(new String[] { "CC", "WAN", "Username", "OS", "Uptime", "Ping", "UID", "Comment" });
	}
	
	private void createDropDown()
	{
		menu_dropdown = new JPopupMenu();
		
		JMenuItem item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/email.png"))));
		item.setText("Chat");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Main.mainWindow.pane_tabs.setSelectedIndex(7);
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				int pos = Network.getServerPositionInList(server);
				Main.mainWindow.panel_tab8.combo_select.setSelectedIndex(pos);
				if (pos != 0) Main.mainWindow.panel_tab8.combo_selected_item = String.valueOf(Main.mainWindow.panel_tab8.combo_select.getSelectedItem());
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/console.png"))));
		item.setText("Console");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Main.mainWindow.pane_tabs.setSelectedIndex(4);
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				int pos = Network.getServerPositionInList(server);
				Main.mainWindow.panel_tab5.combo_select.setSelectedIndex(pos);
				if (pos != 0) Main.mainWindow.panel_tab5.combo_selected_item = String.valueOf(Main.mainWindow.panel_tab5.combo_select.getSelectedItem());
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/folder.png"))));
		item.setText("File manager");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Main.mainWindow.pane_tabs.setSelectedIndex(8);
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				int pos = Network.getServerPositionInList(server);
				Main.mainWindow.panel_tab9.combo_select.setSelectedIndex(pos);
				if (pos != 0) Main.mainWindow.panel_tab9.combo_selected_item = String.valueOf(Main.mainWindow.panel_tab9.combo_select.getSelectedItem());
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/process.gif"))));
		item.setText("Task manager");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Main.mainWindow.pane_tabs.setSelectedIndex(6);
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				int pos = Network.getServerPositionInList(server);
				Main.mainWindow.panel_tab7.combo_select.setSelectedIndex(pos);
				if (pos != 0) Main.mainWindow.panel_tab7.combo_selected_item = String.valueOf(Main.mainWindow.panel_tab7.combo_select.getSelectedItem());
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/capture.png"))));
		item.setText("Remote control");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Main.mainWindow.pane_tabs.setSelectedIndex(2);
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				int pos = Network.getServerPositionInList(server);
				Main.mainWindow.panel_tab3.combo_select.setSelectedIndex(pos);
				if (pos != 0) Main.mainWindow.panel_tab3.combo_selected_item = String.valueOf(Main.mainWindow.panel_tab3.combo_select.getSelectedItem());
			}
		});
		menu_dropdown.add(item);

		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/parental.png"))));
		item.setText("Parental control");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				if (server != null) new FrameBlocker(server);
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/key.png"))));
		item.setText("Password manager");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Main.mainWindow.pane_tabs.setSelectedIndex(9);
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				int pos = Network.getServerPositionInList(server);
				Main.mainWindow.panel_tab10.combo_select.setSelectedIndex(pos);
				if (pos != 0) Main.mainWindow.panel_tab10.combo_selected_item = String.valueOf(Main.mainWindow.panel_tab10.combo_select.getSelectedItem());
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/internet.png"))));
		item.setText("Internet");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				if (server != null) new FrameUrlVisit(server);
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/keyboard.png"))));
		item.setText("Keylogger");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Main.mainWindow.pane_tabs.setSelectedIndex(10);
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				int pos = Network.getServerPositionInList(server);
				Main.mainWindow.panel_tab11.combo_select.setSelectedIndex(pos);
				if (pos != 0) Main.mainWindow.panel_tab11.combo_selected_item = String.valueOf(Main.mainWindow.panel_tab11.combo_select.getSelectedItem());
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/clipboard.gif"))));
		item.setText("Copy Clipboard");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				if (server != null) Clipboard.send(server);
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/comment.png"))));
		item.setText("Edit comment");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				if (server != null)
				{
					String comment = (String)JOptionPane.showInputDialog(null, "Comment:", server.getServerName() + " @ " + server.getIp(), JOptionPane.QUESTION_MESSAGE, null, null, null);
					DBServers.update(server.getUid(), comment);
					server.setComment(comment);
				}
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/shutdown.png"))));
		item.setText("Shutdown");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				if (server != null)
				{
					int response = JOptionPane.showConfirmDialog(null, "Do you really want to shutdown the selected server ?");
					if (response == 0) Shutdown.send(server);
				}
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/remove.png"))));
		item.setText("Uninstall");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				if (server != null)
				{
					int response = JOptionPane.showConfirmDialog(null, "Do you really want to uninstall the remote tool from the selected server?\nThis action cannot be canceled!");
					if (response == 0) Suicide.send(server);
				}
			}
		});
		menu_dropdown.add(item);
		
		item = new JMenuItem();
		item.setIcon(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/logger.png"))));
		item.setText("Properties");
		item.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Main.mainWindow.pane_tabs.setSelectedIndex(3);
				// TODO Set selection
				Server server = Network.servers.get(table_servers.getValueAt(table_servers.getSelectedRow(), 6).toString());
				int pos = Network.getServerPositionInList(server);
				Main.mainWindow.panel_tab4.combo_select.setSelectedIndex(pos);
				if (pos != 0) Main.mainWindow.panel_tab4.combo_selected_item = String.valueOf(Main.mainWindow.panel_tab4.combo_select.getSelectedItem());
			}
		});
		menu_dropdown.add(item);
	}
	
	private void createTable()
	{
		table_servers = new JTable();
		scroll_servers = new JScrollPane();
		
		table_servers.setModel(model_servers);
		table_servers.setComponentPopupMenu(menu_dropdown);
		table_servers.setDropMode(DropMode.ON);
		table_servers.setSelectionMode(0);
		table_servers.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent evt) {}
			public void mousePressed(MouseEvent evt)
			{
				int t = (int) (evt.getPoint().getY() / 32.0D);
				table_servers.getSelectionModel().setSelectionInterval(t, t);
			}
		});
		table_servers.getColumn("CC").setMaxWidth(48);
		table_servers.getColumn("CC").setMinWidth(48);
        table_servers.getColumn("WAN").setMaxWidth(100);
        table_servers.getColumn("WAN").setMinWidth(100);
        table_servers.getColumn("Uptime").setMaxWidth(80);
        table_servers.getColumn("Uptime").setMinWidth(80);
		table_servers.getColumn("Ping").setMaxWidth(50);
		table_servers.getColumn("Ping").setMinWidth(50);
        table_servers.getColumn("UID").setMaxWidth(128);
		scroll_servers.setViewportView(table_servers);
		add(scroll_servers);
		
		for (int i=0; i<table_servers.getColumnModel().getColumnCount(); i++) table_servers.getColumnModel().getColumn(i).setCellRenderer(new TableRendererServers());
		JLabel cell = ((JLabel)(table_servers.getColumnModel().getColumn(0).getCellRenderer()));
		cell.setHorizontalAlignment(JLabel.CENTER);
		
		table_servers.setRowHeight(32);
		table_servers.getTableHeader().setReorderingAllowed(false);
	}
}