<!DOCTYPE html>
<?php
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

if(isset($_SESSION['username'])){
  
  $username = $_SESSION['username'];
  $sql="select Course_ID from Handled_By where Teacher_ID='$username'"; 
  $sql2="select Designation,FName,MName,LName from Teacher where Teacher_ID='$username'";
  $result=mysql_query($sql); 
  $result2=mysql_query($sql2); 
 
  $options="";
  $options2="";   
     
  $i = 1;
  while ($row=mysql_fetch_array($result)) { 
    $f=$row["Course_ID"]; 
    $options.="<OPTION VALUE=\"$f\">".$f."</OPTION>"; 
    $i++;
  }
  
  while ($row=mysql_fetch_array($result2)) { 
    $f=$row["Designation"]; 
	$k=$row["FName"];
	$l=$row["MName"];
	$m=$row["LName"];
	
	
    $options2.=$f.'.'.$k.' '.$l.' '.$m; 
	$_SESSION['name']=$options2;
    $i++;
  }
  
}


if(isset($_REQUEST['add'])){
	
		if($_REQUEST['subject']){
	    $_SESSION['subject']=$_REQUEST['subject'];
		$now= $_SESSION['subject'];
		 
		echo "<script>self.location='addquestions.php'</script>";
		}
		else  "<script>alert('Select your subject!')</script>";
}

if(isset($_REQUEST['edit'])){
	
		if($_REQUEST['subject']){
	    $_SESSION['subject']=$_REQUEST['subject'];
		$now= $_SESSION['subject'];
		 
		echo "<script>self.location='questdetails.php'</script>";
		}
		else  "<script>alert('Select your subject!')</script>";
}


if(isset($_REQUEST['gen'])){
	 
if($_REQUEST['subject']){
	    $_SESSION['subject']=$_REQUEST['subject'];
		
		 
		echo "<script>self.location='selecteval.php'</script>";
		}
		else  "<script>alert('Select your subject!')</script>";
}


	 
if(isset($_REQUEST['syllabus'])){
	    $_SESSION['subject']=$_REQUEST['subject'];
		
		 
		echo "<script>self.location='syllabus.php'</script>";
		}
		


if(isset($_REQUEST['logout'])){
	
	
		session_destroy();
		echo "<script>self.location='../welcome.php'</script>";
		
		
}



if(isset($_REQUEST['prev'])){
	
		 $_SESSION['subject']=$_REQUEST['subject'];
		echo "<script>self.location='refqp.php'</script>";
		
		
}

if(isset($_REQUEST['co'])){
	
		 $_SESSION['subject']=$_REQUEST['subject'];
		echo "<script>self.location='co.php'</script>";
		
		
}


?>



<head>
		
	 <meta charset="UTF-8">
    <title>Hello Faculty!</title>
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
	
	  <a class="navbar-brand">Welcome Faculty!</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#lo">Logged in As     <?php echo $_SESSION["name"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>

<img src="logo.png">
			<br><br>
			<center>Select Subject </center>
			<form method="post">
			<select name="subject">
			<?php echo($options);?>				
							
			</select>
	
			<br><br><br><br>
			<button type="submit" name="add" id="addquestions">Add Questions</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="submit" name="gen" id="generateqp">Generate Question Paper</button>	
			<br><br><br><br>
			<button type="submit" name="edit" id="EditQuestions">Edit Questions in Database</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="submit" name="prev" id="prevqp">Refer Previous Papers</button><br><br><br><br>	
	        <button type="submit" name="syllabus" id="syllabus">Check The Syllabus</button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <button type="submit" name="co" id="co">Check Course Outcome</button>

<br><br>	
	<center><button type="submit" name="logout" id="lo">Log Out</button></center>		
			
					</form>
			
			
			
			
			</div>
			
			
			
			
			

			
			</div>
</body>
</html>
