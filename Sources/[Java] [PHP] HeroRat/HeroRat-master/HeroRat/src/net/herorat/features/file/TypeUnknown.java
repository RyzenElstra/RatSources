package net.herorat.features.file;

public class TypeUnknown
{
	public static String[] getRow(String[] params)
	{
		String[] row = new String[3];
		row[0] = "UNKOWN";
		row[1] = params[0];
		row[2] = getSize(params[1]);
		return row;
	}
	
	private static String getSize(String bytes)
	{
		String[] units = new String[] { "b", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb" };
		double size = Double.parseDouble(bytes);
		
		int i = 0;
		while ((size / 1024) > 1)
		{
			size = size / 1024;
			i ++;
		}
		
		return Math.round(size) + " " + units[i];
	}
}