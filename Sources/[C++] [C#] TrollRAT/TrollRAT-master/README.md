# TrollRAT
TrollRAT is a Remote Administration Tool (RAT) which follows a different approach than the other RATs. TrollRAT is not made for data stealing, full control or other bad things. It is just made for trolling. There are several rules I follow during the development:

* It has no native client, everything is controlled in a web browser.
* All features should be useful for trolling and not for abusing machines or stealing data.
* Simple API for adding new payloads and integrating them into the Web GUI.
* The base is written in C#, it also contains a native DLL written in C++ for the payloads that use lots of WinAPIs, need function pointers etc.
 
I started development, because some people asked me to modify the clean version of MEMZ to be hidden in order to troll tech support scammers. So I thought about a remote controllable version of it. I then thought I should make a whole new project just for trolling which makes it easier to add new payloads without changing MEMZ base concept.

If you want to know what is planned and what already works, look at the [Roadmap](https://github.com/Leurak/TrollRAT/blob/master/Roadmap.md).
