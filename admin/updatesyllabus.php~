<!DOCTYPE html>
<?php 
session_start();
include("connect.php");
 
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
    <link rel="stylesheet" href="style.css">    
</head>

<br><br>
</head>

<body>
	<div class = "wrapper">
		<div class = "container">
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
