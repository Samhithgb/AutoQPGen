<html>
<?php 
session_start();
error_reporting(E_ALL);
	session_cache_expire( 20 );
$inactive = 1200;
if(isset($_SESSION['start']) ) {
	$session_life = time() - $_SESSION['start'];
	if($session_life > $inactive){
		echo "<script>alert('Session Timeout! Please Login Again!');</script>";
		echo "<script>self.location='../welcome.php'</script>";
	}
}
$_SESSION['start'] = time();
	
ini_set("display_errors",'1');

    require 'aes.class.php';     // AES PHP implementation
    require 'aesctr.class.php';  // AES Counter Mode implementation

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
		  $SID=$_SESSION['username'];
		$QID=uniqid();
		$co = $filesop[0];
		$question =AesCtr::encrypt($filesop[1], $pw, 256);
		
		$desc=$filesop[2];
		$lod=$filesop[3];
		$U_No = $filesop[4];
		$marks = $filesop[5];
		$CID=$_SESSION['subject'];
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
    
       <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
    
        <link rel="stylesheet" href="style.css">

    
    
    
  </head>$CID=$_SESSION['subject'];
  <h1>Upload Questions from .csv file </h1>
  <body>
	    <div class="wrapper" id="wr">

	<div class="container">	
		<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand">Automatic QP Generator &nbsp   |  </a>
    
	
    </div>
	
	  <a class="navbar-brand">Add Questions To Database &nbsp | &nbsp Add using .csv </a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="facultydash.php">Logged in As     <?php echo $_SESSION["name"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>


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
