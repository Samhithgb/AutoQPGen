<html>
<?php 
error_reporting(E_ALL);
ini_set("display_errors",'1');

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
 if(isset($_REQUEST['save']))
{
    $sem=$_REQUEST['sem'];
    $cid=$_REQUEST['ID'];
    $nocre=$_REQUEST['noc'];
    $type=$_REQUEST['type'];
    $name=$_REQUEST['name'];
    
    $dept=$_REQUEST['deptID'];
    $query="insert into Course(`Semester`,`Course_ID`,`Credits`,`Course_Tyoe`,`Dept_ID`,`Course_Name`)  
    VALUES('$sem','$cid','$nocre','$type','$dept','$name')";   
    echo "<script>console.log('Registration...')</script>";
    $res=mysql_query($query);
    if($res){
    echo "<script>alert('Registration Successful')</script>";
    echo "<script>self.location='admindash.php'</script>";
    }
    else{
    echo "<script>alert('Error!')</script>";
     echo mysql_error();
    }









}

?>
<head>
    <meta charset="UTF-8">
    <title>Add Courses</title>
           <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css">
   
     
    
      
    
    
    
  </head>

  <body>
	<script src="https://code.jquery.com/jquery-1.11.3.js" type="text/javascript" charset="utf-8"></script>
		<script language="javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script>
		<script src="course.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.0.0.js"></script>
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
	
	  <a class="navbar-brand" href='admindash.php'>Add Courses to Database</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="admindash.php">Logged in As     <?php echo $_SESSION["username"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>
		<br>
	
<br>
	<h3> Enter the Course and details to add it to question bank<h3>
		<br>
		<form class="form" id="form1" method="post" action="course.php">
			<input name= "sem" id="semester" type="number" placeholder="Semester" required></textarea>
			<input id="cid" name="ID" type="text" placeholder="ID (Ex:12IS64 or 12IS6B3)" required>
			
			<input id="noc" name="noc" type="number" placeholder="Number of Credits" required>
		        <input id="type" name="type" type="text" placeholder="Elective/Mandatory?" required>
		        <input id="type" name="name" type="text" placeholder="Course Name" required>
				
		          <input id="dept"name="deptID"type="text" placeholder="Department ID" required>
			<button type="submit" id="sub" name= "save" id="login-button">Proceed</button><br><br>
			<button id="csv" type="button" name="csv"  id="csv-redirect" onClick="location.href='courseupdate.php'">Upload using a .csv file</button>
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
