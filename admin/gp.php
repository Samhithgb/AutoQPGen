<?php
include("phpgraphlib.php");
include('phpgraphlib_pie.php');
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
$graph=new PHPGraphLib(550,350); 
$graphpie = new PHPGraphLibPie(400, 200);
$id=$_SESSION['qpaper'];
//$l1=$_SESSION['l1q'];
//$l2=$_SESSION['l2q'];
//$l3=$_SESSION['l3q'];



$dataArray=array();
/*
$dataArray['Level 1']=intval($l1);
$dataArray['Level 2']=intval($l2);
$dataArray['Level 3']=intval($l3);
*/

$link = mysql_connect('localhost', 'root', 'root')
   or die('Could not connect: ' . mysql_error());
     
mysql_select_db('Question_Paper_Generator') or die('Could not select database');

  
//get data from database

$sql="SELECT L1,L2,L3 FROM Question_Paper where QP_ID='$id'";
$result = mysql_query($sql) or die('Query failed: ' . mysql_error());
if ($result) {
  while ($row = mysql_fetch_assoc($result)) {
      $l1=(int)$row['L1'];
      $l2=(int)$row['L2'];
	  $l3=(int)$row['L3'];
	  
      //add to data areray
      $dataArray['Level 1']=$l1;
      $dataArray['Level 2']=$l2;
      $dataArray['Level 3']=$l3;

  }
	  
}



$graph->addData($dataArray);
$graph->setBarColor('navy');
$graph->setupXAxis(20, 'blue');
$graph->setTitleColor('blue');
$graph->setGridColor('153,204,255');
$graph->setDataValues(true);
$graph->setDataValueColor('navy');
$graph->setGoalLine('10', 'fuscia', 'dashed');
$graph->setTitle("Difficulty Statistics");
$graph->setGradient("black", "blue");
$graph->setBarOutlineColor("black");
$graph->createGraph();

?>
