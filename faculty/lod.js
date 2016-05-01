$(document).ready(function () {


$("#sub").hide();

var semerror=1,nocerror=1,ciderror=1,typeerror=1,depterror=1,error=1;
$("#lev1").blur(function(){

var sem=$("#lev1").val();
console.log(sem);
if(sem<=0){
$("#lev1").css('color','red');
semerror=1;
$("#sub").hide();
}
else{
semerror=0;
$("#lev1").css('color','green');
if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1||error==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}


}
}); 

$("#lev2").blur(function(){

var cid=$("#lev2").val();
console.log(cid);
if(cid<=0){
$("#lev2").css('color','red');$("err").val(0);
$("#sub").hide();
ciderror=1;
}

else{
	$("#lev2").css('color','green');
ciderror=0;
if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1||error==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}


}
}); 



$("#lev3").blur(function(){

var cid=$("#lev3").val();
console.log(cid);
if(cid<=0){
nocerror=1;
$("#sub").hide();
$("err").val(0);
$("#lev3").css('color','red');
}

else{
nocerror=0;
$("#lev3").css('color','green');
if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1||error==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}


}
}); 


$("#lev11").blur(function(){

var cid=$("#lev11").val();
console.log(cid);
if(cid<=0){
typeerror=1;
$("#sub").hide();
$("#lev11").css('color','red');
$("err").val(0);
}

else{
typeerror=0;
$("#lev11").css('color','green');
if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1||error==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}



}
}); 



$("#lev22").blur(function(){
var cid=$("#lev22").val();
console.log(cid);
if((cid<=0)){
depterror=1;
$("#sub").hide();
console.log("Error!")
$("#lev22").css('color','red');
}

else{
depterror=0;
$("#lev22").css('color','green');

if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1||error==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

}}); 


$("#lev33").blur(function(){
var cid=$("#lev33").val();
console.log(cid);
if((cid<=0)){
error=1;
$("#sub").hide();
console.log("Error!")
$("#lev33").css('color','red');
}

else{
error=0;
$("#lev33").css('color','green');

if(typeerror==1 || nocerror==1 || ciderror==1|| semerror==1||depterror==1||error==1){
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



