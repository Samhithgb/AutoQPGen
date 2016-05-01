<?php 
error_reporting(E_ALL);
ini_set("display_errors",'1');
   
include("connect.php");
session_start();
session_cache_expire( 20 );
$inactive = 1200;

  $sql="select Course_ID from Course";
$course=mysql_query($sql); 
$options='';
while ($row=mysql_fetch_array($course)) { 
    $f=$row["Course_ID"]; 
    $options.="<OPTION VALUE=\"$f\">".$f."</OPTION>"; 
    }


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
      if(!isset($_REQUEST['subject'])){
	
	echo "<script>alert('Enter subject first!!');</script>";
	}
else{		
   $co1=$_REQUEST['co1'];
$co2=$_REQUEST['co2'];
$co3=$_REQUEST['co3'];
$co4=$_REQUEST['co4'];
$co5=$_REQUEST['co5'];
$CID=$_REQUEST['subject'];

    $query1="insert into  Course_Outcome VALUES('$CID','1','$co1')";   
    $res1=mysql_query($query1);
    $query1="insert into  Course_Outcome VALUES('$CID','2','$co2')";   
    $res2=mysql_query($query1);
    $query1="insert into  Course_Outcome VALUES('$CID','3','$co3')";   
    $res3=mysql_query($query1);
$query1="insert into  Course_Outcome VALUES('$CID','4','$co4')";   
    $res4=mysql_query($query1);
$query1="insert into  Course_Outcome VALUES('$CID','5','$co5')";   
    $res5=mysql_query($query1);
   if($res1 and $res2 and $res3 and $res4 and $res5 ){
    echo "<script>alert('Successful')</script>";
    echo "<script>self.location='addco.php'</script>";
	}
 else  die('Invalid query! Error');
}
}
?>


<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Add Questions</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
        <link rel="stylesheet" href="style.css">
    
  </head>

  <body>
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
	
	  <a class="navbar-brand" href='facultydash.php'>Add Course Outcome To Database</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="facultydash.php">Logged in As     <?php echo $_SESSION["name"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>


<script src="https://code.jquery.com/jquery-1.11.3.js" type="text/javascript" charset="utf-8"></script>
		<script language="javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script>
		<script src="questions.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.0.0.js"></script>

	
    <div class="wrapper">
	<div class="container">
			<center>Select Subject </center>
			<form method="post">
			<select name="subject">
			<?php echo($options);?>				
				
			</select>
		<br>
		<h3>Enter the CO and details to add it to question bank</h3>
		<br>
		<form method="POST">
			
			<input id="co1" name="co1" type="text" placeholder="CO1" required>

			<input id="co2" name="co2" type="text" placeholder="CO2" required>
			<input id="co3" name="co3" type="text" placeholder="CO3" required>
			<input id="co4" name="co4" type="text" placeholder="CO4" required>
                 	<input id="co5" name="co5" type="text" placeholder="CO5" required> 						  	                  <button id="sub" type="submit" name="save" id="login-button">Proceed</button><br><br>
			<button id="sub" type="button" name="back" id="done-button" onClick="location.href='admindash.php'">Go to Dashboard</button>
			<button id="csv" type="button" name="csv"  id="csv-redirect" onClick="location.href=''">Upload using a .csv file</button>
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
