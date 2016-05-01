<!DOCTYPE html>
<?php 
session_start();
include("connect.php");
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
	

$result = mysql_query("SELECT * FROM Update_History");
$result2 = mysql_query("SELECT * FROM Login_History");

if(!$result){
	
	 echo "<script>alert('No results found!')</script>";
	 echo "<script>self.location='report.php'</script>";
}
echo "";
echo "<div class = 'wrapper'>
		<div class = 'container'>";
echo "<h2>Login History</h2>";
echo "<center><table>
<tr>
<th>Login Date</th>
<th>Login Time</th>
<th>User ID</th>
<th>User Type</th>

</tr>";
  

while($row1 = mysql_fetch_array($result2))
{


echo "<tr>";
echo "<td>" . $row1['Login_Date'] . "</td>";
echo "<td>" .$row1['Login_Time'] . "</td>";
echo "<td>" . $row1['User_ID'] . "</td>";
echo "<td>" . $row1['User_Type'] . "</td>";
echo "</tr>";

}
echo "</table></center>";


echo "<h2>Update History</h2>";
echo "<center><table>
<tr>
<th>Teacher ID</th>
<th>Course ID</th>
<th>Question_ID</th>
<th>Time_of_Updated</th>
</tr>";
  
$options='';
while($row = mysql_fetch_array($result))
{
$f=$row['Ques_ID'];
echo "<tr>";
echo "<td>" . $row['Teacher_ID'] . "</td>";
echo "<td>" .$row['Course_ID'] . "</td>";
echo "<td>" . $row['Question_id'] . "</td>";
echo "<td>" . $row['Time_of_update'] . "</td>";
echo "</tr>";
}
		
echo "</table></center>";








?>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel='stylesheet' href='style.css'>
 </head>
 
	 
	
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
        <li><a href="#lo">Logged in As     <?php echo $_SESSION["username"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav></body></html>