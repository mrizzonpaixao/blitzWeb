<%-- 
    Document   : cmsContact
    Created on : Feb 16, 2014, 11:54:18 AM
    Author     : Matheus
--%>

<%@page import="CMS.ContactUs"%>
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
            <li class="currentLi"><a href="#">CMS +</a>            
                <ul >
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
      ContactUs contact = dbCon.getContactUsPage();
      
    %>
    <div id="main">
        <div class="contactInfo editContactInfo">
                    <ul>
                        <li>
                            <span class="contactTitle">POSTAL ​ADDRESS</span>
                           
                            <p id="firstLinePost" contenteditable="true"><%out.print(contact.getPostFirstLine());%></p>                           
                            <p id="cityPost" contenteditable="true"><%out.print(contact.getPostCity());%></p>                           
                            <p id="postcodePost" contenteditable="true"><%out.print(contact.getPostPostCode());%></p>
                        </li>
                        <li>
                            <span class="contactTitle">PITCH ADDRESS</span>
                            <p id="firstlinePitch" contenteditable="true"><%out.print(contact.getGameFirstLine());%></p>
                            <p id="cityPitch" contenteditable="true"><%out.print(contact.getGameCity());%></p>
                            <p id="postcodePitch" contenteditable="true"><%out.print(contact.getGamePostCode());%></p>
                        </li>
                        <li class="social">
                            
                            <img id="facebook"src="img/socialBG.png">
                            <img id="youTube" src="img/socialBG.png">
                            <img id="twitter" src="img/socialBG.png">
                        </li>
                    </ul>
                </div>
                        
<script>
      $(document).ready(function()
{  
    $( ".editContactInfo p" ).focus(function() {
        
      $(this).css({"background":"#ffffcc","color":"#000"});
    });

    $( ".editContactInfo p" ).focusout(function() {
         $(this).css({"background":"none","color":"orange"});
         updateContent();
    });   
    });
    
function updateContent(){
    
var firstLinepost = $('#firstLinePost').html();
var citypost = $('#cityPost').html();
var postcodepost = $('#postcodePost').html();
var firstLinepitch = $('#firstlinePitch').html();
var citypitch = $('#cityPitch').html();
var postcodepitch = $('#postcodePitch').html();




var dataStream ='opId=1' + '&firstLinepost='+ firstLinepost +'&cityPost='+ 
        citypost + '&postcodepost='+ postcodepost + '&firstLinepitch='+ firstLinepitch
        + '&citypitch='+ citypitch + '&postcodepitch='+ postcodepitch; 

$.ajax({
type: "POST",
url: "EditContact",
data: dataStream,
cache: false,
processData: false,
success: function(msg)
{
 
 
 
}
});
}
</script>        
                        </div>
    </body>
</html>
