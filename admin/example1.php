<?php
error_reporting(E_ALL);
ini_set("display_errors",'1');
include('phpgraphlib.php');
$graph = new PHPGraphLib(500, 350);

$l1=$_SESSION['l1'];
$l2=$_SESSION['l2'];
$l3=$_SESSION['l3'];


$data = array($l1,$l2,$l3);
$graph->addData($data);
$graph->setTitle('Widgets Produced');
$graph->setGradient('red', 'maroon');
$graph->createGraph();
?>
