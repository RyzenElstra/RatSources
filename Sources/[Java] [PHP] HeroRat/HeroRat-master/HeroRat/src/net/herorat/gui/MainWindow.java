package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

import net.herorat.utils.Utils;

public class MainWindow extends JFrame
{
	private static final long serialVersionUID = -547796034497603735L;
	
	private int width = 790;
	private int height = 460;
	
	private JPanel panel_logo;
	private JLabel label_logo;
	private JLabel label_compatibility;
	
	public PanelNew panel_tab1;
	public PanelServers panel_tab2;
	public PanelScreen panel_tab3;
	public PanelSystem panel_tab4;
	public PanelConsole panel_tab5;
	public PanelDos panel_tab6;
	public PanelProcess panel_tab7;
	public PanelChat panel_tab8;
	public PanelFile panel_tab9;
	public PanelStealer panel_tab10;
	public PanelKeylogger panel_tab11;
	
	public JTabbedPane pane_tabs;

	public MainWindow()
	{
		if (!this.getClass().getClassLoader().toString().equals("HeroRAT Class Loader"))
		{
			System.exit(1);
		}
		
		setTitle("Hero RAT - Remote Administration Tool");
		setIconImage(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/icon.png"))).getImage());
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		initComponents();
		this.setMinimumSize(new Dimension(width+25, height+150));
		display();
		centerWindow();
	}
	
	private void initComponents()
	{
		createLogo();
		createTab1();
		createTab2();
		createTab3();
		createTab4();
		createTab5();
		createTab6();
		createTab7();
		createTab8();
		createTab9();
		createTab10();
		createTab11();
		addTabs();
	}
	
	private void display()
	{
		pack();
		setVisible(true);
	}
	
	private void centerWindow()
	{
		int bounds_top = Toolkit.getDefaultToolkit().getScreenSize().height / 2;
		int bounds_left = Toolkit.getDefaultToolkit().getScreenSize().width / 2;
		int half_height = this.getSize().height / 2;
		int half_width = this.getSize().width / 2;
		this.setLocation(bounds_left - half_width, bounds_top - half_height);
	}
	
	private void createLogo()
	{
		panel_logo = new JPanel();
		panel_logo.setLayout(new BorderLayout(5, 0));
		panel_logo.setBackground(new Color(51, 51, 51));
		panel_logo.setBorder(BorderFactory.createEmptyBorder(0, 2, 0, 2));
		
		label_logo = new JLabel(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/logo.png"))));
		label_compatibility = new JLabel(new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/compatibility.png"))));
		
		panel_logo.add(label_logo, BorderLayout.LINE_START);
		panel_logo.add(label_compatibility, BorderLayout.LINE_END);
		getContentPane().add(panel_logo, BorderLayout.NORTH);
	}
	
	private void createTab1()
	{
		panel_tab1 = new PanelNew();
		panel_tab1.setPreferredSize(new Dimension(width, height));
	}
	
	private void createTab2()
	{
		panel_tab2 = new PanelServers();
		panel_tab2.setPreferredSize(new Dimension(width, height));
	}
	
	private void createTab3()
	{
		panel_tab3 = new PanelScreen();
		panel_tab3.setPreferredSize(new Dimension(width, height));
	}
	
	private void createTab4()
	{
		panel_tab4 = new PanelSystem();
		panel_tab4.setPreferredSize(new Dimension(width, height));
	}
	
	private void createTab5()
	{
		panel_tab5 = new PanelConsole();
		panel_tab5.setPreferredSize(new Dimension(width, height));
	}
	
	private void createTab6()
	{
		panel_tab6 = new PanelDos();
		panel_tab6.setPreferredSize(new Dimension(width, height));
	}
	
	private void createTab7()
	{
		panel_tab7 = new PanelProcess();
		panel_tab7.setPreferredSize(new Dimension(width, height));
	}
	
	private void createTab8()
	{
		panel_tab8 = new PanelChat();
		panel_tab8.setPreferredSize(new Dimension(width, height));
	}
	
	private void createTab9()
	{
		panel_tab9 = new PanelFile();
		panel_tab9.setPreferredSize(new Dimension(width, height));
	}
	
	private void createTab10()
	{
		panel_tab10 = new PanelStealer();
		panel_tab10.setPreferredSize(new Dimension(width, height));
	}
	
	private void createTab11()
	{
		panel_tab11 = new PanelKeylogger();
		panel_tab11.setPreferredSize(new Dimension(width, height));
	}
	
	private void addTabs()
	{
		pane_tabs = new JTabbedPane();
		ImageIcon icon_tab1 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/home.png")));
		pane_tabs.addTab("Status", icon_tab1, panel_tab1, "Create server or show statistics");

		ImageIcon icon_tab2 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/users.png")));
		pane_tabs.addTab("Servers", icon_tab2, panel_tab2, "Online servers list");

		ImageIcon icon_tab3 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/capture.png")));
		pane_tabs.addTab("Screen", icon_tab3, panel_tab3, "Remote control your computers");

		ImageIcon icon_tab4 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/logger.png")));
		pane_tabs.addTab("System", icon_tab4, panel_tab4, "Get more information about your remote desktops");
		
		ImageIcon icon_tab5 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/console.png")));
		pane_tabs.addTab("Console", icon_tab5, panel_tab5, "Use your bash console remotely");
		
		ImageIcon icon_tab6 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/ddos.png")));
		pane_tabs.addTab("Stress test", icon_tab6, panel_tab6, "Test your server security");
		
		ImageIcon icon_tab7 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/process.gif")));
		pane_tabs.addTab("Process", icon_tab7, panel_tab7, "Manage the running processes");
		
		ImageIcon icon_tab8 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/email.png")));
		pane_tabs.addTab("Chat", icon_tab8, panel_tab8, "Communicate with your remote computers");
		
		ImageIcon icon_tab9 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/folder.png")));
		pane_tabs.addTab("File Manager", icon_tab9, panel_tab9, "Manage your files remotely");
		
		ImageIcon icon_tab10 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/key.png")));
		pane_tabs.addTab("Passwords", icon_tab10, panel_tab10, "Manage all your passwords");
		
		ImageIcon icon_tab11 = new ImageIcon(Utils.toByteArray(this.getClass().getClassLoader().getResourceAsStream("/images/keyboard.png")));
		pane_tabs.addTab("Keylogger", icon_tab11, panel_tab11, "Remotely control what is typed on your computer");
		
		getContentPane().add(pane_tabs, BorderLayout.CENTER);
	}
}