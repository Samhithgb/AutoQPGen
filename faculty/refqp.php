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
error_reporting(E_ALL);
ini_set("display_errors",'1');


include("connect.php");
//include("html_to_doc.inc.php");


$subject = $_SESSION['subject'];
//$eval= $_REQUEST['eval'];
$_SESSION['subject']=$subject;

//$_SESSION['eval']=$eval;
$result = mysql_query("SELECT * FROM  Prev_Qp where Course_ID = '$subject'");

if(!$result or $result==null){
	echo "<script>alert('Error : No Question Papers Found');</script>";
	
}

echo "<link rel='stylesheet' href='style.css'>";
echo "<div class = 'wrapper'>
		<div class = 'container'>";
echo "<h2>Generated Question Papers for Subject :$subject</h2><br><br>";
echo "<center><table border=1>
<tr>
<th>Question Paper ID</th>
<th>Evaluation ID</th>
<th>Eval Name and Date</th>
</tr>";

$options='';
$width = 600; $height = 200;
while($row = mysql_fetch_array($result))
{
$f=$row['QP_ID'];

echo "<tr>";
echo "<td>" . $row['QP_ID'] . "</td>";
echo "<td>" . $row['Eval_ID'] . "</td>";
$id= $row['Eval_ID'];
$sql = "select 	Eval_Start_Date,Eval_Type from Evaluation where Eval_ID='$id'";
$result2 = mysql_query($sql);
$mname=mysql_result($result2,0,0);
$lname=mysql_result($result2,0,1);
echo "<td>" .$mname.' '.$lname.' '."</td>";

echo "</tr>";
$options.="<OPTION VALUE=\"$f\">".$f."</OPTION>"; 
}
echo "</table></center>";
mysql_close($con);



?>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Add Questions</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
        <link rel="stylesheet" href="style.css">
    
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
	
	  <a class="navbar-brand" href='facultydash.php'>Refer Previous Papers</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="facultydash.php">Logged in As     <?php echo $_SESSION["name"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>

<h2>Choose the Question Paper ID to view</h2>
 
<form method="post" action="renderqp.php">
<SELECT name="qps">
<?php echo($options);?>		
</SELECT>
<button type="submit" name="display">Display</button><br><br><center>
<button type="button" name="display" onClick="location.href='facultydash.php'">Go to Dashboard</button>
</form>
</body>
</html>
