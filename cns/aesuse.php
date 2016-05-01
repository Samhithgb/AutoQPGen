 <?php
error_reporting(E_ALL);
ini_set("display_errors",'1');
include('aes.php');
$aes = new SH_AES_Cipher();
$key = '0011223344556677';// 128/192/256 bits
$plaintext = 'The quick brown fox jumped over the lazy cat';
$iv =''; //Random (unpredictable!) IV 128 bits.
echo "$plaintext";
$ciphertext = $aes->encrypt($plaintext,$key,"secret");
$original =$aes->decrypt($ciphertext,$key,"secret");
echo "Original is $original";
?>

