<!DOCTYPE html>
<?php 
session_start();
include("connect.php");
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
	
if(isset($_REQUEST['update'])){
	
$newsyll=$_REQUEST['newsyllabus'];
$unit=$_REQUEST['unit'];
//$teacher=$_SESSION['username'];
$cid=$_REQUEST['cid'];


$query="update Topics SET Description='$newsyll' where (Course_Id = '$cid' and Unit_Number='$unit')";

$res=mysql_query($query);

if($res){
    echo "<script>alert('Successfully updated the syllabus')</script>";
    echo "<script>self.location='updatesyllabus.php'</script>";
	}
 else  die('Invalid query: ' . mysql_error());
		
       }


?>
<head>
    <meta charset="UTF-8">
    <title>Update syllabus</title>       
	 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css">    
</head>

<br><br>
</head>

<body>
	<div class = "wrapper">
		<div class = "container">
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
	
	  <a class="navbar-brand" href='admindash.php'>Update Syllabus</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#lo">Logged in As     <?php echo $_SESSION["username"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>
<h2>Hello Admin </h2>
Just provide the required details. We will update the syllabus for you!
<form>
<br><br>
<input type="text" name="cid" placeholder="Enter the Course ID" required>
<br>
<input type="text" name="unit" placeholder="Enter the Unit Number" required>
<br>
<input type="text" name="newsyllabus" placeholder="Enter the syllabus here!" required>
<br>

<button type="submit" name="update">Go!</button>
<button id="csv" type="button" name="csv"  id="csv-redirect" onClick="location.href='syllcsv.php'">Upload using a .csv file</button>
</form>


	</div>
	
	<ul class='bg-bubbles'>
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
</html>
