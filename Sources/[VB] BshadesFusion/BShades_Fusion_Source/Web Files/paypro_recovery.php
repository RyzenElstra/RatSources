<?php

require_once('config.php');

$link = mysql_connect(DB_SERVER, DB_USER, DB_PASSWORD);
	if(!$link) {
		die('Failed to connect to server: ' . mysql_error());
	}
	
	$db = mysql_select_db(DB_DATABASE);
	if(!$db) {
		die("Unable to select database");
	}

/*
				
if ($extralogs == "1,000 Extra Logs")
	$logs = $logs + 1000;
else if ($extralogs == "10,000 Extra Logs")
	$logs = $logs + 10000;
else if ($extralogs == "Unlimited Logs")
	$logs = 1000000;
*/

$email = $_REQUEST['CUSTOMER_EMAIL'];
$user = $_REQUEST['CUSTOM_FIELD1'];
$pass = $_REQUEST['CUSTOM_FIELD2'];
$type = $_REQUEST['ADDONS'];
$price = $_REQUEST['PRODUCT_PRICE_IN_USD'];
$pass = sha1($pass);		

if ($type == "57688") {
	$typeID = 2;
	$logs = 2000;
} else if ($type == "57691") {
	$typeID = 3;
	$logs = 5000;
}  else if ($type == "57694") {
	$typeID = 4;
	$logs = 10000;
} else {
	$typeID = 1; 
	$logs = 1000;
}
			
				$sql = "INSERT INTO `tbl_users` (`username`, `password`, `package`, `pws_max`) VALUES (" . "'". $user ."'" . ", '" . $pass . "', '".$typeID . "', '" . $logs . "');";
				mysql_query($sql);

				$sql = "SELECT `id` FROM `tbl_users` WHERE `username` = ". "'" . $user . "';";
				$answer = mysql_query($sql);

				while($row = mysql_fetch_array($answer, MYSQL_ASSOC)) {
					$userID += $row['id'];
				}

				exec("cgg.exe $userID $typeID $user"  . ".exe");




?>