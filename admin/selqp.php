<!DOCTYPE html>
<?php
include("connect.php");
session_start();
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
	
  
  //$username = $_SESSION['username'];
  $sql="select Eval_Start_Date,Eval_Type,Eval_ID from  Evaluation where Eval_Start_Date > '$date'";
$result=mysql_query($sql);  
 $options="";   
 $i = 1;
  while ($row=mysql_fetch_array($result)) { 
    $f=$row["Eval_Start_Date"]; 
	$k=$row["Eval_Type"];
	$n=$row["Eval_ID"];
	$type[$n]=$k;
    $options.="<OPTION VALUE=\"$n\">".$f.' '.$k."</OPTION>"; 
    $i++;
  }

  
  $sql="select Dept_Name,Dept_ID from Department"; 
  $result=mysql_query($sql); 

  $options0="";   
  $i = 1;
  while ($row=mysql_fetch_array($result)) { 
    $f=$row["Dept_Name"]; 
	$k=$row["Dept_ID"];
    $options0.="<OPTION VALUE=\"$k\">".$f.' '.$k."</OPTION>"; 
    $i++;
  }
  
  
  if(isset($_REQUEST['go'])){
  $dept=$_REQUEST['department'];
  echo "<script>console.log('Insdie');</script>";
  $sql="select Course_ID,Course_Name from Course where Dept_ID='$dept'"; 
  $result=mysql_query($sql); 

  $options1="";   
  $i = 1;
  while ($row=mysql_fetch_array($result)) { 
    $f=$row["Course_ID"]; 
	$k=$row["Course_Name"];
    $options1.="<OPTION VALUE=\"$f\">".$f.' '.$k."</OPTION>"; 
    $i++;
  }
  }
  /*
  if(isset($_REQUEST['go2'])){
    
    $_SESSION['subject']=$_REQUEST['subject'];
    $_SESSION['eval']=$_REQUEST['eval'];
	
    
    
  }
  */
  
  
  ?>
<head>
		
	 <meta charset="UTF-8">
    <title>Select QP!</title>
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
	
	  <a class="navbar-brand" href='admindash.php'>Fetch Question Paper</a>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#lo">Logged in As     <?php echo $_SESSION["username"]; ?></a></li>
       
     
      </ul>
    </div>
  </div>
</nav>
			<br>
			<h3>Select Department and Subject</h3>
			<br><br><br>
			<center>Select Department </center>
			<form method="post">
			<select name="department">
			<?php echo($options0);?>				
							
			</select>
			<br>	<br><br>
				<button type="submit" name="go" id="prevqp">Get Subjects</button><br><br>	
          
			
			</form>
			<br>
			Select Subject :
			<br>
			<form method='post' action="displayqps.php">	
			<select name="subject">
			<?php echo($options1);?></select>			
      <br><br>
	  Select the evaluation:<br><br>
	  <select name="eval">
				<?php echo($options);?>		
				</select><br><br>
      <button type="submit" name="go2" id="prevqp">Fetch Question Papers</button><br><br>	
</form>		</div>
			
			
			
			
			
			
		
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