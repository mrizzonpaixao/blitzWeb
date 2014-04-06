<%-- 
    Document   : home
    Created on : Feb 12, 2014, 11:12:04 AM
    Author     : Matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='jQuery.js'></script>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="backendCss.css" rel="stylesheet" type="text/css">
        <title>Plymouth Blitz</title>
    </head>
    <body>
        <% if(session.getAttribute("memberId") == null){
         response.sendRedirect(response.encodeRedirectURL("index.jsp"));
         } %>
        <header>
            <p class="welcome">Welcome, <%out.print(session.getAttribute("email"));%> </p>
             <div class="logReg">
                 
                <%if(session.getAttribute("memberId") == null){%>
                <a class="log btn">Login</a> <a class="reg btn" href="register.jsp">Register</a>
                <%}else{%>
                <a class="btn" href="index.jsp">Home</a> <a class="logOut btn" onclick="window.location = 'logout';">Logout</a>
                <%}%>
            </div>
            <div class="navContainer">
        <img id="logo" src="img/plymouthblitz_logo.png">
        
        <ul>
        
            <li class="currentLi"><a href="home.jsp">NOTICES</a></li>
        <% if(session.getAttribute("role") == null){
          response.sendRedirect(response.encodeRedirectURL("index.jsp"));
         }else{
            
            String role = session.getAttribute("role").toString();
                   
           if(role.equals("1")){%>
               <li> <a href="mail.jsp">MAIL</a></li>
           <%}else if(role.equals("2")){%>
               <li><a href="mail.jsp">MAIL</a></li>
           <%} else if(role.equals("3")){%>
           <li><a href="mail.jsp">MAIL</a></li>
         <li> <a href="profile.jsp">PROFILE</a></li>
          <li> <a href="manage.jsp">MANAGE</a></li>
           <%} else if(role.equals("4")){%>
          <li> <a href="cms.jsp">MAIL</a></li>
          <li> <a href="profile.jsp">PROFILE</a></li>
           <%} } %>
         </ul>
        </div>
        </header>
        <div id="main" style="margin-top: 6px;
min-height: 78%; background:#EBEBEB; ">
          
            <div class="postContent">
            <textarea class="dashTextarea"></textarea>
            <a class="btn postBtn" onclick="uploadPost();">Post</a>
            </div>
         <script>
$(document).ready(function()
{  
    
  $.ajax({
    url:'noticeBoardPost',
    type:'GET',
    dataType:'json',
    error: function(data) {
        alert(2);
    },
    success: function(data) {

    var side = 0;
    
    for (var i=0; i < data.count; i++)
    { 
     if(side === 0){side++;}else{side=0;} 
     
     if(side===1){
    
     $('.postContainer').prepend("<div class='rightdashPost post"+data.posts[i].postId+"'></div>"); 
         
    $('.post'+data.posts[i].postId).prepend("<div class='rightpostContent'><img class='rightspeechPic'"+
                 " src='img/"+data.posts[i].imgSrc+"'/><br><a class='postNameLeft'>"+data.posts[i].firstName+" "+data.posts[i].surname+"</a></div>");
         
    $('.post'+data.posts[i].postId).append("<div class='rightspeechBubble'>"
                 +"<img class='rightspeechPoint' src='img/speechBubbleRight.png'/>"
                 +"<div class='speechBubbleContent content"+data.posts[i].postId+"'>"+data.posts[i].PostContent+" <p>"+data.posts[i].PostDate+"</p></div> </div>");
         
     }else{
         
        $('.postContainer').prepend("<div class='leftdashPost post"+data.posts[i].postId+"'></div>"); 
         
    $('.post'+data.posts[i].postId).prepend("<div class='leftpostContent'><img class='leftspeechPic'"+
                 " src='img/"+data.posts[i].imgSrc+"'/><br><a class='postNameLeft'>"+data.posts[i].firstName+" "+data.posts[i].surname+"</a></div>");
         
    $('.post'+data.posts[i].postId).append("<div class='leftspeechBubble'>"
                 +"<img class='leftspeechPoint' src='img/speechBubble.png'/>"
                 +"<div class='speechBubbleContent content"+data.posts[i].postId+"'>"+data.posts[i].PostContent+" <p>"+data.posts[i].PostDate+"</p> </div> </div>"); 
         
     }
     if(data.posts[i].memberId === data.memberId){
     $(".content"+data.posts[i].postId).append("<img class='binIcon "+
             data.posts[i].postId+"' src='img/socialBG.png;'/>");
     }
    }
             
    }

});
   
    
    
$( ".dashTextarea" ).focus(function() {
  $('.dashTextarea').animate({'height':'90px'});
   
});

$( ".dashTextarea" ).focusout(function() {
  $('.dashTextarea').animate({'height':'30px'});
   
});
});

function uploadPost(){
  var post = $( ".dashTextarea" ).val();
  
  if(post !== ""){
  
  $( ".dashTextarea" ).val('');
  var readyPost = nl2br (post, true);  
  
  var sideUpdate = 0;
  
 $.ajax({
    type: "POST",
    url: "noticeBoardPost",
    data: 'data='+ readyPost ,
    cache: false,
    processData: false,
    success: function(data)
        {
          
        
    if(sideUpdate===1){
    sideUpdate=0;
     $('.postContainer').prepend("<div class='rightdashPost post"+data.postId+"'></div>"); 
         
    $('.post'+data.postId).prepend("<div class='rightpostContent'><img class='rightspeechPic'"+
                 " src='img/"+data.imgSrc+"'/><br><a class='postNameLeft'>"+data.firstName+" "+data.surname+"</a></div>");
         
    $('.post'+data.postId).append("<div class='rightspeechBubble'>"
                 +"<img class='rightspeechPoint' src='img/speechBubbleRight.png'/>"
                 +"<div class='speechBubbleContent content"+data.postId+"'>"+data.PostContent+" <p>"+data.PostDate+"</p></div> </div>");
         
     }else{
         sideUpdate++;
        $('.postContainer').prepend("<div class='leftdashPost post"+data.postId+"'></div>"); 
         
    $('.post'+data.postId).prepend("<div class='leftpostContent'><img class='leftspeechPic'"+
                 " src='img/"+data.imgSrc+"'/><br><a class='postNameLeft'>"+data.firstName+" "+data.surname+"</a></div>");
         
    $('.post'+data.posts[i].postId).append("<div class='leftspeechBubble'>"
                 +"<img class='leftspeechPoint' src='img/speechBubble.png'/>"
                 +"<div class='speechBubbleContent content"+data.postId+"'>"+data.PostContent+" <p>"+data.PostDate+"</p> </div> </div>"); 
         
     }
     if(data.postMemberId === data.memberId){
     $(".content"+data.postId).append("<img class='binIcon "+
             data.postId+"' src='img/socialBG.png;'/>");
     }
        }

    }); }
    
    
    
}

function nl2br (str, is_xhtml) {   
    var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';    
    return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ breakTag +'$2');
}
            </script>
            
            
            
            <div class="postContainer">
          
                
        </div>
       </div>
    </body>
</html>
