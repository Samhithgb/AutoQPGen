<html>
<?php
	session_cache_expire( 20 );
$inactive = 1200;
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
	
	  <a class="navbar-brand" href='admindash.php'>Generate Reports</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="admindash.php">Logged in As     <?php echo $_SESSION["username"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>
			<h3>Select the Required Report</h3><br><br><br><br><br>
			<form method="post">
			<button type="button" name="lod" id="lod" onClick="location.href='lodrep.php'">LOD Composition</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" id="CO" name="co" onClick="location.href='corep.php'">Subject Composition</button>	
			<br><br><br><br>
				<button type="button" id="log" name="log" onClick="location.href='histrep.php'">Login/Update History</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" name="teach" id="teach" onClick="location.href='teachsub.php'">Subject-Teachers</button>
			<br><br><center><button type="button" name="back" id="teach" onClick="location.href='admindash.php'">Back</button>
	
		
		
		</form>

		</div>
				
	

			
