package net.herorat.utils;

import java.security.MessageDigest;

import javax.crypto.*;
import javax.crypto.spec.*;

public class Crypto
{	
	private static String KEY = "0B4wCr5N2OxG93qh";
	public static byte[] crypt(byte[] input)
	{
		try
		{
			SecretKeySpec skey = new SecretKeySpec(KEY.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, skey);
			return cipher.doFinal(input);
		}
		catch (Exception e) {e.printStackTrace();}
		return input;
	}

	public static byte[] crypt(String input)
	{
		return crypt(input.getBytes());
	}

	public static byte[] crypt(byte[] input, byte[] key)
	{
		try
		{
			SecretKeySpec skey = new SecretKeySpec(key, "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, skey);
			return cipher.doFinal(input);
		}
		catch (Exception e) {e.printStackTrace();}
		return input;
	}
	
	public static byte[] crypt(String input, String key)
	{
		return crypt(input.getBytes(), key.getBytes());
	}

	public static byte[] decrypt(byte[] input)
	{
		try
		{
			SecretKeySpec skey = new SecretKeySpec(KEY.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, skey);
			return cipher.doFinal(input);
		}
		catch (Exception e) {}
		return input;
	}

	public static byte[] decrypt(String input)
	{
		return decrypt(input.getBytes());
	}
	
	public static byte[] decrypt(byte[] input, byte[] key)
	{
		try
		{
			SecretKeySpec skey = new SecretKeySpec(key, "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, skey);
			return cipher.doFinal(input);
		}
		catch (Exception e) {}
		return input;
	}

	public static byte[] decrypt(String input, String key)
	{
		return decrypt(input.getBytes(), key.getBytes());
	}

	public static String byteToHex(byte input[])
	{
		StringBuffer stringBuff = new StringBuffer(input.length * 2);
		for (byte element : input)
		{
			if ((element & 0xff) < 0x10)
			{
				stringBuff.append("0");
			}
			stringBuff.append(Long.toString(element & 0xff, 16));
		}
		return stringBuff.toString().toUpperCase();
	}

	public static byte[] hexToByte(String input)
	{
		byte[] bytes = new byte[input.length() / 2];
		for (int i = 0; i < bytes.length; i++)
		{
			bytes[i] = (byte) Integer.parseInt(input.substring(2 * i, 2 * i + 2), 16);
		}
		return bytes;
	}
	
	public static String md5(String value)
	{
		try
		{
			byte[] hash = MessageDigest.getInstance("MD5").digest(value.getBytes());
			return byteToHex(hash);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return "";
	}
}