<?php

function AESEncrypt($data, $key)
{
	return mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $data, MCRYPT_MODE_ECB);
}

function AESDecrypt($data, $key)
{
	return mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $data, MCRYPT_MODE_ECB);
}

function pad($data, $blocksize)
{ 
	$pad = $blocksize - (strlen($data) % $blocksize); 
	return $data . str_repeat(chr($pad), $pad); 
}

function randomAESKey()
{
	$key = '';
	$possible = '12346789bcdfghjkmnpqrtvwxyzBCDFGHJKLMNPQRTVWXYZ';
	$maxlength = strlen($possible);

	for ($i=0; $i<16; $i++)
	{ 
		$key .= substr($possible, mt_rand(0, $maxlength-1), 1);
	}

	return $key;
}

function hex2bin($source) 
{ 
	$strlen = strlen($source); 
	for ($i=0;$i<strlen($source);$i=$i+2) 
	{ 
		$bin .= chr(hexdec(substr($source, $i,2))); 
	} 
	return $bin; 
}
?>