$(document).ready(function () {
$("#sub").hide();
var siderror,coerror,markerror,questerror,descerror,unoerror,loderror,ciderror;
$("#SID").blur(function(){

var sem=$("#SID").val();
if(sem.length<=5){
$("#SID").css('color','red');
siderror=1;
$("#sub").hide();
}

else{
siderror=0;
$("#SID").css('color','green');
if(siderror==1 || coerror==1 || markerror==1|| questerror==1||descerror==1||unoerror==1||loderror==1||ciderror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

}
}); 

$("#marks").blur(function(){

var cid=$("#marks").val();
console.log(cid);
if(cid>16||cid<0){
$("#marks").css('color','red');$("err").val(0);
markerror=1;
$("#sub").hide();
}

else{

$("#marks").css('color','green');
markerror=0;
if(siderror==1 || coerror==1 || markerror==1|| questerror==1||descerror==1||unoerror==1||loderror==1||ciderror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

}
}); 



$("#co").blur(function(){

var cid=$("#co").val();
console.log(cid);
if(cid>5 || cid < 1){
coerror=1;
$("#sub").hide();
$("err").val(0);
$("#co").css('color','red');
}

else{
coerror=0;
$("#co").css('color','green');
if(siderror==1 || coerror==1 || markerror==1|| questerror==1||descerror==1||unoerror==1||loderror==1||ciderror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

}
}); 


$("#quest").blur(function(){

var cid=$("#quest").val();
console.log(cid);
questerror=0;
$("#quest").css('color','green');

}); 



$("#desc").blur(function(){
var cid=$("#desc").val();
descerror=0;
$("#desc").css('color','green');
});



$("#lod").blur(function(){

var cid=$("#lod").val();
console.log(cid);
if(cid>4 || cid < 1){
loderror=1;
$("#sub").hide();

$("#lod").css('color','red');
}

else{
loderror=0;
$("#lod").css('color','green');
if(siderror==1 || coerror==1 || markerror==1|| questerror==1||descerror==1||unoerror==1||loderror==1||ciderror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

}
}); 

$("#uno").blur(function(){

var cid=$("#uno").val();
console.log(cid);
if(cid>5 || cid < 1){
unoerror=1;
$("err").val(0);
$("#sub").hide();
$("#uno").css('color','red');
}

else{
unoerror=0;
$("#uno").css('color','green');
if(siderror==1 || coerror==1 || markerror==1|| questerror==1||descerror==1||unoerror==1||loderror==1||ciderror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

}
}); 



$("#cid").blur(function(){

var cid=$("#cid").val();
console.log(cid);
if(cid.length >7 || cid.length<6 || !isAlphaNumeric(cid)){
$("#cid").css('color','red');$("err").val(0);
ciderror=1;

$("#sub").hide();
}

else{

$("#cid").css('color','green');
ciderror=0;
//var siderror,coerror,markerror,questerror,descerror,unoerror,loderror,ciderror;
if(siderror==1 || coerror==1 || markerror==1|| questerror==1||descerror==1||unoerror==1||loderror==1||ciderror==1){
$("#sub").hide();
console.log("Here")
}
else{
$("#sub").show();
}

}}); 















/*

*/

function isAlphaNumeric(str) {
	console.log("Alphanumeric Testing..");
	return /^[a-zA-Z0-9 ]+$/.test(str);
}





});



