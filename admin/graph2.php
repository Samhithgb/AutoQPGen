<?php
include("phpgraphlib.php");
include('phpgraphlib_pie.php');
session_start();
$graph=new PHPGraphLib(550,350); 
$graphpie = new PHPGraphLibPie(400, 200);

include('phpgraphlib_stacked.php');
//$graph = new PHPGraphLibStacked(500,300);

$dataArray=array();




$link = mysql_connect('localhost', 'root', 'root')
   or die('Could not connect: ' . mysql_error());
     
mysql_select_db('Question_Paper_Generator') or die('Could not select database');

  
//get data from database

$sql="SELECT Course_Id,Count(*) as count FROM Questions GROUP BY Course_Id ";
$result = mysql_query($sql) or die('Query failed: ' . mysql_error());
if ($result) {
  while ($row = mysql_fetch_assoc($result)) {
      $salesgroup=$row["Course_Id"];
      $count=$row["count"];
      //add to data areray
      $dataArray[$salesgroup]=$count;
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