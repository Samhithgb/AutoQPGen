<!DOCTYPE html>
<html >

<?php 

//session_start();

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

if($_SERVER["REQUEST_METHOD"] == "POST")
{
    echo "hi";
    $S_ID=$_POST['sid'];
    $FN=$_POST['fn'];
    $MN=$_POST['mn'];
    $LN=$_POST['ln'];
    $DESG=$_POST['desg'];
    $DEPTID=$_POST['did'];
    $HOD_ID=$_POST['hid'];
    $PASSWD=md5($_POST['pass']);

    $query="insert into Teacher(`Teacher_ID`,`FName`,`MName`,`LName`,`Designation`,`Dep_ID`,`HOD_ID`,`Password`)  
    VALUES('$S_ID','$FN','$MN','$LN','$DESG','$DEPTID','$HOD_ID','$PASSWD')";    //not single quote  its the symbol above quotes    here login is table name and the fields inside the ()is field corresponding to table fields name;
    $res=mysql_query($query);

    echo "<script>alert('Registration Successful')</script>";
    echo "<script>self.location='admindash.php'</script>";

}
?>

  <head>
    <meta charset="UTF-8">
    <title>Faculty Details</title>    
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
	
	  <a class="navbar-brand" href='admindash.php'>Add new Faculty</a>
	
<script src="https://code.jquery.com/jquery-1.11.3.js" type="text/javascript" charset="utf-8"></script>
		<script language="javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script>
		<script src="teacher.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.0.0.js"></script>


    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="admindash.php">Logged in As     <?php echo $_SESSION["username"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>
		
		<h4>Add Faculty Details</h4>
		
		<form class="form" action="" method="POST">
			<input name="sid" id="sid" type="text" placeholder="Staff ID" required>
			<input name="fn"  id="fn" type="text" placeholder="First Name" required>
			<input name="mn" id="mn" type="text" placeholder="Middle Name" required>
			<input name="ln" id="ln" type="text" placeholder="Last Name" required>
			<input name="desg" id="desg" type="text" placeholder="Designation" required>
			<input name="did" id="did" type="text" placeholder="Department ID" required>
			<input name="hid" id="sid" type="text" placeholder="HOD ID(if applicable)" optional>
			<input name="pass" id="p1" type="password" placeholder="Enter a strong password" required>
			<input name="pass2" id="p2" type="password" placeholder="Re-enter your password" required>
			
			<input name="save" type="submit" id="sub" value="Proceed">
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
