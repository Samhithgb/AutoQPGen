<html>

<?php
error_reporting(E_ALL);
include("connect.php");
session_start();
if(isset($_REQUEST['save'])){
echo "<script>alert('Starting..');</script>";
$qun=array();
$thun=array();
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
	
session_cache_expire( 20 );
$inactive = 10;
if(isset($_SESSION['start']) ) {
	$session_life = time() - $_SESSION['start'];
	if($session_life > $inactive){
		echo "<script>alert('Session Timeout! Please Login Again!');</script>";
		echo "<script>self.location='../welcome.php'</script>";
	}
}
$_SESSION['start'] = time();

/*
$qun1=0;$qun2=0;$qun3=0;$qun4=0;$qun5=0;
$thun1=0;$thun2=0;$thun3=0;$thun4=0;$thun5=0;	
*/
if($_REQUEST['qun1']!=0){
	$qun[1]=$_REQUEST['qun1'];
}
if($_REQUEST['qun2']!=0){
	$qun[2]=$_REQUEST['qun2'];
}if($_REQUEST['qun3']!=0){
	$qun[3]=$_REQUEST['qun3'];
}if($_REQUEST['qun4']!=0){
	$qun[4]=$_REQUEST['qun4'];
}if($_REQUEST['qun5']!=0){
	$qun[5]=$_REQUEST['qun5'];
}

if($_REQUEST['thun1']!=0){
	$thun[1]=$_REQUEST['thun1'];
}if($_REQUEST['thun2']!=0){
	$thun[2]=$_REQUEST['thun2'];
}if($_REQUEST['thun3']!=0){
	$thun[3]=$_REQUEST['thun3'];
}if($_REQUEST['thun4']!=0){
	$thun[4]=$_REQUEST['thun4'];
}if($_REQUEST['thun5']!=0){
	$thun[5]=$_REQUEST['thun5'];
}	


	
$qmarks=0;
$qno=1;
$i=0;
$quizquestions=array();
$course=$_SESSION['subject'];

//while($qmarks<15){
	$i++;
	
	if($qun[$i]!=0)
		{
     	$sql="select * from Questions where Unit_No='1' and Course_Id='$course' and Marks <=2";
		$res=mysql_query($sql);
		echo "<script>console.log('Now');</script>";
		
		if($res){
		
		$row=mysql_fetch_array($res);
		$ques=$row["Description"]; 
	    $m=$row["Marks"];
		$co=$row["CO"];
		$qid=$row["Ques_ID"];
		$question.="$qno";
		$quesiton.=$ques;
		 $quesiton.=$m;  
		 $quesiton.=$co;
		echo "<script>console.log('$question');</script>";
			
		if($m<$qun[$i])
		array_push($quizquestions,$question);
		$qmarks = $qmarks+$m;
		$qun[$i]=$qun[$i]-$m;
		$qno++;
		}
		else{
			echo "<script>alert('Error : Not enough quiz questions in database');</script>";
			}
		
	//}

	
}
	
echo "<script>alert('Done');</script>";
	
}
?>

<head>
		
	 <meta charset="UTF-8">
    <title>Hello Faculty!</title>
      <link rel="stylesheet" href="style.css">
</head>


<body>
	<div class = "wrapper">
		<div class = "container">
			
			<br>
			<h1>Enter total marks from each unit.</h1>
			Enter 0 if a unit is not included for the test.
			<br><br>Quiz (Total 15): 
		<form method="post">
			<input name= "qun1" id="un1" type="number" placeholder="Unit 1" required>
			<input id="cid" name="qun2" type="number" placeholder="Unit 2" required>
			<input id="Un3" name="qun3" type="number" placeholder="Unit 3" required>
		    <input id="Un4" name="qun4" type="number" placeholder="Unit 4" required>
			<input id="un5" name="qun5" type="number" placeholder="Unit 5" required>
				  <br><br>
			Theory (Total 50):	  
			<input name= "Unit1" id="thun1" type="number" placeholder="Unit 1" required>
			<input id="cid" name="thun2" type="number" placeholder="Unit 2" required>
			<input id="Un3" name="thun3" type="number" placeholder="Unit 3" required>
		    <input id="Un4" name="thun4" type="number" placeholder="Unit 4" required>
			<input id="un5" name="thun5" type="number" placeholder="Unit 5" required>
			
			<button type="submit" id="sub" name= "save">Generate Paper</button>
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
</body>
</html>
