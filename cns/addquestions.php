<?php 
error_reporting(E_ALL);
ini_set("display_errors",'1');
    require 'aes.class.php';     // AES PHP implementation
    require 'aesctr.class.php';  // AES Counter Mode implementation
include("connect.php");
session_start();error_reporting(E_ALL);
ini_set("display_errors",'1');
require_once "HashCipher.php";
$hash = "sha512";
// Keys are twice as long as our underlying hash function
$key = hash($hash, "a", true) . hash($hash, "b", true);
$macKey = hash($hash, "c", true) . hash($hash, "d", true);
// More rounds == more secure
$cipher = new HashCipher($hash, 64);


 if(isset($_REQUEST['save']))
{
      
    $SID='Teacher';
    $QID=uniqid();
    $marks=$_REQUEST['marks'];
    $CO=$_REQUEST['CO'];
    $pw="password";
    $Question= AesCtr::encrypt($_REQUEST['Question'], $pw, 256);
   
    $description=$_REQUEST['description'];
    $LOD=$_REQUEST['LOD'];
    $U_NO=$_REQUEST['U_NO'];
    $CID='12IS64';
    echo "<script>alert($CID)</script>";
    $query="insert into  Questions(`Teacher_ID`,`Ques_ID`,`Marks`,`CO`,`Description`,`Remarks`,`LOD`,`Unit_No`,`Course_Id`)  
    VALUES('$SID','$QID','$marks','$CO','$Question','$description','$LOD','$U_NO','$CID')";   
    $res=mysql_query($query);

   if($res){
    echo "<script>alert('Successful')</script>";
    echo "<script>self.location='addquestions.php'</script>";
	}
 else  die('Invalid query: ' . mysql_error());
}
?>


<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Add Questions</title>
        
    
        <link rel="stylesheet" href="style.css">
    
  </head>

  <body>

<script src="https://code.jquery.com/jquery-1.11.3.js" type="text/javascript" charset="utf-8"></script>
		<script language="javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script>
		<script src="questions.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.0.0.js"></script>

	
    <div class="wrapper">
	<div class="container">
		<br><br><br>
		<h1>Add Questions to Database</h1>
<br>
		Enter the question and details to add it to question bank
		<br><br><br>
		<form method="POST">
		
			<input id="marks" name="marks" type="number" placeholder="Marks" required>
			<input id="co" name="CO" type="number" placeholder="CO(ex:1 is equivalent to CO1)" required>
			<input id="quest" name="Question" type="text" placeholder="Your Question" required>
			<input id="desc" name="description" type="text" placeholder="Brief Description" required>
			<input id="lod" name="LOD" type="number" placeholder="Level Of Difficulty" required>
			<input id="uno" name="U_NO" type="number" placeholder="Unit Number" required>
			
     		<button id="sub" type="submit" name="save" id="login-button">Proceed</button><br><br>
			<button id="sub" type="button" name="back" id="done-button" onClick="location.href='facultydash.php'">Go to Dashboard</button>
			<button id="csv" type="button" name="csv"  id="csv-redirect" onClick="location.href='addfile.php'">Upload using a .csv file</button>
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
