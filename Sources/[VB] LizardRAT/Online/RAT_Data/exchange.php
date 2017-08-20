<?php
require_once('seal.php');

if(!isset($_POST['t'])){
  exit(); //Public token is missing.
}

session_start();
if(isset($_SESSION['key'])){
  exit(); //Exchange already completed.
}

$token = $_POST['t'];
$key = privateKey($token);

if(!$key){
  exit(); //The API call has failed.
}

$_SESSION['key'] = $key;
?> 