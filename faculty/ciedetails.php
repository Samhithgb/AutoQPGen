<?php 
  require 'aes.class.php';     // AES PHP implementation
    require 'aesctr.class.php'; 
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
	
$table ='';
$l1=0;
$l2=0;
$l3=0;
$q=0;
echo "

 <form><center>
     
      <button type='submit' name='sel' id='prevqp'>Select This Paper</button>	
      </center></form>";

if(!isset($_SESSION['username'])){
  echo "<script>alert('Please login again');</script>";
  		echo "<script>self.location='../welcome.php'</script>";
		
}

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











function pick_questions($mark,$y,$CID)
{
  
	$pw="password";
  global $table,$l1,$l2,$l3,$q;
	echo "<script>console.log('Pick Here');</script>";
     $lim=0;
    $query="SELECT Ques_ID,Marks,Description,Unit_No,Course_Id,LOD,CO FROM Questions WHERE Unit_No='$y' and Course_Id='$CID' and Marks<=2 ORDER BY RAND()";
     $res=mysql_query($query);
     if(!$res){
    die('Error'.mysql_error());
}
     while (($row = mysql_fetch_array($res, MYSQL_BOTH)) AND ($lim<=$mark) ) {
     if(($mark-$lim)==1){
				if($row[1]==1){
          $q++;
         // printf ("Question: %s      Marks: %d    Unit: %d     LOD : %d",$row[2],$row[1],$row[3],$row[5]);
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
          
    
             
             if($row[5]==1) $l1++;
             else if($row[5]==2) $l2++;
             else if($row[5]==3) $l3++;
             else echo "Error";
         //    var_dump($l1);         
             
           
           
          


          
					                                          
					       $lim=$lim+$row[1];
					      }
                          else continue;
                        }
          else if($lim<$mark){
            $q++;
         $table.=  "<tr><td>$q</td>";
         $table.="<td style='width:1000px'>"; 
         $table.=   htmlspecialchars(AesCtr::decrypt($row[2], $pw, 256));
                  $table.= "</td><td>";   
          $table.=  $row[1];
       
         $table.=  "</td><td>";   
           $table.= $row[5];
         $table.=  "</td><td>";   
           $table.= $row[6];
             $table.= "</td></tr>";
          //printf ("Question: %s        Marks: %d         Unit: %d     LOD : %d",$row[2],$row[1],$row[3],$row[5]);
          switch($row[5]){
             
             case 1 : $l1++;break;
             case 2 : $l2++;break;
             case 3 : $l3++;break;
             var_dump($l1);         
                     
             
           }
          $lim=$lim+$row[1];}
         }
 
    }




function pick_theory_questions($unit,$CID,$used_questions){
global $table,$l1,$l2,$l3,$q;
$marks=0;
$arr=array(6,8,5,10);
$pw="password";

$r=rand(0,3);    
$i=0;
while($i<2){
		echo "<script>console.log('Inside While loop');</script>";
    
if($marks==0)
$marks=$arr[$r]; 
//echo $r;


//echo "Fetching for $marks marks from unit $unit<br>"; 

$query="SELECT Ques_ID,Marks,Description,Unit_No,Course_Id,LOD,CO FROM Questions WHERE Unit_No='$unit' and Course_Id='$CID' and Marks=$marks and Marks>1 ORDER BY RAND()";


$res1=mysql_query($query);
//printf("MARKS NOW %s",$res[0]);

//printf("%s",$res);
if(!$res1){
    
    die(mysql_error());
}

if(mysql_num_rows($res1)==0){
    if(i==0){
    $arr=array(6,8,5,10);
$r=rand(0,3);$marks=$arr[$r]; echo "<script>console.log('QUestion Not Found!');</script>";   continue;}

else if( i==1) {
     echo "<script>window.location.reload();</script>";
    echo "Not enough questions! Please add questions to the database!";
}
}

$z=0;
while($res = mysql_fetch_array($res1, MYSQL_BOTH) and $z<1){


if(!(in_array($res[0],$used_questions))){
$z++; $q++;
 $table.=  "<tr><td>$q</td>";
 $table.="<td style='width:1000px'>"; 
          $table.=   htmlspecialchars(AesCtr::decrypt($res[2], $pw, 256));
         $table.=  "</td ><td>";   
           $table.=  $res[1];
        
         $table.=  "</td><td>";   
           $table.=  $res[5];
         $table.=  "</td><td>";   
           $table.=  $res[6];
             $table.=  "</td></tr>";
              switch($res[5]){
           
             case 1 : $l1++;break;
             case 2 : $l2++;break;
             case 3 : $l3++;break;
             var_dump($l1);         
                echo "Inside";       
             
           }
//printf ("Question: %s        Marks: %d     Unit: %d     LOD : %d",$res[2],$res[1],$res[3],$res[5]);

array_push($used_questions,$res[0]);
}

else {continue;}
}

if($res==null and $z<1){
         

  echo "<script>window.location.reload();</script>";

    echo "<h3><strong>Sorry! We could not find enough questions of required variety in database!Reload the page or add questions of $marks marks of unit $unit into database!</strong></H3>";
    return $used_questions; 
}


$marks=10-$marks;
if($marks<=0)break;
$i++;  

}  

return $used_questions;
}




if(isset($_REQUEST['save']));
{
 
    
    $u1=$_REQUEST['unit_1']; 
    $u2=$_REQUEST['unit_2'];    
    $u3=$_REQUEST['unit_3'];    
    $u4=$_REQUEST['unit_4'];    
    $u5=$_REQUEST['unit_5']; 
    
  
    $pw="password";
  
   

    
   
    $CID=$_SESSION['subject'];
     //printf("%s",$CID);
    $type="CIE";  
    $CNAME = mysql_result(mysql_query("select Course_Name from Course where Course_ID='$CID'"),0);
    if(!$CNAME || $CNAME==null){echo "<script>console.log('Error Retrieving Course Name');</script>";}
    $sem = mysql_result(mysql_query("select Semester from Course where Course_ID='$CID'"),0);
  
$cnt[0]=0;
$cnt[1]=0;
$cnt[2]=0;
$cnt[3]=0;
$cnt[4]=0;
$cnt[5]=0;
$no_of_units=0; 
$t=array(0,0,0,0,0,0);

if($u1=="y"||$u1=="Y" ) {$cnt[1]++;$no_of_units++;$t[1]=$_REQUEST['tunit_1'];}
if($u2=="y"|| $u2=="Y") {$cnt[2]++;$no_of_units++;$t[2]=$_REQUEST['tunit_2'];}
if($u3=="y"|| $u3=="Y") {$cnt[3]++;$no_of_units++;$t[3]=$_REQUEST['tunit_3'];}
if($u4=="y" || $u4=="Y") {$cnt[4]++;$no_of_units++;$t[4]=$_REQUEST['tunit_4'];}
if($u5=="y" || $u5=="Y") {$cnt[5]++;$no_of_units++;$t[5]=$_REQUEST['tunit_5'];}
    
    $t1="CIE";
    $t2="SEE";
    $qu_max=15;
    $x=1;
    $th_max=50;
    $qu_max=15;

    if($type==$t2){
		   $qu_max=20;
		   $th_max=160;	
                   $no_of_units=5;
		}

    $x=1;
    $check=true; 
    if($qu_max%$no_of_units==0)$check=false;
	
    $marks=ceil($qu_max/$no_of_units);
	
    $marks1=ceil($th_max/$no_of_units);
    $f1=0;
    $f2=0; 
	$z=2;
	$y=1;	
    $te=$no_of_units;
    $changer=0;



 $table.=  "<center><table border='1' style='border-collapse: collapse;'>";
          $table.=  "<tr><td style='width:1115px'>";
          $table.=  "<img src='logo.JPG'></img>";
          $table.=  "<center><strong>R V College of Engineering<br>Department of Information Science and Engineering<br>CIE Question Paper</center></strong>"; 
          $table.=  "</tr>";
                  $table.=  "<tr><td style='width:1115px'>";
                  $table.=  "<strong>Course : $CID  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; $CNAME  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Semester : $sem</strong>"; 
                 $table.=  "</td></tr>";
                 $table.=  "<tr><td style='width:1115px'><strong> Date : &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;No Of Hours : 2   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Staff : </tr> ";         
                $table.=  "<tr><td style='width:1115px'><strong> Note :</strong> i) Answer all questions  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong>Max Marks : 15 + 50</strong> <br> ii)Part A questions to be answered in first two pages of answer booklet.</td></tr>"; 
                  //echo "Name : $CNAME";  
                        
                 
 $table.=  "</table>";

      

$table.=  "<br><center><strong>Part 1</strong></center><br>";
 $table.=  "<center><table border='1' style='border-collapse: collapse;'>";
    $table.=  "<tr><th>No</th><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr>"; 
  
while($x<=5){
 
		$table.=  "<script>console.log('Here1');</script>";
			if($cnt[$x]==1)
			{
				if($te>1){
			
				$cnt[$x]=$marks;
				$temp=$marks;
				//echo "$temp";
				
	                        pick_questions($temp,$x,$CID);
				 
	                       
                                $te--;
                                //$f1=1;
			}
				
        		else if($te==1)
			{
				if($check)
				{
			                 echo "<script>console.log('Here2');</script>";
				$cnt[$x]=$qu_max-$marks*($no_of_units-1);
				//echo "$cnt[$x]";
				$temp=$cnt[$x];
				//echo "$temp";
				pick_questions($temp,$x,$CID);
				
                                $te--;
                                //$f2=1;
			}
				else{
                    echo "<script>console.log('Here3');</script>";
				$cnt[$x]=$marks;
				$temp=$marks;
				//echo "$temp";
				
				
	                        pick_questions($temp,$x,$CID);
				
			      
	                       
                                $te--;

					}}
		
                       }

$x++;

}
$q=0;
$used=array();

$table.=  "</table></center>";
$table.=  "<br><center><strong>Part 2</strong></center><br><br>";
$x=1;
//printf("%d %d %d %d %d",$t[1],$t[2],$t[3],$t[4],$t[5]);
 $table.= "<center><table border='1' style='border-collapse: collapse;'>";
    $table.="<tr><th>No</th><th>Question</th><th>Marks</th><th>LOD</th><th>CO</th></tr>"; 
while($x<=5){
		//echo "<script>console.log('Inside while');</script>";
        while($t[$x]!=0){
         // echo"<br>"; printf("%d, %d",$t[$x],$x);
            $used=pick_theory_questions($x,$CID,$used);
            echo "<script>console.log('Called');</script>";
	    
            $t[$x]--;
        } 

$x++;

}

$pw="password";
$table1=$table;
$table=mysql_real_escape_string($table);
$_SESSION['paper']=$table;
$_SESSION['l1']=$l1;
$_SESSION['l2']=$l2;
$_SESSION['l3']=$l3;
 echo "<center>L1 Questions : $l1, L2 Questions : $l2, L3 Questions : $l3</center>";
echo $table1;



//$docx = new CreateDocx();
//$docx->embedHTML($table1);

//$docx->createDocxAndDownload('qp');



}

?>

  
 
