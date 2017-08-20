<?php

$SECRET_KEY_1 		= 'amD53f62qGGEY95R'; 								// 1st decryption
$SECRET_KEY_2 		= 'wXYQ1897D4wYgy2k'; 								// 2nd decryption
$SECRET_KEY_3 		= '2XKB6Tz43s3jX0sn'; 								// 3rd decryption

$URL_ENCRYPT_KEY	= '0B4wCr5N2OxG93qh';								// Key to encrypt the file url
$ENCRYPTED_FILE 	= './tmp/6b280bf9f5271c753f334e237521eb0f.bin';		 	// File to decrypt
$UNIQUE_USER_FILE 	= './tmp/client_%s.bin';								// File to download

$DATABASE_HOST 		= 'sql.host.com';								// Database host name
$DATABASE_USER 		= 'herorat';									// Database username
$DATABASE_PASS 		= '******';									// Database password
$DATABASE_NAME 		= 'herorat';									// Database name

$conn = mysql_connect($DATABASE_HOST, $DATABASE_USER, $DATABASE_PASS) or die();
mysql_select_db($DATABASE_NAME) or die();

?>