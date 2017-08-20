Name Agony ring0 rootkit
Author Intox
Complier C++ 


A. Before starting

We all know that some security applications aren't compatible, there may be conflicts between them. For instance, the installation of two recent different firewalls
isn't recommended.
Why? Because those tools hook native APIs at kernel mode level (on the
SSDT) and then, when two tools want to hook the same API, there is a conflit. By starting & stopping them, we can easily provoke a blue screen.

As previously said, This tool can conflict with some security tools, like process guard.
So i advise you to read the readme before you use it, and at least to look how to uninstall it.


I. THE TOOL

1.1 What use is it ?

Agony is a rootkit for Windows 2000 and superiors, able to falsify data returned by the Windows APIs. It can make files and applications invisible on a windows system.

1.2 why "Agony" ?

why not ?

1.3 Ring what ?

Under Windows, the applications run under 2 modes: ring3 and ring0, also called respectively user mode and kernel mode. The kernel mode is lower a mode than the user one, wich is the one you usually run under. That means that all the calls made from user mode will interact with kernel level to be executed.
The utility of a kernel mode rootkit is that security tools, working with the user mode, will not notice anything.


1.4 how is it made ?

it is fully coded in C. The rootkit is made of 2 parts: the driver, which runs in kernel mode, and the .exe, which runs in user-mode, it installs the driver and launches commands.
Compile the driver with the DDK, and the .exe with any compiler (including some kernel libraries). I made it with Dev-c++.


1.5 Cool ! This can be usefull


This tool was created in order to familiarize myself with ring0. It's for educationnal purpose, and that's why it's open source.
You will be the only one responsible for the use you make of it. In other words, use it at your own risks, I would also decline any responsibility of materials or software damage.


II. THE OPTIONS

Launch the program without arguments to view a small description of Agony features.
Take care, before using them, that this tool is case sensitive.
for instance: agony -p opera.exe will NOT hide Opera.exe process.
Also note that you have to use quotes to hide object with spaces in their names.


2.1 hide a process

cmdline: agony -p process_name.exe

All processes named "process_name.exe" will be hidden.
Note that agony doesn't prevent access to this process, it just hides it from listing APIs.
example : you can kill this process with his PID, even hidden.


2.2 hide a dir/file

cmdline: Agony -f dir_or_file_name

The hidden file/dir will be not shown in file listings too (eg : explorer).
The content of a hidden dir will not appear on windows research, even if they're not hidden. You can access a hidden dir if you know the path:
For example, you can access C:\hidden_dir after a "agony -f hidden_dir", just by typing "C:\hidden_dir" in the explorer address bar.
All files/dir with the same name will be hidden, so don't try to hide a file named "system32"


2.3 hide a reg key/value

Agony can falsify the reg base.

cmdline: agony -k reg_key: hide a reg key
agony -v reg_value: hide a reg value (wow, seriously ?)

Once again, only listing are falsified, the key/values are accessible.
For exemple: if you create a key "hide this shit" with value "C:\start.exe" into Windows\CurrentVersion\Run registry key, you can hide it by launching agony -v "hide this shit". Furthermore, C:\start.exe will be launched at startup


2.4 Hide a TCP/UDP connexion

w00t, you can hide connexions <8-)
cmdline: agony -tcp num_port.
agony -udp num_port.
You can use tools like fport to see wich ports are opened by an application you want to hide, and use agony to hide it.


2.5 Hide a sercice

cmdline: agony -s service_name.

Be aware of the fact that service_name is the recording name of the service, not the display name showed by the SC manager.
Here, it works a little bit differently: we have to fetch the list of services in the service.exe process memory to find the service to hide, and hide it.
Hidden services will not be accessible anymore.


2.6 Falsify the remaining disk space

-space option allow you to falsify the remaining space disk on a volume.
If you got 300Mb free on C:\, D:\ and E:\ volume, and you launch:
cmdline: agony -space C:500 D:1000 E:3000
Windows will tell you that you have 800Mb free on C:\, 1300 on D:\ and 3300 on E:\
w00t, isn't it ? You can now hide your 30 GB of pr0n.
If you launch "agony -space C:500" and then "agony -space C:800", there will be only 800 Mb added to the real remaining space disk.


2.7 Survive to reboot

The -r option allows agony to survive a reboot.
All the cmdline containing the -r option will be launched at the start of the computer.
"agony -p backdoor.exe -f backdoor.exe -space C:500 -s backdoor -tcp 88 -udp 5900 -v launchBackdoor -r" will, on startup:
- hide backdoor.exe process
- hide backdoor.exe file
- add 500Mb on C:\ volume remaining disk space
- hide the "backdoor" service
- hide connexions on the 88 tcp port and 5900 udp port
- hide launchBackdoor reg value


2.8 stop Agony:

to stop Agony: agony -stop
This command will stop all agony activity, uninstall service, clean registry and some agony files.

You can also stop agony with this cmdline:
sc delete agony (if you didn't hide the agony service).
then you must delete, in "HKLM\\Software\\Microsoft\\Active Setup\\Installed Components", the following sub keys (if they exist):
{232f4e3f2-bab8-11d0-97b9-00c04f98bcb9}
{256dc5e0e-7c46-11d3-b5bf-0000f8695621}

You can also delete the .sys file and reboot.
But the cleanest way is to use -stop option.


III Next versions

I don't think i will continue this rootkit (maybe for private releases).
If you find a bug in my code, you can send me a mail to Intox7@gmail.com,
i'll fix it as soon as i can.
Those who want to continue the tool can start with my code.
A little TODO:
- find a better startup (start in SERVICE_BOOT_START or SERVICE_SYSTEM_START)
- hide VOLUME.INI files better (in System Volume Information, for example)
- options to hide objects from a specified path
- create a hidden directory, which size will be recalculated every X sec, to falsify space disk better
- etc...


IV Greetz & Shoutz

Greetz:

Lots of people to tank, first:
- holy_father : for his great hookX tuts and his good article (in phrack)
- i.m.weasel : for his method to hide services
- jiurl : for his article about connexion hiding
- greg Hoglund : for his nice tips about MDL flags

my beta-testers:
karate, jhd, pikk_poket, Lord.

And :
Ivanlef0u, akcom, Bigbang, Mattwood, Tolwin, ... (and a lot that i forget)

Community:
- rootkit.com : really great community (80% de ma doc)
- osronline : Inescapable for driver coders
- spiritofhack.net & undergroundkonnekt.net

Thx to lucifer and Lord for the translate.

Shoutz to: kinkey_wizard, BeRgA, P41f0x, Nelio, Del_argm0, Icingtaupe, TiTan, chti_hack, Malicia, ...