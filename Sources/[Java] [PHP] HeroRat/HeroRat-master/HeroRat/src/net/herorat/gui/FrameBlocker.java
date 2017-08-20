package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;

import net.herorat.features.blocker.Blocker;
import net.herorat.features.servers.Server;


public class FrameBlocker extends JFrame
{
	private static final long serialVersionUID = -4147506758969999749L;
	
	private Server server;
	
	private JPanel panel_block;
	private JLabel label_block_tips;
	private JLabel label_block_ip;
	private JTextField field_block_ip;
	private JButton button_block;
	
	private JPanel panel_redirect;
	private JLabel label_redirect_tips;
	private JLabel label_redirect_from;
	private JTextField field_redirect_from;
	private JLabel label_redirect_to;
	private JTextField field_redirect_to;
	private JButton button_redirect;
	
	private JTabbedPane pane_tabs;
	
	public FrameBlocker(Server server)
	{
		this.server = server;
		
		initComponents();
		display();
		centerWindow();
	}
	
	private void initComponents()
	{
		setTitle("Parental control - " + server.getServerName() + " @ " + server.getIp() + " (UID: " + server.getUid().toUpperCase() + ")");
		setPreferredSize(new Dimension(350, 180));
		setMinimumSize(new Dimension(350, 180));
		setResizable(false);
		setLayout(new BorderLayout(5, 0));
		
		createPanelBlock();
		createPanelRedirect();
		createTabs();
	}
	
	private void display()
	{
		setVisible(true);
		pack();
	}
	
	private void centerWindow()
	{
		int bounds_top = Toolkit.getDefaultToolkit().getScreenSize().height / 2;
		int bounds_left = Toolkit.getDefaultToolkit().getScreenSize().width / 2;
		int half_height = this.getSize().height / 2;
		int half_width = this.getSize().width / 2;
		this.setLocation(bounds_left - half_width, bounds_top - half_height);
	}
	
	private void createPanelBlock()
	{
		panel_block = new JPanel();
		panel_block.setPreferredSize(new Dimension(300, 160));
		panel_block.setLayout(new BorderLayout(5, 0));
	
		label_block_tips = new JLabel("Enter an IP or an URL to block all access from this computer ");
		label_block_tips.setPreferredSize(new Dimension(300, 20));
		label_block_tips.setFont( label_block_tips.getFont().deriveFont(Font.BOLD|Font.ITALIC) );
		label_block_ip = new JLabel("Website / Ip: ");
		label_block_ip.setPreferredSize(new Dimension(100, 20));
		field_block_ip = new JTextField("google.com");
		field_block_ip.setPreferredSize(new Dimension(200, 20));
		button_block = new JButton("Block access");
		button_block.setPreferredSize(new Dimension(300, 25));
		
		button_block.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String url;
				if (field_block_ip.getText().startsWith("http://"))
					url = field_block_ip.getText().substring(7);
				else
					url = field_block_ip.getText();
				
				Blocker.send(server, url);
			}
		});
	
		JPanel panel_form = new JPanel();
		panel_form.setPreferredSize(new Dimension(300, 140));
		panel_form.add(label_block_ip);
		panel_form.add(field_block_ip);
		
		panel_block.add(label_block_tips, BorderLayout.NORTH);
		panel_block.add(panel_form);
		panel_block.add(button_block, BorderLayout.SOUTH);
	}
	
	private void createPanelRedirect()
	{
		panel_redirect = new JPanel();
		panel_redirect.setPreferredSize(new Dimension(300, 160));
		panel_redirect.setLayout(new BorderLayout(5, 0));
		
		label_redirect_tips = new JLabel("Fill in this form to redirect an IP or an URL to another one");
		label_redirect_tips.setPreferredSize(new Dimension(300, 20));
		label_redirect_tips.setFont( label_redirect_tips.getFont().deriveFont(Font.BOLD|Font.ITALIC) );
		label_redirect_from = new JLabel("Redirect: ");
		label_redirect_from.setPreferredSize(new Dimension(100, 20));
		field_redirect_from = new JTextField("google.co.cn");
		field_redirect_from.setPreferredSize(new Dimension(200, 20));
		label_redirect_to = new JLabel("To: ");
		label_redirect_to.setPreferredSize(new Dimension(100, 20));
		field_redirect_to = new JTextField("google.com");
		field_redirect_to.setPreferredSize(new Dimension(200, 20));
		button_redirect = new JButton("Redirect access");
		button_redirect.setPreferredSize(new Dimension(300, 25));
		
		button_redirect.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt)
			{
				String from;
				if (field_block_ip.getText().startsWith("http://"))
					from = field_redirect_from.getText().substring(7);
				else
					from = field_redirect_from.getText();
				
				String to;
				if (field_block_ip.getText().startsWith("http://"))
					to = field_redirect_to.getText().substring(7);
				else
					to = field_redirect_to.getText();
				
				Blocker.send(server, from, to);
			}
		});
		
		JPanel panel_form = new JPanel();
		panel_form.setPreferredSize(new Dimension(300, 140));
		panel_form.add(label_redirect_from);
		panel_form.add(field_redirect_from);
		panel_form.add(label_redirect_to);
		panel_form.add(field_redirect_to);
		
		panel_redirect.add(label_redirect_tips, BorderLayout.NORTH);
		panel_redirect.add(panel_form);
		panel_redirect.add(button_redirect, BorderLayout.SOUTH);
	}
	
	private void createTabs()
	{
		pane_tabs = new JTabbedPane();
		pane_tabs.addTab("Block", null, panel_block, "Disable access to websites or servers");
		pane_tabs.setMnemonicAt(0, KeyEvent.VK_1);

		pane_tabs.addTab("Redirect", null, panel_redirect, "Redirect an adress to another one");
		pane_tabs.setMnemonicAt(1, KeyEvent.VK_2);
		
		getContentPane().add(pane_tabs, BorderLayout.CENTER);
	}
}
