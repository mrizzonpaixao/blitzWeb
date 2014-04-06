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
            <li><a href="#">CMS +</a>            
                <ul >
                    <li><a href="cmsHome.jsp">Home page</a></li>
                    <li><a href="cmsAbout.jsp">About page</a></li>
                    <li><a href="cmsContact.jsp">Contact page</a></li>
                    <li><a href="#">Global</a></li>
                </ul>
            </li> 
            <li><a href="membersList.jsp">MEMBERS</a></li>
            <li><a href="#">EQUIPMENT</a>
                          
        </ul> 
        </div>
        </header>
        <div class="main">
           
        </div>
       
    </body>
</html>
