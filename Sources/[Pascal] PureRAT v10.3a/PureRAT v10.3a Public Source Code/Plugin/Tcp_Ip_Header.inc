//TCP_IP PROTOCOL HEADER
//Used by UnitSniffer.pas and UnitPortScanner.pas

type
  PIPhdr = ^TIPhdr;
  TIPhdr = packed record
    ip_verlen: Byte;
    ip_tos: Byte;
    ip_len: Word;
    ip_id: Word;
    ip_off: Word;
    ip_ttl: Byte;
    ip_p: Byte;
    ip_sum: Word;
    ip_src: Cardinal;
    ip_dst: Cardinal;
  end;

  PTCPhdr = ^TTCPhdr;
  TTCPhdr = packed record
    tcp_src   : Word;
    tcp_dst   : Word;
    tcp_seq   : Cardinal;
    tcp_ack   : Cardinal;
    tcp_off   : Byte;
    tcp_flags : Byte;
    tcp_win   : Word;
    tcp_sum   : Word;
    tcp_urp   : Word;
  end;