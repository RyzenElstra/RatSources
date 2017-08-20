package net.herorat.features.file;

public class TypeDir
{
	public static String[] getRow(String[] params)
	{
		String[] row = new String[3];
		row[0] = "DIR";
		row[1] = params[0];
		row[2] = "";
		return row;
	}
}