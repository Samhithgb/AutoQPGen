<!DOCTYPE html>
<?php
include("connect.php");
session_start();
	session_cache_expire( 20 );
$inactive = 1200;
if(isset($_SESSION['start']) ) {
	$session_life = time() - $_SESSION['start'];
	if($session_life > $inactive){
    session_destroy();
		echo "<script>alert('Session Timeout! Please Login Again!');</script>";
		echo "<script>self.location='../welcome.php'</script>";
	}
}
$_SESSION['start'] = time();

  
  $username = $_SESSION['username'];
  $sql="select Course_ID from Course"; 
  $result=mysql_query($sql); 
 
 

?>
<head>
		
	 <meta charset="UTF-8">
    <title>LOD Composition</title>
      <link rel="stylesheet" href="style.css">
</head>


<body>
 
	<div class = "wrapper">
		<div class = "container">
 Subject wise composition in the Database :<br><br>
    <img src='graph2.php'/>; 
	<button type="button" name="add" id="addquestions"  onClick="location.href='report.php'">Go Back</button>
<!--			
<center>Select Subject </center>
			<form method="post">
			<select name="subject">
			
							
			</select>
			
<!-->
