<!DOCTYPE html>
<html >

<?php 
error_reporting(E_ALL);
ini_set("display_errors",'1');
session_start();
include("connect.php");

if($_SERVER["REQUEST_METHOD"] == "POST")
{
  
  
    $ADM_ID=$_POST['hid'];
    $PASSWD=md5($_POST['pass']);

    $query="insert into Admin(`Admin_ID`,`Password`)  
    VALUES('$ADM_ID','$PASSWD')";   
    $res=mysql_query($query);

    echo "<script>alert('Registration Successful')</script>";
    echo "<script>self.location='admindash.php'</script>";

}
?>

  <head>
    <meta charset="UTF-8">
    <title>Faculty Details</title>    
	   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
        <link rel="stylesheet" href="style.css">    
  </head>

  <body>

    <div class="wrapper">
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
	
	  <a class="navbar-brand" href='admindash.php'>Add Another Admin</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="facultydash.php">Logged in As     <?php echo $_SESSION["username"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>

		<h2>Add Admin Details</h2>
		
		<form class="form" action="" method="POST">
			<input name="hid" type="text" placeholder="Enter Admin ID" optional>
			<input name="pass" type="password" placeholder="Enter a strong password" required>
			<input name="pass2" type="password" placeholder="Re-enter your password" required>
			
			<input name="save" type="submit" id="login-button" value="Proceed">
      			<button name="save" type="submit" id="button" value="Proceed" onClick="location.href='admindash.php'">Back</button>
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
    <!--<script src="js/index.js"></script>-->

    
    
    
  </body>
</html>
