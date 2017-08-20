<?php
require_once('seal.php');


//Name is the username of the license you would like to
//pass to the UserOnline method.
$name = $_GET['user'];


if (userOnline($name)) {
	echo 'true';
}
else
{
	echo 'false';
}
?>