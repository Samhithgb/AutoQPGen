<?php 
include("connect.php");
//error_reporting(E_ALL);
//ini_set("display_errors",'1');
session_start();
$l1=0;
$l2=0;
$l3=0;
$q=0;
include("connect.php");
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
$sid=$_SESSION['username'];
$sub=$_SESSION['subject'];
$eval=$_SESSION['eval'];
if(isset($_REQUEST['sel'])){
     
     $qpid=uniqid();
     $table3=$_SESSION['paper'];
     $l1=$_SESSION['l1'];
     $l2=$_SESSION['l2'];
     $l3=$_SESSION['l3'];
     $sql = "insert into Question_Paper values('$sid','$qpid','$sub','$eval','$table3',$l1,$l2,$l3); ";
     $res=mysql_query($sql);
     if(!$res){
       echo "Error in transferring to admin!  Try Again. mysql_error()";
     }
     else{
      echo "<script>alert('Successfully Submitted to the admin');</script>"; 
  		echo "<script>self.location='facultydash.php'</script>";
       
     }
  
}

echo" <form><center>
     
      <button type='submit' name='sel' id='prevqp'>Select This Paper</button>	
      </center></form>";


require 'aes.class.php';     // AES PHP implementation
require 'aesctr.class.php'; 
$table ="<head><meta http-equiv='Content-type' content='text/html; charset=utf-8' /></head>";
function pick_questions($mark,$y,$CID)
{
  
	$pw="password";
  global $table,$l1,$l2,$l3,$q;
  echo "<script>console.log('Pick Here');</script>";
     $lim=0;
   //  echo"<br>"; 
     $query="SELECT Ques_ID,Marks,Description,Unit_No,Course_Id,LOD,CO FROM Questions WHERE Unit_No='$y' and Course_Id='$CID' and Marks<=2 ORDER BY RAND()";
     $res=mysql_query($query);
     if(!$res){ 
     die('Error'.mysql_error());
}
     while (($row = mysql_fetch_array($res, MYSQL_BOTH)) AND ($lim<=$mark) ) {
     if(($mark-$lim)==1){
	if($row[1]==1){
         $q++;
          //printf ("Question: %s      Marks: %d    Unit: %d     LOD : %d",$row[2],$row[1],$row[3],$row[5]);
         $table.= "<tr><td>$q</td>";
         $table.="<td style='width:1000px'>";
         
         $table.= htmlspecialchars(AesCtr::decrypt($row[2], $pw, 256));
         $table.=  "</td><td>";   
         $table.=  $row[1];
         $table.=  "</td><td>";   
         $table.=  $row[5];
         $table.=  "</td><td>";   
         $table.=  $row[6];
         $table.=  "</td></tr>";
         $lim=$lim+$row[1];
 if($row[5]==1) $l1++;
             else if($row[5]==2) $l2++;
             else if($row[5]==3) $l3++;
             else echo "Error";
}
                   
         else continue;
                        }
          if($lim<$mark){
       
         $q++;
          //printf ("Question: %s      Marks: %d    Unit: %d     LOD : %d",$row[2],$row[1],$row[3],$row[5]);
         $table.= "<tr><td>$q</td>";
         $table.="<td style='width:1000px'>";
         
         $table.= htmlspecialchars(AesCtr::decrypt($row[2], $pw, 256));
         $table.=  "</td><td>";   
         $table.=  $row[1];
         $table.=  "</td><td>";   
         $table.=  $row[5];
         $table.=  "</td><td>";   
         $table.=  $row[6];
         $table.=  "</td></tr>";
         $lim=$lim+$row[1];
 if($row[5]==1) $l1++;
             else if($row[5]==2) $l2++;
             else if($row[5]==3) $l3++;
             else echo "Error";
}
         }
 
 }//end of function


function pick_theory_questions($u,$CID,$used_questions,$y,$d){
global $table,$l1,$l2,$l3,$q;
$x=$d;
$flag=$y;
$a="1";
$b="2";
$c="3";
$dot=".";
$lim=16;$cum=0;
$sel=rand(0,2);

$no=0;$pw="password";
switch($sel){
    
   case 0: 
   $no=2;
   $query1= "Select Ques_ID,Marks,Description,Unit_No,Course_Id,LOD,CO from Questions where Unit_No='$u' and Marks=10 order by rand()";
   $res1= mysql_query($query1);
   $query2= "Select Ques_ID,Marks,Description,Unit_No,Course_Id,LOD,CO from Questions where Unit_No='$u' and Marks=6 order by rand()";
   $res2= mysql_query($query2);
   break;
   
   
   case 1:
   $no=2;
   $query1= "Select Ques_ID,Marks,Description,Unit_No,Course_Id,LOD,CO from Questions where Unit_No='$u' and Marks=8 order by rand()";
   $res1= mysql_query($query1);
   $query2= "Select Ques_ID,Marks,Description,Unit_No,Course_Id,LOD,CO from Questions where Unit_No='$u' and Marks=8 order by rand()";
   $res2= mysql_query($query2);
   break;
   
    case 2: 
    $no=3;
    $query1= "Select Ques_ID,Marks,Description,Unit_No,Course_Id,LOD,CO from Questions where Unit_No='$u' and Marks=6 order by rand()";
    $res1= mysql_query($query1);
    $query2= "Select Ques_ID,Marks,Description,Unit_No,Course_Id,LOD,CO from Questions where Unit_No='$u' and Marks=4 order by rand()";
    $res2= mysql_query($query2);
    $query3= "Select Ques_ID,Marks,Description,Unit_No,Course_Id,LOD,CO from Questions where Unit_No='$u' and Marks=6 order by rand()";
    $res3= mysql_query($query3);
   break;
   
    
}
$q1=0;
$q2=0;
$q3=0;    
$z=0;
while($r1 = mysql_fetch_array($res1,MYSQL_BOTH) and $z<1){
if(!(in_array($r1[0],$used_questions))){
$z++;    $q1=$r1[1];
//printf ("Question: %s        Marks: %d     Unit: %d     LOD : %d",$r1[2],$r1[1],$r1[3],$r1[5]);
        $q++;
        $table.= "<tr><td>$x$dot$a</td>";
        $table.="<td style='width:1000px'>"; 
        $table.=htmlspecialchars(AesCtr::decrypt($r1[2], $pw, 256));
        $table.=  "</td><td>";   
        $table.=  $r1[1];        
        $table.=  "</td><td>";   
        $table.=  $r1[5];
        $table.=  "</td><td>";   
        $table.=  $r1[6];        
        $table.=  "</td></tr>";

 if($r1[5]==1) $l1++;
             else if($r1[5]==2) $l2++;
             else if($r1[5]==3) $l3++;
             else echo "Error";
        array_push($used_questions,$r1[0]);
}

else {echo "<script>window.location.reload();</script>";
     echo "Not enough questions! Please add questions to the database!";}
}
     
$z=0;
while($r2 = mysql_fetch_array($res2,MYSQL_BOTH) and $z<1){
if(!(in_array($r2[0],$used_questions))){
$z++;$q2=$r2[1];
$q++;
//printf ("Question: %s        Marks: %d     Unit: %d     LOD : %d",$r2[2],$r2[1],$r2[3],$r2[5]);
$table.= "<tr><td>$x$dot$b</td>";
$table.="<td style='width:1000px'>"; 
         $table.= htmlspecialchars(AesCtr::decrypt($r2[2], $pw, 256));
         $table.=  "</td><td>";   
         $table.=  $r2[1];       
         $table.=  "</td><td>";   
         $table.=  $r2[5];
         $table.=  "</td><td>";   
         $table.=  $r2[6];
         $table.=  "</td></tr>";
if($r2[5]==1) $l1++;
             else if($r2[5]==2) $l2++;
             else if($r2[5]==3) $l3++;
             else echo "Error";
         array_push($used_questions,$r2[0]);
}

else { echo "<script>window.location.reload();</script>";
     echo "Not enough questions! Please add questions to the database!";}
}     
     
 
if($no==3){
$z=0;   
while($r3 = mysql_fetch_array($res3, MYSQL_BOTH) and $z<1){
if(!(in_array($r3[0],$used_questions))){
$z++;$q3=$r3[1];$q++;
//printf ("Question: %s        Marks: %d     Unit: %d     LOD : %d",$r3[2],$r3[1],$r3[3],$r3[5]);
         $table.= "<tr><td>$x$dot$c</td>";
         $table.="<td style='width:1000px'>"; 
         $table.= htmlspecialchars(AesCtr::decrypt($r3[2], $pw, 256));
         $table.=  "</td><td>";   
         $table.=  $r3[1];        
         $table.=  "</td><td>";   
         $table.=  $r3[5];
         $table.=  "</td><td>";   
         $table.=  $r3[6];
         $table.=  "</td></tr>";
	 if($r3[5]==1) $l1++;
             else if($r3[5]==2) $l2++;
             else if($r3[5]==3) $l3++;
             else echo "Error";
         array_push($used_questions,$r3[0]);
}

else { echo "<script>window.location.reload();</script>";
     echo "Not enough questions! Please add questions to the database!";}
}   
    
    
} 
$cum=$q1+$q2+$q3;
if($cum<$lim)
{
   echo "<script>self.location='error.html'</script>";
}
if ($flag==0){

$or="OR";
         $table.= "<tr><td></td>";
         $table.= "<td><center><strong>$or</strong></center></td>";
         $table.=  "</tr>";
}

if ($flag==1){
$or=".";
         $table.= "<tr>";
         $table.= "<td><center>$or</center></td>";
         $table.=  "</tr>";


}

return $used_questions;     
}  //end of function
     

if(isset($_REQUEST['save']));
{
 
$CID=$_SESSION['subject'];
$CID='12IS64';
$type="SEE";  
$cnt[0]=1;
$cnt[1]=1;
$cnt[2]=1;
$cnt[3]=1;
$cnt[4]=1;
$cnt[5]=1;
$no_of_units=5; 
$t=array(0,0,0,0,0,0);
$qu_max=20;
$th_max=160;	
$no_of_units=5;
$x=1;	
$marks=4;
     $sem = mysql_result(mysql_query("select Semester from Course where Course_ID='$CID'"),0);
	
    //$marks1=ceil($th_max/$no_of_units);
    $f1=0;
    $f2=0; 
    $z=2;
    $y=1;	
    $te=$no_of_units;

 $CNAME = mysql_result(mysql_query("select Course_Name from Course where Course_ID='$CID'"),0);
          $table.=  "<center><table border='1' style='border-collapse: collapse;'>";
          $table.=  "<tr><td style='width:1115px'>";
          $table.=  "<img src='logo.JPG'></img>";
          $table.=  "<center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br></center></strong>"; 
          $table.=  "<center><strong>SEE Question Paper<br></center></strong>"; 
          $table.=  "</tr>";
          $table.=  "<tr><td style='width:1115px'>";
          $table.=  "<strong>Course : $CID  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; $CNAME  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : $sem</strong>"; 
          $table.=  "</td></tr>";
          $table.=  "<tr><td style='width:1115px'><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 3   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> ";         
          $table.=  "<tr><td style='width:1115px'><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 20 + 80</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr>"; 
                 
$table.=  "</table>";
$table.=  "<br><center><strong>Part-A</strong></center><br>";
$table.=  "<center><table border='1' style='border-collapse: collapse;'>";
$table.=  "<tr><th>No</th><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr>";  

while($x<=5){
		//echo "<script>console.log('Here1');</script>";
			if($cnt[$x]==1)
			{
				
			
				$cnt[$x]=$marks;
				$temp=$marks;
	                        pick_questions($temp,$x,$CID); 
                                $te--;
                                //$f1=1;
			}
				
        		
		$x++;

             }
                       
$q=0;                       
$x=1;
$used=array();
$x=1;
$table.= "</table></center>";
$table.= "<br><center><strong>Part-B</strong></center><br><br>";
$table.= "<center><table border='1' style='border-collapse: collapse;'>";
$table.= "<tr><th>No</th><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr>";
$y=0;
$z=1;
while($x<=5){
   while($y<2)
  {
   $used=pick_theory_questions($x,$CID,$used,$y,$z);
   $y++;$z++; 
   
  }
   //$z++;
   $x++;
   $y=0;
}


$table1=$table;
$table=mysql_real_escape_string($table);
$_SESSION['paper']=$table;
$_SESSION['l1']=$l1;
$_SESSION['l2']=$l2;
$_SESSION['l3']=$l3;
 echo "<center>L1 Questions : $l1, L2 Questions : $l2, L3 Questions : $l3</center>";
echo $table1;

}
?>
<html>
  
  <form>
