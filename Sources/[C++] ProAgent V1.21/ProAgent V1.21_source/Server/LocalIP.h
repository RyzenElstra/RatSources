/*===================================
ProAgent coded By ATmaCA
http://www.atmacasoft.com
atmaca@prohack.net
===================================*/
AnsiString LocalIp()
{
char buff[100];
hostent *lphe;
WSADATA WSAData;
WSAStartup(MAKEWORD(2, 0), &WSAData);
gethostname(buff, 100);
lphe = gethostbyname(buff);
return AnsiString(inet_ntoa(*(in_addr*)*lphe->h_addr_list));
WSACleanup();
}