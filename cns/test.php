
<?php
error_reporting(E_ALL);
ini_set("display_errors",'1');
require_once "HashCipher.php";
$hash = "sha512";
// Keys are twice as long as our underlying hash function
$key = hash($hash, "a", true) . hash($hash, "b", true);
$macKey = hash($hash, "c", true) . hash($hash, "d", true);
// More rounds == more secure
$cipher = new HashCipher($hash, 64);
$e = $cipher->encrypt($key, $macKey, "foobarbazbizbuzsomethingelsereally long in here, because our block size is huge, so we'd want to make this really long to compensate. Something like this should do for now.foobarbazbizbuzsomethingelsereally long in here, because our block size is huge, so we'd want to make this really long to compensate. Something like this should do for now.foobarbazbizbuzsomethingelsereally long in here, because our block size is huge, so we'd want to make this really long to compensate. Something like this should do for now.foobarbazbizbuzsomethingelsereally long in here, because our block size is huge, so we'd want to make this really long to compensate. Something like this should do for now.");
$d = $cipher->decrypt($key, $macKey, $e);
echo "$e";
echo "<br><br>";
echo "$d";
?>