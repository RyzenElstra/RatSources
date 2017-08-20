<?php
//Version: 1.1.0.0, Changed: 05/20/2014

//PLACE YOUR API TOKEN HERE. IT CAN BE FOUND IN
//THE REMOTE TAB OF THE PANEL.
$UNIQUE_KEY = '97fdc262d4308cb8bb47';

//DO NOT MODIFY THESE ENDPOINTS UNLESS INSTRUCTED TO.
$API_ENDPOINT = 'http://seal.nimoru.com/Base';
$API_FALLBACK = 'https://s3.amazonaws.com/nimoru';

$RESPONSE = '';
$SEAL_ENDPOINT = '';
$LAST_ERROR = -1;

class Status {
    static $SUCCESS = "\x0";
    static $FAILED = "\x1";
    static $BAD_PARAMS = "\x4";
    static $BAD_LENGTH = "\x5";
    static $BAD_FORMAT = "\x6";
    static $NULL_VALUE = "\x7";
    static $USED_VALUE = "\x8";
    static $ACCESS_DENIED = "\x9";
    static $LIMIT_REACHED = "\xA";
    static $SYSTEM_OFFLINE = "\xFF";
}

class LicenseType {
    static $FREE = 0;
    static $BRONZE = 1;
    static $SILVER = 2;
    static $GOLD = 3;
    static $PLATINUM = 4;
    static $DIAMOND = 5;
}

function encrypt($data, $key) {
    $len = strlen($data);
    $out = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $data, MCRYPT_MODE_CBC, $key);

    return pack('i', $len) . $out;
}

function decrypt($base64, $key) {
    $data = base64_decode($base64);

    $array = unpack('i', $data);
    $len = $array[1];
    $out = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, substr($data, 4), MCRYPT_MODE_CBC, $key);

    return substr($out, 0, $len);
}

function getStatus() {
    global $LAST_ERROR;
    switch ($LAST_ERROR) {
        case Status::$SUCCESS:
            return 'SUCCESS';
            break;
        case Status::$FAILED:
            return 'FAILED';
            break;
        case Status::$BAD_PARAMS:
            return 'BAD PARAMS';
            break;
        case Status::$BAD_LENGTH:
            return 'BAD LENGTH';
            break;
        case Status::$NULL_VALUE:
            return 'NULL VALUE';
            break;
        case Status::$USED_VALUE:
            return 'USED VALUE';
            break;
        case Status::$ACCESS_DENIED:
            return 'ACCESS DENIED';
            break;
        case Status::$LIMIT_REACHED:
            return 'LIMIT REACHED';
            break;
        case Status::$SYSTEM_OFFLINE:
            return 'SYSTEM OFFLINE';
            break;
        default:
            return 'UNKNOWN ERROR';
            break;
    }
}

function callFunction($name, $data) {
    global $RESPONSE, $LAST_ERROR;

    if(!getSealEndpoint()){
        return false;
    }

    if(!doCallFunction($name, $data)){
        return false;
    }

    if (strlen($RESPONSE) == 0) {
        $LAST_ERROR = Status::$FAILED;
        return false;
    }

    $LAST_ERROR = $RESPONSE[0];
    return ($LAST_ERROR == Status::$SUCCESS);
}

function doCallFunction($name, $data) {
    global $UNIQUE_KEY, $SEAL_ENDPOINT, $RESPONSE;

    $data['key'] = $UNIQUE_KEY;

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $SEAL_ENDPOINT . "Remote/$name.php");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_MAXREDIRS, 4);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 8000);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

    $RESPONSE = curl_exec($ch);
    curl_close($ch);

    return ($RESPONSE != false);
}

function getSealEndpoint(){
    global $API_ENDPOINT, $API_FALLBACK, $SEAL_ENDPOINT;

    $endPoint = readEndPointCache();

    if($endPoint){
        $SEAL_ENDPOINT = $endPoint;
        return true;
    }

    if(!doGetSealEndpoint("$API_ENDPOINT/checksumSE.php", "\x0")){
        if(!doGetSealEndpoint("$API_FALLBACK/checksumSE.txt", '|')){
            return false;
        }
    }

    return true;
}

function doGetSealEndpoint($endPoint, $char) {
    global $SEAL_ENDPOINT;

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $endPoint);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_MAXREDIRS, 4);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 8000);

    $response = curl_exec($ch);
    curl_close($ch);

    if (!$response) {
        return false;
    }

    $arr = explode($char, $response);

    if(count($arr) < 6){
        return false;
    }

    $SEAL_ENDPOINT = $arr[5];
    writeEndPointCache($SEAL_ENDPOINT);

    return true;
}

function writeEndPointCache($endPoint){
    file_put_contents('.seal_cache', $endPoint);
}

function readEndPointCache(){
    $fileTime = filemtime('.seal_cache');

    if(!$fileTime || (time() - $fileTime > 900)){
        return false;
    }

    return file_get_contents('.seal_cache');
}

function createCode($time, $points, $type, $track) {
    global $RESPONSE;

    $data = array(
        'time' => $time,
        'points' => $points,
        'type' => $type,
        'track' => $track
    );

    if (callFunction('createCode3', $data)) {
        return substr($RESPONSE, 1);
    }

    return false;
}

function deleteCode($code) {
    $data = array(
        'code' => $code
    );

    return callFunction('deleteCode', $data);
}

function userOnline($name, $checkAddress = true) {
    global $RESPONSE;

    $data = array(
        'name' => $name
    );

    if (callFunction('userOnline2', $data)) {
        $arr = explode("\x0", substr($RESPONSE, 1));

        if ($checkAddress && $arr[1] != $_SERVER['REMOTE_ADDR']) {
            return false;
        }

        return (bool) $arr[0];
    }

    return false;
}

function privateKey($publicToken) {
    global $RESPONSE;

    $data = array(
        'pub' => $publicToken
    );

    if (callFunction('privateKey', $data)) {
        return substr($RESPONSE, 1);
    }

    return false;
}

?>