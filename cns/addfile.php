<html>
<?php 
error_reporting(E_ALL);
ini_set("display_errors",'1');
require_once "HashCipher.php";
    require 'aes.class.php';     // AES PHP implementation
    require 'aesctr.class.php';  // AES Counter Mode implementation

$hash = "sha512";
// Keys are twice as long as our underlying hash function
$key = hash($hash, "a", true) . hash($hash, "b", true);
$macKey = hash($hash, "c", true) . hash($hash, "d", true);
// More rounds == more secure
$cipher = new HashCipher($hash, 64);
include("connect.php");
if(isset($_POST["submit"]))
{
	$file = $_FILES['file']['tmp_name'];
	$handle = fopen($file, "r");
	$c = 0;
	$options='';
	$pw="password";
	while(($filesop = fgetcsv($handle, 1000, ",")) !== false)
	{
		$SID='Teacher';
		$QID=uniqid();
		$co = $filesop[0];
		$question =AesCtr::encrypt($filesop[1], $pw, 256);
		
		$desc=$filesop[2];
		$lod=$filesop[3];
		$U_No = $filesop[4];
		$marks = $filesop[5];
		$CID='12IS64';
		$sql = mysql_query("INSERT INTO Questions VALUES ('$SID','$QID','$marks','$co','$question','$desc','$lod','$U_No','$CID')");
	}
	
		if($sql){
			echo "<script>alert('Your database has imported successfully');</script>";
		}else{
			echo "<script>alert('Sorry! There is some problem.Check your file');</script>";
		}
}

	
	
	
?>	
	
<head>
    <meta charset="UTF-8">
    <title>Upload .csv</title>
    
     
    
        <link rel="stylesheet" href="style.css">

    
    
    
  </head>
  <h1>Upload Questions from .csv file </h1>
  <body>
	    <div class="wrapper" id="wr">

	<div class="container">	
		
	Please make sure the file is a .csv file encoded in UTF-8 and English(US)
	Columns : CO(in digits),Question,Remarks,Level of Difficulty,Unit_No (IN THE SAME ORDER).
<form name="import" method="post" enctype="multipart/form-data">
    	<input type="file" name="file" /><br />
        <button type="submit" name="submit" value="Submit">Upload</button>
		<button type="button" onClick="location.href='addquestions.php'">Go Back</input>
</form>
</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
 

    
    
    
  </body>
</html>
