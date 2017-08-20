package net.herorat.features.file;

public class TypeRoot
{
	public static String[] getRow(String[] params)
	{
		String[] row = new String[3];
		row[0] = "";
		row[1] = params[0].replace("\\", "/");
		row[2] = (params.length == 2) ? params[1] : "No name";
		return row;
	}
}