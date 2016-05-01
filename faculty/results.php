<!DOCTYPE html>
<?php 
error_reporting(E_ALL);
ini_set("display_errors",'1');
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
  require 'aes.class.php';     // AES PHP implementation
    require 'aesctr.class.php';  // AES Counter Mode implementation

include("connect.php");
if(isset($_REQUEST['save'])){

$unit = $_REQUEST['U_NO'];
$marks= $_REQUEST['marks'];
//$keyword=$cipher->encrypt($key, $macKey,$_REQUEST['KeyWords']);
$cid=$_SESSION['subject'];

$result = mysql_query("SELECT * FROM Questions where Course_Id = '$cid' and Unit_No = $unit and Marks>=$marks");
if(!$result){
	
	 echo "<script>alert('No results found!')</script>";
	 echo "<script>self.location='questdetails.php'</script>";
}
echo "<link rel='stylesheet' href='style.css'>";
echo "<div class = 'wrapper'>
		<div class = 'container'>";
echo "<h2>Search Results</h2><br><br>";
echo "<center><table border=1 >
<tr>
<th>Question ID</th>
<th>Question</th>
<th>Marks</th>
</tr>";
  
$options='';
while($row = mysql_fetch_array($result))
{
$pw="password";
$f=$row['Ques_ID'];
echo "<tr>";
echo "<td>" . $row['Ques_ID'] . "</td>";
echo "<td>" . htmlspecialchars(AesCtr::decrypt($row['Description'], $pw, 256)) . "</td>";

echo "<td>" . $row['Marks'] . "</td>";
echo "</tr>";
$options.="<OPTION VALUE=\"$f\">".$f."</OPTION>"; 
}
echo "</table></center>";
mysql_close($con);
}


if(isset($_REQUEST['update'])){
	
$id=$_REQUEST['updater'];
$pw="password";

$update= AesCtr::encrypt($_REQUEST['quest'], $pw, 256);

$teacher=$_SESSION['username'];
$cid=$_SESSION['subject'];;
$date = date('Y/m/d H:i:s');


$query="update Questions SET Description='$update' where Ques_ID = '$id'";
$query2="insert into Update_History values('$teacher','$cid','$id','$date')";

 $res=mysql_query($query);
 $res2=mysql_query($query2);
 
 if($res){
    echo "<script>alert('Successfully updated the question')</script>";
    echo "<script>self.location='questdetails.php'</script>";
	}
 else  die('Invalid query: ' . mysql_error());
	
	
}







?>
  <head>
    <meta charset="UTF-8">
    <title>Search Results</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
        <link rel="stylesheet" href="style.css">
    
  </head>


<br><br>
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
	
	  <a class="navbar-brand" href='questdetails.php'>Edit Questions &nbsp | &nbsp Search Results </a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="facultydash.php">Logged in As     <?php  echo $_SESSION["name"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>

<h2>Choose the question to update:</h2>
 
<form method="post">
<SELECT name="updater">
	<?php echo($options);?>		
</SELECT>
<br><br>
<input type="text" name="quest" placeholder="Give the updated question" required>
<br>
<button type="submit" name="update">Update</button>
<br><br>
<button type="button" onClick="location.href='questdetails.php'">Go to Search</button>

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
