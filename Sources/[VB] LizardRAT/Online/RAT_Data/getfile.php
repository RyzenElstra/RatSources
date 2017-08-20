<?php
require_once('seal.php');

$name = $_GET['user'];

	$myfile = fopen($_GET['module'] . '.txt', "r") or die("Unable to open file!");
	while(!feof($myfile)) {
	echo fgets($myfile) . '<br>';
	}
	fclose($myfile);


?>