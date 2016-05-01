<html>
<?php 
session_start();
include("connect.php");
	session_cache_expire( 20 );
$inactive = 10;
if(isset($_SESSION['start']) ) {
	$session_life = time() - $_SESSION['start'];
	if($session_life > $inactive){
		echo "<script>alert('Session Timeout! Please Login Again!');</script>";
		echo "<script>self.location='../welcome.php'</script>";
	}
}
$_SESSION['start'] = time();
	


if(isset($_POST["submit"]))
{
	$file = $_FILES['file']['tmp_name'];
	$handle = fopen($file, "r");
	$c = 0;
	$options='';
	while(($filesop = fgetcsv($handle, 1000, ",")) !== false)
	{
		$CID=$filesop[0];
		$sem = $filesop[1];
		$credits=$filesop[2];
		$ctype=$filesop[3];
		$did=$filesop[4];
		$cname = $filesop[5];
		
		$sql = mysql_query("INSERT INTO Course VALUES ('$sem','$CID','$credits','$ctype','$did','$cname')");
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
	Columns : Course ID,Semester,Credits,Course Type,Department ID,Course Name(IN THE SAME ORDER).
<form name="import" method="post" enctype="multipart/form-data">
    	<input type="file" name="file" /><br />
        <button type="submit" name="submit" value="Submit">Upload</button>
	<button type="button" onClick="location.href='course.php'">Go Back</input>
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
