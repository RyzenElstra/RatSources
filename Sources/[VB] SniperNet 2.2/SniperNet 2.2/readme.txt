Real_Sniper von www.BrightDarkness.de präsentiert:

SniperNet ver 2.2
*****************

Overview:
---------
Dieses Programm ist ein Trojaner entwickelt unter Visual Basic
mit Hilfe der Winsock OCX.
Das Trojanerprojekt ist open source und der Quelltext steht auf
www.brightdarkness.de zum Download bereit.
Für eine Beteiligung an dem Projekt und der Weiterentwicklung
des Codes ist jeder herzlich eingeladen....mailt mir einfach
unter RealSniper@brightdarkness.de und informiert mich, dann
werde ich euch den aktuellen Stand der Entwicklung mitteilen.

Diese Binaries sind nicht dazu gedacht Schaden anzurichten und
deshalb fordere ich jeden dazu auf asoziale Attacken, die einzig
und allein den Begriff Hacken in den Schmutz ziehen, zu unter-
lassen. Ich möchte nicht eine weitere Reportage der "Akte 2000"
sehen, die über so einen Krampf berichtet *würg*....
Wie heisst es so schön:
This is for educational purpose only!

Der Trojaner ist natürlich noch nicht ausgereift: Ich hab erst
mal den Kern des Programms aufgebaut, und nun fange ich [mit
eurer Hilfe] an, weitere Funktionen zu implementieren.
Bisher eingebaute Features sind:
* voller Telnetzugang
* Dateibrowsing per Telnet
* Übertragung gecachter Passwörter
* MAC Adresse
* Benachrichtigung bei Beenden des Servers
* Message senden
* Pingen
* CD Kontrolle: öffnen und schliessen
* Username übermitteln
* Programme ausführen
* Windowsfunktionstasten [crt-alt-del, WinTaste,...] blockieren.
* Drivespace übermitteln
* Mausdoppelklick deaktivieren
* Windows beenden

Struktur und Anwendung:
-----------------------
Die im Zip enthaltene SniperNet21.exe ist der Client, mit dem der
Angreifer seine Attacken koordiniert.
Die server.exe stellt wie schon vermutet den Server auf Opfer-
rechner da. Diese .exe kann man nach belieben umbenennen....
Beim Start des Servers erhält man ohne Parameter eine Fehler-
meldung des Speichers. Das Programm startet trotzdem und ist aktiv.
Es trägt sich in der Registry im "....\CurrentVersion\RunServicesOnce"
ein und startet sich bei jedem Windowsneustart erneut.
Dort ergänzt es den Parameter "/load", der die Fehlermelung unter-
drückt, so dass das Prog insgeheim im Hintergrund bei jedem Windows-
start geladen wird.
Stealth sein ist für Trojaner dieser Art die primäre Notwendigkeit.
Um diese Fähigkeit noch zu steigern empfehle ich den Einsatz von
Joiner [Freeware: fügt 2 .exe Dateien zu einer zusammen und führt
trotzdem beide gleichzeitig aus].

Nachdem der Server beim Opfer platziert und ausgeführt wurde, muss
man nun im SniperNet die passende IP angeben und "try connect"
versuchen. Daraufhin versucht das Programm auf dem festgelegten
Port 666 eine Verbindung herzustellen. Falls dies gelingt ist man
in der Lage Befehle mit Hilfe der Schaltflächen auf dem Remote-
Computer auszuführen.

Der Telnet Server ist auf dem Port 167 erreichbar.
Die Kommandos sind meist selbsterklärend oder gut dokumentiert
per Hilfefunktion.
Mit diesem Zugang ist ein voller Zugriff auf das Dateisystem
möglich!

Bugs & Verbesserungen:
----------------------
Das Programm besitzt natürlich noch kleine Bugs, die es noch auszu-
bügeln gilt:
* Auf manchen Rechnern ist die Anzeige der Textboxen etwas nach
  unten verrutscht. Das gleiche gilt in diesem Fall auch für die
  nicht zu sehenden Label Felder, die auf den Befehlen liegen.
  Abhilfe: etwas unter der gewollten Schaltfläche klicken.
  Bugfix erfolgt demnächst. Dieser Fehler tritt nur auf, wenn man
  die Windowsstandardeinstellungen für Schriftgrösse u.ä. geändert
  hat...
* Bei wiederholtem Starten der Programme kann es zu Fehlern â la
  "1048 Port in use" kommen.
  Abhile: Ein Windowsneustart bewirkt Wunder [wie immer] :-)
* Das Icon des Programms neben der Uhr verschwindet nicht nach
  Beendigung mit der Maus automatisch.
  Abhilfe: Mit der Maus drüberfahren beseitigt den Fehler
* Die Visual Basic Runtime Bibliotheken sind erst in Windows 98
  implementiert. Unter Windows 95 muss man diese vorher per Hand
  installieren.
* Die Winsock OCX muss man in \windows\system kopieren, da das
  Programm diese zur Verbindung benötigt.
  Abhile: Meines Wissens nach sind kompilierte OCX Dateien nicht
  in die Programme implementierbar. Eine Lösung wäre jedoch die
  Benutzung der winsock.dll, was in späteren Versionen wohl
  geschehen wird.

Verbesserungen in den nächsten Versionen:
-----------------------------------------
* Einbindung eines IP-Scanners zum scannen ganzer Subnetze nach
  Servern
* Umstieg auf Winsock.dll
* Programm kopiert sich automatisch in einen Systemordner um
  einem Löschvorgang zu entgehen
* weitere Funktionen zum Fernsteuern des Remoterechners
* Benutzung von Microsofts DirectPlay aus DirectX zur Herstellung
  der Verbindung
* Benachrichtigung per AIM und ICQ
* Dateitransfer
* neues GUI
* Bugfixing

History:
--------
ver  2.2:
kompletter Telnet Zugang zum Server
Übertragung der "cached passwords"
Mac Adresse anzeigen
Surfen durch das "Opfer"dateisystem per Telnet
Bugfixing

ver  2.1:
neue Benutzeroberfläche [Sharped Forms]
Bugfixing

ver  2.0:
Umstieg auf TCP/IP
-->keine Einstellung einer festen IP auf Seiten des Remotecomputers,
   Reduzierung des Funktionsumfangs aufgrund Inkomatibilitäten zw
   TCP/IP und UDP

ver  1.1:
Erweiterung durch mehr Remotefunktionen.
Bugfixing
.ini -Datei Speicherung

ver  1.0:
Erste öffentliche Version.
UDP basierende Version mit vielen kleinen Bugs

ver  <1:
nicht öffentliche Technikversuche


Real_Sniper
www.BrightDarkness.de