<!DOCTYPE html>
<?php 
session_start();
include 'connect.php';
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

echo "<body>
	<form method='post'>
		<center><button type='submit' id='appr' name='approve'>Approve Paper</button></center>
			
	</form>
</body>
</html>";



$qpid=$_SESSION['qps'];

$_SESSION['qpaper']=$qpid;
$query="Select Content,L1,L2,L3 from  Question_Paper where QP_ID='$qpid'";
$res=mysql_query($query) or die(mysql_error());
if(!$res){
		echo "<script>alert('Question Paper Not Found!!');</script>";
}
else{
$qp=mysql_result($res,0,'Content');
$l1=mysql_result($res,0,'L1');
$l2=mysql_result($res,0,'L2');
$l3=mysql_result($res,0,'L3');

$_SESSION['qp']=$qp;
//var_dump($l1);
//$SESSION['l1q']=(int)$l1;
//$SESSION['l2q']=(int)$l2;
//$SESSION['l3q']=(int)$l3;
//echo "<center><img src='gp2.php'/></center>";
print $qp;	
}
	

	

$qpid=$_SESSION['qps'];

$sub=$_SESSION['subject'];

$eval=$_SESSION['eval'];
include("connect.php");

if(isset($_REQUEST['approve'])){

$qp=$_SESSION['qp'];
print $qp;
$qp=mysql_real_escape_string($qp);
$sql = "insert into Prev_Qp values('$qpid','$eval','$sub','$qp')";
$res=mysql_query($sql);
if(!$res){
		echo "<script>alert('Error!! Paper might have already been selected!');</script>";
}
echo "
 <script type='text/javascript'>
        
            var ButtonControl = document.getElementById('appr');
            ButtonControl.style.visibility = 'hidden';
            window.print();
        
    </script>";
}



?>

	  	
	
