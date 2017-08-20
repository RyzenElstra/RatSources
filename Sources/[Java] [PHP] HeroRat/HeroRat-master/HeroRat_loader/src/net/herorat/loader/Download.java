package net.herorat.loader;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

import net.herorat.gui.FrameSplash;
import net.herorat.utils.Crypto;


public class Download
{
	public static byte[] go(String serial, String url)
	{
		byte[] content = download(url);
		content = Crypto.decrypt(content, serial.replace("-", "").getBytes());
		
		// Get the decryption keys
		String[] keys = getEncryptionKeys(content);
		
		// Get the real content
		byte[] cleared_content = new byte[content.length - 48];
		System.arraycopy(content, 0, cleared_content, 0, content.length - 48);
		
		// For each keys, decrypt the file data
		for (String key : keys)
		{
			cleared_content = Crypto.decrypt(cleared_content, key.getBytes());
		}

		return cleared_content;
	}
	
	private static byte[] download(String jar_url)
	{
		FrameSplash.label_loading.setText("Loading (0%)");
		
		InputStream input = null;
		ByteArrayOutputStream bais = new ByteArrayOutputStream();
		
		try
		{
			URL url = new URL(jar_url);
			URLConnection connection = url.openConnection();
			
            int fileLength = connection.getContentLength();
            if (fileLength == -1)
            {
            	FrameSplash.label_loading.setText("An error occured !");
            	return null;
            }
            
            input = url.openStream();
            byte[] byteChunk = new byte[4096];
            int packet_size, percent, rate = 0;
            while ( (packet_size = input.read(byteChunk)) > 0 )
            {
            	bais.write(byteChunk, 0, packet_size);
            	rate += packet_size;
            	percent = (int)(rate * 100 / fileLength);
            	FrameSplash.label_loading.setText("Loading (" + percent + "%)");
            }
		}
		catch (Exception e)
		{
			FrameSplash.label_loading.setText("An error occured !");
			try
			{
				Thread.sleep(1000);
				System.exit(1);
			}
			catch (Exception ex) {}
		}
		finally
		{
			try
			{
				if (input != null) input.close();
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		
		FrameSplash.label_loading.setText("Loading (100%)");

		return (bais != null) ? bais.toByteArray() : null;
	}
	
	private static String[] getEncryptionKeys(byte[] data)
	{
		String content = new String(data);
		String keys = content.substring(content.length() - 48, content.length());
		return new String[] { keys.substring(0, 16), keys.substring(16, 32), keys.substring(32, 48) };
	}
}