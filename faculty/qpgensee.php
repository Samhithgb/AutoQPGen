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

function pick_questions($y,$C,$maxx)
    {
           echo "<script>console.log('Entered Function');</script>";
        $sel=array(4,3,2);
        $ind=rand(0,2);
        $cnt=$sel[$ind];
       //$used=array();
        $sum=0;
        $mark=$maxx;
        $marks=0;
        $m=array(0,0);
        $temp=0;
        while($sum<=$maxx and $cnt>=1)
                      {
                        echo "<script>console.log('While big');</script>";
                          
                        $val=$mark/$cnt;
                        $m[0]=floor($val);
                        $m[1]=ceil($val);
                        $i=rand(0,1);
                        $marks=$m[$i];
                        $query="Select * from Questions where Marks=$marks and Unit_No=='$y' and Course_Id=='$C' order by RAND() limit 1";
                        $res=mysql_query($query);
                        $z=0;
                        
                        while($row = mysql_fetch_array($res, MYSQL_BOTH) and $z<1){
                        $temp=$temp+$row[2];
                        echo "<script>console.log('here');</script>";
                        if(in_array("$row[1]", $used) or ($temp>$maxx))
                        {
                            continue;
                        }
                        else{
                              array_push($used,"$row[1]");
                              printf ("Question: %s      Marks: %d    Unit: %d     LOD : %d",$row[4],$row[2],$row[7],$row[6]);
                              echo "<br>";
                              $cnt--;
                              $mark=$mark-$marks;
                              $sum=$sum+$marks; 
                            }
                            $z++;
                      }
    }}


 

if(isset($_REQUEST['save']));
{
 
    $CID=$_SESSION['subject'];
    //printf("%s",$CID);
    $type="SEE";  
    $no_of_units=5;  
$qu_max=20;
$th_max=160;	
$x=1;	
$qmarks=4;
printf ("Quiz Questions");echo "<br>";
//pick quiz questions
 echo "Quiz Questions";
 echo "<br>";
 while($x<=5)
    {
        $max=4;
        pick_questions($x,$CID,$max);
        echo "<br>";
        echo "<br>";
        $x++;
    }
    
    
$x=1;
//pick theory questions
 echo "Theory Questions";
 echo "<br>";
 while($x<=5)
    {
        $max=16;             
        pick_questions($x,$CID,$max);
        echo "<br>";
        echo "<br>";
        $x++;
    }     
}

?>