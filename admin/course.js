$(document).ready(function () {

$("#err").hide();
$("#sub").hide();

var semerror=1,nocerror=1,ciderror=1,typeerror=1,depterror=1;
$("#semester").blur(function(){

var sem=$("#semester").val();
console.log(sem);
if(sem>8 || sem<1){
$("#semester").css('color','red');
$("#semester").html('<font color="#cc0000">Please enter valid Email address</font>');
semerror=1;
$("#sub").hide();
}

else{
if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

semerror=0;
$("#semester").css('color','green');
}
}); 

$("#cid").blur(function(){

var cid=$("#cid").val();
console.log(cid);
if(cid.length >7 || cid.length<6 || !isAlphaNumeric(cid)){
$("#cid").css('color','red');$("err").val(0);
$("#sub").hide();
ciderror=1;
}

else{
if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

$("#cid").css('color','green');
ciderror=0;
}
}); 



$("#noc").blur(function(){

var cid=$("#noc").val();
console.log(cid);
if(cid>5 || cid < 1){
nocerror=1;
$("#sub").hide();
$("err").val(0);
$("#noc").css('color','red');
}

else{
nocerror=0;
if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

$("#noc").css('color','green');
}
}); 


$("#type").blur(function(){

var cid=$("#type").val();
console.log(cid);
if(!(cid.toLowerCase()==='mandatory'|| cid.toLowerCase()=='elective')){
typeerror=1;
$("#sub").hide();
$("#type").css('color','red');
$("err").val(0);
}

else{
typeerror=0;
$("#type").css('color','green');
if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}



}
}); 



$("#dept").blur(function(){
var cid=$("#dept").val();
console.log(cid);
if((cid.length!=7)){
depterror=1;
$("#sub").hide();
console.log("Error!")
$("#dept").css('color','red');
}

else{
depterror=0;
$("#dept").css('color','green');

if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

}}); 


function isAlphaNumeric(str) {
	console.log("Alphanumeric Testing..");
	return /^[a-zA-Z0-9 ]+$/.test(str);
}





});



