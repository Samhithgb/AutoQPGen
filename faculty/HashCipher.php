<?php
error_reporting(E_ALL);
ini_set("display_errors",'1');
class HashCipher {
    protected $hash = 'sha512';
    protected $hashLen = 64;
    protected $rounds = 16;

    public function __construct($hash, $rounds = 16) {
        $this->hash = $hash;
        // run a test hash, to get the proper hash length
        // Our block size will be double the output of the underlying hash function
        $this->hashLen = strlen(hash($hash, '', true)) * 2;
        $this->rounds = $rounds;
    }

    public function decrypt($key, $macKey, $cipherText) {
        $cipherText = base64_decode($cipherText);
        $iv = substr($cipherText, 0, $this->hashLen);
        $mac = substr($cipherText, -1 * ($this->hashLen / 2));
        $cipherText = substr($cipherText, $this->hashLen, -1 * ($this->hashLen / 2));

        // verify MAC
        $ourMac = hash_hmac($this->hash, $iv . $cipherText, $macKey, true);
        if (!$this->compare($mac, $ourMac)) {
            return false; // mac verification failure
        }

        // decrypt:
        $i = 0;
        $n = strlen($cipherText);
        $plainText = "";
        while ($i < $n) {
            $block = substr($cipherText, $i, $this->hashLen);
            $plainText .= ($this->decryptBlock($block, $key) ^ $iv);
            $iv = $block;
            $i += $this->hashLen;
        }
        // Strip padding
        $len = ord(substr($plainText, -1, 1));
        $padding = str_repeat(chr($len), $len);
        if (substr($plainText, -1 * $len) !== $padding) {
            return false; // invalid decrypt, as has invalid padding
        }
        return substr($plainText, 0, -1 * $len);
    }

    public function encrypt($key, $macKey, $plainText) {
        // pad the text using PKCS7:
        $padSize = $this->hashLen - (strlen($plainText) % $this->hashLen);
        $plainText .= str_repeat(chr($padSize), $padSize);

        // generate IV:
        $iv = mcrypt_create_iv($this->hashLen, MCRYPT_DEV_URANDOM);
        $cipherText = $iv;

        $i = 0;
        $n = strlen($plainText);
        while ($i < $n) {
            // XOR the plaintext block with the IV
            $block = (substr($plainText, $i, $this->hashLen) ^ $iv);
            $cipherBlock = $this->encryptBlock($block, $key);
            $cipherText .= $cipherBlock;
            $iv = $cipherBlock;
            $i += $this->hashLen;
        }
        $cipherText .= hash_hmac($this->hash, $cipherText, $macKey, true);
        return base64_encode($cipherText);
    }

    protected function decryptBlock($block, $key) {
        $keys = array_reverse($this->deriveKeys($key));
        return $this->feistelNetwork($keys, $block);
    }

    protected function encryptBlock($block, $key) {
        $keys = $this->deriveKeys($key);
        return $this->feistelNetwork($keys, $block);
    }

    protected function feistelNetwork(array $keys, $block) {
        $left = substr($block, 0, $this->hashLen / 2);
        $right = substr($block, strlen($left));
        for ($i = 0; $i < $this->rounds; $i++) {
            $temp = $right;
            $right = ($left ^ hash_hmac($this->hash, $right, $keys[$i], true));
            $left = $temp;
        }
        return $right . $left;
    }

    protected function deriveKeys($key) {
        $keys = [];
        for ($i = 0; $i < $this->rounds; $i++) {
            $keys[] = hash_hmac($this->hash, $key, chr($i), true);
        }
        return $keys;
    }

    protected function compare($a, $b) {
        if (strlen($a) !== strlen($b)) {
            return false;
        }
        $r = 0;
        for ($i = 0, $n = strlen($a); $i < $n; $i++) {
            $r |= (ord($a[$i]) ^ ord($b[$i]));
        }
        return $r === 0;
    }
}
?>