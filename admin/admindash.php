<html>
<?php	
	include("connect.php");
	session_cache_expire( 20 );
$inactive = 10;
session_start();	
if(isset($_SESSION['start']) ) {
	$session_life = time() - $_SESSION['start'];
	if($session_life > $inactive){
		session_destroy();
		echo "<script>alert('Session Timeout! Please Login Again!');</script>";
		echo "<script>self.location='../welcome.php'</script>";
	}
}

$_SESSION['start'] = time();

if(isset($_SESSION['username'])){
  
  $name = $_SESSION['username'];

  
}
	
	
	if(isset($_REQUEST['logout'])){
		$time=date("h:i:sa");
		$sql="insert into Login_History('Logout_Time') values('$time');";
		$res=mysql_query($sql);
			
		if($res){
			echo "<script>alert('Sucessfully logged out');</script>";
			session_destroy();
		echo "<script>self.location='../welcome.php'</script>";
		
		}
		else "Unsuccessful";
		
		if(isset($_REQUEST['logout'])){
	
		session_destroy();
		echo "<script>self.location='../welcome.php'</script>";
		
		
}
}
  
if(isset($_REQUEST['co'])){
	 				 
		echo "<script>self.location='addco.php'</script>";
		}
 
 if(isset($_REQUEST['addadmin'])){
	 				 
		echo "<script>self.location='addadmin.php'</script>";
		}
 
 if(isset($_REQUEST['syllabus'])){
	 				 
		echo "<script>self.location='updatesyllabus.php'</script>";
		}


?>

<head>
    <meta charset="UTF-8">
    <title>Admin DashBoard</title>
       <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style.css">
   
    
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
	
	  <a class="navbar-brand">Welcome Administrator!</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#lo">Logged in As     <?php echo $_SESSION["username"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>
<img src="logo.png">

			<h4>Select an operation :</h4><br><br>
			<form method="post">
			<button type="button" id="addfaculty" onClick="location.href='addteacher.php'">Add Faculty</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" id="addeval" onClick="location.href='../addeval.php'">Add Evaluation</button>	
			<br><br><br><br>
			<button type="button" id="Add Courses" onClick="location.href='course.php'">Add Courses</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" id="report" onClick="location.href='report.php'">Get Report</button>	<br><br><br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="AssignTeacher" onClick="location.href='assignteacher.php'">Assign Teachers to Subject</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" id="SelQP" onClick="location.href='selqp.php'">Select Question Papers</button>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br><br><br>
		<button type="syllabus" name="syllabus" id="syll">Update Syllabus</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="addadmin" name="addadmin" id="addadmin">Add Admin</button><br><br>
	
<br>
			<button type="submit" name="co" id="co">Add Course Outcome</button>	
		
	<br><br>
			<button type="submit" name="logout" id="prevqp">Log Out</button>	
		
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
			
