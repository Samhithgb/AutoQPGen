$(document).ready(function () {

$("#sub").hide();

var staffid,DeptID,HodId,fname,mname,lname,derror,p1,p2,pass;
$("#sid").blur(function(){

var sem=$("#sid").val();
console.log(sem);
if(sem.length>6 || sem.length<6){
$("#sid").css('color','red');
$("#sid").html('<font color="#cc0000">Please enter valid Email address</font>');
staffid=1;
check();
}

else{
staffid=0;
$("#sid").css('color','green');
check();

}
}); 

$("#fn").blur(function(){
console.log('there');
var cid=$("#fn").val();
console.log(cid);
if(!isAlphaNumeric(cid)){
$("#fn").css('color','red');$("err").val(0);
fname=1;
check();
}

else{

$("#fn").css('color','green');
fname=0;
check();

}
}); 


$("#mn").blur(function(){
console.log('there');
var cid=$("#mn").val();
console.log(cid);
if(!isAlphaNumeric(cid)){
$("#mn").css('color','red');$("err").val(0);
mname=1;
check();
}

else{

$("#mn").css('color','green');
mname=0;
check();

}
});

$("#ln").blur(function(){
console.log('there');
var cid=$("#ln").val();
console.log(cid);
if(!isAlphaNumeric(cid)){
$("#ln").css('color','red');$("err").val(0);
lname=1;
check();
}

else{

$("#ln").css('color','green');
lname=0;
check();

}
});

$("#desg").blur(function(){
console.log('there');
var cid=$("#desg").val();
console.log(cid);
if(!isAlphaNumeric(cid)){
$("#desg").css('color','red');$("err").val(0);
derror=1;
check();
}

else{
$("#desg").css('color','green');
derror=0;
check();

}
});
 
$("#did").blur(function(){
var sem=$("#did").val();
console.log(sem);
if(sem.length!=7){
$("#did").css('color','red');
$("#did").html('<font color="#cc0000">Please enter valid Email address</font>');

DeptID=1;
check();
}

else{


DeptID=0;
$("#did").css('color','green');
check();

}
});

$("#hid").blur(function(){
var sem=$("#did").val();
console.log(sem);
if(sem.length!=6){
$("#did").css('color','red');
$("#did").html('<font color="#cc0000">Please enter valid Email address</font>');

HodId=1;
check();
}

else{
HodId=0;
check();
$("#did").css('color','green');
}
});

$("#p1").blur(function(){
console.log('there');
var cid=$("#p1").val();
var pass=cid;

console.log(cid);
if(!isAlphaNumeric(cid)){
$("#p1").css('color','red');$("err").val(0);
p1=1;
check();
}

else{
$("#p1").css('color','green');
p1=0;
check();

}
});

$("#p2").blur(function(){
console.log('there');
var cid=$("#p2").val();
console.log(cid);
if(!isAlphaNumeric(cid) && pass!=cid){
$("#p2").css('color','red');$("err").val(0);
p2=1;
check();
}

else{
$("#p2").css('color','green');
p2=0;
check();

}
});


function isAlphaNumeric(str) {
	console.log("Alphanumeric Testing..");
	return /^[a-zA-Z0-9 ]+$/.test(str);
}

function check(){
	if(staffid==1 || DeptID==1 || HodId==1 || fname==1 || mname==1 || lname==1 || derror==1|| p1==1||p2==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}
	
}
});






