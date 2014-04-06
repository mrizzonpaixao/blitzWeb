<%-- 
    Document   : index
    Created on : Jan 10, 2014, 2:55:00 PM
    Author     : matheus
--%>

<%@page import="CMS.Global"%>
<%@page import="CMS.AboutUs"%>
<%@page import="DBCon.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script src='jQuery.js'></script>
        <script src='script.js'></script>
      	<link href="style.css" rel="stylesheet" type="text/css">
        <link href="backendCss.css" rel="stylesheet" type="text/css">
	<title>Plymouth Blitz</title>
</head>

 <body>
        <% if(session.getAttribute("memberId") == null){
         response.sendRedirect(response.encodeRedirectURL("index.jsp"));
         } %>
        <header>
             <div class="logReg">
                <%if(session.getAttribute("memberId") == null){%>
                <a class="log btn">Login</a> <a class="reg btn" href="register.jsp">Register</a>
                <%}else{%>
                <a class="btn" href="profile.jsp">Profile</a> <a class="logOut btn" onclick="window.location = 'logout';">Logout</a>
                <%}%>
            </div>
            <div class="navContainer">
        <img id="logo" src="img/plymouthblitz_logo.png">
         <ul>
            <li><a href="home.jsp">DASHBOARD</a></li>
            <li class="currentLi" ><a href="#">CMS +</a>            
                <ul>
                    <li><a href="cmsHome.jsp">Home page</a></li>
                    <li><a href="cmsAbout.jsp">About page</a></li>
                    <li><a href="cmsContact.jsp">Contact page</a></li>
                    <li><a href="#">Global</a></li>
                </ul>
            </li> 
            <li><a href="#">MEMBERS</a></li>
         
             <li><a href="#">EQUIPMENT</a>
              </li>
            
        </ul> 
        </div>
        </header>

<% 
DbCon dbCon = new DbCon();    
AboutUs about =  dbCon.getAboutUsPage();
%>
	<div id="main">
            
             <div id="aboutImgUploader" >
                <img class="closeIcon" src="img/closeIcon.png">
                
                <div id="uplodArea">
                    <div id="uploader" ondrop="drop(event)" ondragover="allowDrop(event)">
                        <img class="uploadImg" src="img/uploadGray.png">
                        <p class="uploadfeedback">DROP FILE HERE</p>
                    </div>
                    <input type="file" id="file" name="files[]" multiple onchange="startRead()" accept="image/*">
                    <div id="thumbContainer">
                        
                    </div>
                </div>
            </div>
            <div id="about">
               
                <img class="slideEditIcon aboutImgEdit" src="img/bigEditIcon.png"/>
                <img id="aboutImg" src="img/<%out.print(about.getImgSrc());%>"/>
            <div id="aboutContent">
                <h2 style="color:orange;">What we are all about!</h2>
                <p class="aboutContent" contenteditable="true">              
                <%out.print( about.getAboutText());%>
                </p>
                <script>$("#aboutContent").css({ right: "0px" });</script>
        </div>
            </div>
	</div>
<script>
$(document).ready(function()
{  
    $( ".aboutContent" ).focus(function() {
        
      $(this).css({"background":"#ffffcc","color":"#000"});
    });

    $( ".aboutContent" ).focusout(function() {
         $(this).css({"background":"none","color":"#FFF"});
         updateContent();
    });
    
    $("#about").hover(function () {

         $(".slideEditIcon").toggle();

    }); 
    
    $(".closeIcon").click(function () {
         $("#aboutImgUploader").hide();
         cancel();
    }); 
    
     $(".aboutImgEdit").click(function () {
         $("#aboutImgUploader").show();
    }); 
    
  });   
  
function updateContent(){
    
var aboutContent = $('.aboutContent').html();  

var dataStream ='opId=2' +'&aboutCon= '+ aboutContent; 
$.ajax({
type: "POST",
url: "EditAbout",
data: dataStream,
cache: false,
processData: false,
success: function(msg)
{
 cancel();
  
  $("#aboutImg").attr("src", picFile.result);       
 
}
});
    
}  
function cancel(){
 $(".uploadImgThumb").remove();
 $("#slideAdd").remove();
 $("#cancelSlideAdd").remove();
 
  $('#uploader').css({"border-color":"#222222"});
  $('.uploadfeedback').html('DROP FILE HERE');
   $(".uploadImg").attr("src","img/uploadGray.png");
    
}
 
function upload(){
var d = new Date();
var imgURL = encodeURIComponent(picFile.result);
var dataStream = 'imgData='+ imgURL +'&opId=1' +'&date= '+ d.getTime()+'&imgType='+ imgFileType; 
$.ajax({
type: "POST",
url: "EditAbout",
data: dataStream,
cache: false,
processData: false,
success: function(msg)
{
 cancel();
  
  $("#aboutImg").attr("src", picFile.result);       
 
}
});
}

    function startRead(evt) {
    var file = document.getElementById('file').files[0];
    
    checkFile(file);
 
    }

function checkFile(file){
    
    if(file.type.match("image.*")){
      sendFile(file);  
      var temp = file.type;
      imgFileType = temp.replace("image/","");
      
   }else{
   $('#uploader').css({"border-color":"#FF5C5C"});
   $('.uploadfeedback').html('FILE TYPE NOT PERMITED');
   $(".uploadImg").attr("src","img/uploadRed.png");
   }
}

function allowDrop(ev)
{
ev.preventDefault();
}

function drop(evt){
evt.preventDefault();
var file =evt.dataTransfer.files[0];
 
checkFile(file);
 
}

function sendFile(file){
    
var reader = new FileReader();     
 reader.addEventListener("load",function(event){
 picFile = event.target;
 
 $(".uploadImgThumb").remove();
 $("#slideAdd").remove();

$('#thumbContainer').prepend("<img class='uploadImgThumb' src='" + picFile.result + "'" +
           "title='" + picFile.name + "'/>  <button onclick='upload()' id='slideAdd'>Upload</button> <button onclick='cancel()' id='cancelSlideAdd'>Cancel</button>");
  
   var img = new Image();
    img.src = picFile.result;
    var width = img.width,
     height = img.height; 
   var ratio = width/height;
   if(ratio !== 2.25){
   $('#uploader').css({"border-color":"#d4d43d"});
  $('.uploadfeedback').html('IMAGE SIZE MAY CAUSE DISTORTION');
   $(".uploadImg").attr("src","img/uploadYel.png");
   }else{   
  $('#uploader').css({"border-color":"#5C9D5C"});
  $('.uploadfeedback').html('CORRECT FILE TYPE');
   $(".uploadImg").attr("src","img/uploadGreen.png");
   }      
       
                
});
    
 reader.readAsDataURL(file);  


}

    
    
               
</script>     
    

     
</body>

</html>
