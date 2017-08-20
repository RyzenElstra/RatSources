package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Desktop;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.net.URL;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.SpinnerNumberModel;
import javax.swing.border.TitledBorder;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import net.herorat.Main;
import net.herorat.database.DBNew;
import net.herorat.features.create.Create;
import net.herorat.network.Network;


public class PanelNew extends JPanel
{
	private static final long serialVersionUID = 3307523993038192094L;
	
	private JPanel panel_top;
	
	private JPanel panel_stats;
	private JLabel label_status;
	public JLabel label_online;
	public JLabel label_offline;
	public JLabel label_total;
	private JLabel label_expiration;
	
	private JPanel panel_connect;
	private JLabel label_connect_password;
	private JPasswordField field_connect_password;
	private JLabel label_connect_port;
	private JSpinner field_connect_port;
	private JCheckBox box_connect_save;
	private JButton button_connect;
	private JButton button_disconnect;
	
	private JPanel panel_about;
	private JLabel label_about1;
	private JLabel label_about2;
	private JLabel label_about3;
	private JLabel label_about4;
	private JLabel label_about5;
	private JLabel label_about6;
	private JLabel label_about7;
	private JLabel label_about8;
	
	private JPanel bottom_panel;
	
	private JPanel panel_create;
	private JLabel label_ip;
	private JTextField field_ip;
	private JLabel label_password;
	private JPasswordField field_password;
	private JLabel label_port;
	private JSpinner field_port;
	private JLabel label_save;
	private JFileChooser chooser_save;
	private JTextField field_save;
	private JButton button_save;
	private JCheckBox box_startup;
	private JLabel label_startup;
	private JTextField field_startup;
	private JButton button_submit;
	
	private JPanel panel_news;
	private JScrollPane pane_news;
	private JTextPane text_news;
	private JLabel label_news;

	public PanelNew()
	{
		initComponents();
		display();
	}
	
	private void initComponents()
	{
		setLayout(new BorderLayout(5, 0));
		createStats();
		createConnect();
		createAbout();
		createPanel();
	}
	
	private void display()
	{
		setVisible(true);
	}

	private void createStats()
	{
		panel_top = new JPanel();
		
		panel_stats = new JPanel();
		panel_stats.setPreferredSize(new Dimension(200, 160));
		
		label_status = new JLabel("Status: Offline");
		label_status.setFont(new Font(label_status.getFont().getName(),Font.BOLD,label_status.getFont().getSize())); 
		label_status.setForeground(Color.RED);
		label_status.setPreferredSize(new Dimension(180, 20));
		
		label_online = new JLabel("Online servers: 0");
		label_online.setFont(new Font(label_online.getFont().getName(),Font.BOLD,label_online.getFont().getSize()));
		label_online.setForeground(new Color(44, 193, 17));
		label_online.setPreferredSize(new Dimension(180, 20));
		
		label_offline = new JLabel("Offline servers: 0");
		label_offline.setFont(new Font(label_offline.getFont().getName(),Font.BOLD,label_offline.getFont().getSize()));
		label_offline.setForeground(Color.RED);
		label_offline.setPreferredSize(new Dimension(180, 20));
		
		label_total = new JLabel("Total servers: 0");
		label_total.setFont(new Font(label_total.getFont().getName(),Font.BOLD,label_total.getFont().getSize()));
		label_total.setPreferredSize(new Dimension(180, 20));
		
		label_expiration = new JLabel("Expiration date: " + new SimpleDateFormat("yyyy-MM-dd").format(new Timestamp(Long.parseLong(Main.expiration_date))));
		label_expiration.setFont(new Font(label_expiration.getFont().getName(),Font.ITALIC,label_expiration.getFont().getSize()));
		label_expiration.setPreferredSize(new Dimension(180, 20));
		
		panel_stats.add(label_status);
		panel_stats.add(label_online);
		panel_stats.add(label_offline);
		panel_stats.add(label_total);
		panel_stats.add(label_expiration);
		
		TitledBorder titled = new TitledBorder("Stats");
		panel_stats.setBorder(titled);
		
		panel_top.add(panel_stats, BorderLayout.WEST);
	}	
		
	private void createConnect()
	{
		String[] previous_data = DBNew.getConnect();
		
		panel_connect = new JPanel();
		panel_connect.setPreferredSize(new Dimension(300, 160));
		label_connect_password = new JLabel("Password: ");
		label_connect_password.setPreferredSize(new Dimension(80, 20));
		field_connect_password = new JPasswordField(previous_data[0]);
		field_connect_password.setPreferredSize(new Dimension(150, 20));
		label_connect_port = new JLabel("Port: ");
		label_connect_port.setPreferredSize(new Dimension(80, 20));
		field_connect_port = new JSpinner();
		field_connect_port.setModel(new SpinnerNumberModel(Integer.parseInt(previous_data[1]), 1, 65000, 1));
		field_connect_port.setPreferredSize(new Dimension(150, 20));
		box_connect_save = new JCheckBox("Save password and port");
		box_connect_save.setPreferredSize(new Dimension(250, 20));
		button_connect = new JButton("Connect");
		button_connect.setPreferredSize(new Dimension(240, 25));
		button_connect.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				if (box_connect_save.isSelected())
				{
					DBNew.saveConnect(new String(field_connect_password.getPassword()), field_connect_port.getValue().toString());
				}
				
				field_connect_password.setEnabled(false);
				field_connect_port.setEnabled(false);
				button_connect.setEnabled(false);
				button_disconnect.setEnabled(true);
				
				label_status.setText("Status: Online");
				label_status.setForeground(new Color(44, 193, 17));
				
				Main.network = new Network(Integer.parseInt(field_connect_port.getValue().toString()), new String(field_connect_password.getPassword()));
				Main.network.start();
			}
		});
		button_disconnect = new JButton("Disconnect");
		button_disconnect.setPreferredSize(new Dimension(240, 25));
		button_disconnect.setEnabled(false);
		button_disconnect.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				Main.network.disconnect();
			
				field_connect_password.setEnabled(true);
				field_connect_port.setEnabled(true);
				button_disconnect.setEnabled(false);
				button_connect.setEnabled(true);
				
				label_status.setText("Status: Offline");
				label_status.setForeground(Color.RED);
			}
		});
		
		TitledBorder titled = new TitledBorder("Connection");
		panel_connect.setBorder(titled);
		
		panel_connect.add(label_connect_password);
		panel_connect.add(field_connect_password);
		panel_connect.add(label_connect_port);
		panel_connect.add(field_connect_port);
		panel_connect.add(box_connect_save);
		panel_connect.add(button_connect);
		panel_connect.add(button_disconnect);
		
		panel_top.add(panel_connect, BorderLayout.EAST);
	}	
	
	private void createAbout()
	{	
		panel_about = new JPanel();
		panel_about.setPreferredSize(new Dimension(200, 160));
		label_about1 = new JLabel("Hero  Rat  is  the  first  effective  Rat");
		label_about1.setPreferredSize(new Dimension(180, 12));
		label_about2 = new JLabel("working on Mac, Linux and  Windows!");
		label_about2.setPreferredSize(new Dimension(180, 12));
		label_about3 = new JLabel("Manage  all  your  network computers");
		label_about3.setPreferredSize(new Dimension(180, 12));
		label_about4 = new JLabel("from everywhere in the world.");
		label_about4.setPreferredSize(new Dimension(180, 12));
		label_about5 = new JLabel("I  decline  any  responsibility  for  the");
		label_about5.setPreferredSize(new Dimension(180, 12));
		label_about6 = new JLabel("use  that may be made  of this or the");
		label_about6.setPreferredSize(new Dimension(180, 12));
		label_about7 = new JLabel("information grabbed with this tool.");
		label_about7.setPreferredSize(new Dimension(180, 12));
		label_about8 = new JLabel("All rights reserved - 2012.");
		label_about8.setPreferredSize(new Dimension(180, 12));
		
		TitledBorder titled = new TitledBorder("About");
		panel_about.setBorder(titled);
		
		panel_about.add(label_about1);
		panel_about.add(label_about2);
		panel_about.add(label_about3);
		panel_about.add(label_about4);
		panel_about.add(label_about5);
		panel_about.add(label_about6);
		panel_about.add(label_about7);
		panel_about.add(label_about8);
		
		panel_top.add(panel_about, BorderLayout.CENTER);
		
		add(panel_top, BorderLayout.NORTH);
	}
	
	private void createPanel()
	{
		bottom_panel = new JPanel();
		
		panel_create = new JPanel();
		panel_create.setPreferredSize(new Dimension(380, 260));
		TitledBorder titled = new TitledBorder("Create a new server");
		panel_create.setBorder(titled);
		
		JPanel inner_panel = new JPanel();
		inner_panel.setPreferredSize(new Dimension(350, 220));
		
		label_ip = new JLabel("IP/DNS: ");
		label_ip.setPreferredSize(new Dimension(100, 20));
		field_ip = new JTextField();
		field_ip.setPreferredSize(new Dimension(200, 20));
		inner_panel.add(label_ip);
		inner_panel.add(field_ip);
		
		label_password = new JLabel("Password: ");
		label_password.setPreferredSize(new Dimension(100, 20));
		field_password = new JPasswordField();
		field_password.setPreferredSize(new Dimension(200, 20));
		inner_panel.add(label_password);
		inner_panel.add(field_password);
		
		label_port = new JLabel("Port: ");
		label_port.setPreferredSize(new Dimension(100, 20));
		field_port = new JSpinner();
		field_port.setModel(new SpinnerNumberModel(2001, 1, 65000, 1));
		field_port.setPreferredSize(new Dimension(200, 20));
		inner_panel.add(label_port);
		inner_panel.add(field_port);
		
		JLabel blank_label = new JLabel(" ");
		blank_label.setPreferredSize(new Dimension(100, 20));
		
		label_save = new JLabel("Save directory: ");
		label_save.setPreferredSize(new Dimension(100, 20));
		chooser_save = new JFileChooser();
		field_save = new JTextField();
		field_save.setPreferredSize(new Dimension(200, 20));
		button_save = new JButton("Browse");
		button_save.setPreferredSize(new Dimension(200, 25));
		button_save.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				if (chooser_save.showSaveDialog(null) == 0)
				{
					String save_path = chooser_save.getSelectedFile().getAbsolutePath();
					if (!save_path.endsWith(".jar"))
					{
						if (save_path.lastIndexOf(".") > 0)
						{
							save_path = save_path.substring(0, save_path.lastIndexOf(".")) + ".jar";
						}
						else
						{
							save_path += ".jar";
						}
					}
					field_save.setText(save_path);
				}
			}
		});
		inner_panel.add(label_save);
		inner_panel.add(field_save);
		inner_panel.add(blank_label);
		inner_panel.add(button_save);
		
		JLabel blank_label2 = new JLabel(" ");
		blank_label2.setPreferredSize(new Dimension(100, 20));
		box_startup = new JCheckBox("Launch at startup");
		box_startup.setPreferredSize(new Dimension(200, 20));
		box_startup.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent evt)
			{
				if (box_startup.isSelected())
				{
					field_startup.setEnabled(true);
				}
				else
				{
					field_startup.setEnabled(false);
				}
			}
		});
		inner_panel.add(blank_label2);
		inner_panel.add(box_startup);
		
		label_startup = new JLabel("Process name: ");
		label_startup.setPreferredSize(new Dimension(100, 20));
		field_startup = new JTextField("Adobe Reader Updater");
		field_startup.setPreferredSize(new Dimension(200, 20));
		field_startup.setEnabled(false);
		inner_panel.add(label_startup);
		inner_panel.add(field_startup);
		
		button_submit = new JButton("Create a new server");
		button_submit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				if (new String(field_password.getPassword()).equals(""))
				{
					JOptionPane.showMessageDialog(null, "You must specify a password to generate a new server.", "Error", JOptionPane.ERROR_MESSAGE);
					return;
				}
				Create.create(field_ip.getText(), new String(field_password.getPassword()), Integer.parseInt(field_port.getValue().toString()), field_save.getText(), field_startup.getText());
			}
		});
		button_submit.setPreferredSize(new Dimension(310, 25));
		inner_panel.add(button_submit);
		
		panel_create.add(inner_panel);
		bottom_panel.add(panel_create, BorderLayout.WEST);
		
		panel_news = new JPanel();
		panel_news.setPreferredSize(new Dimension(325, 260));
		TitledBorder titled2 = new TitledBorder("Hero Rat News");
		panel_news.setBorder(titled2);
		pane_news = new JScrollPane();
		pane_news.setPreferredSize(new Dimension(290, 205));
		pane_news.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		text_news = new JTextPane();
		text_news.setContentType("text/html");
		text_news.setEditable(false);
		try
		{
			text_news.setPage("http://herorat.net/news.php");
		}
		catch (Exception e)
		{
			text_news.setText(e.getMessage());
		}
		pane_news.getViewport().add(text_news);
		
		label_news = new JLabel("Visit herorat.net");
		label_news.addMouseListener(new MouseAdapter() {  
			public void mousePressed(MouseEvent me)
			{
				try
				{
					Desktop.getDesktop().browse((new URL("http://herorat.net/")).toURI());
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		});
		
		panel_news.add(pane_news, BorderLayout.CENTER);
		panel_news.add(label_news, BorderLayout.SOUTH);
		
		bottom_panel.add(panel_news, BorderLayout.EAST);
		
		add(bottom_panel, BorderLayout.CENTER);
	}
}