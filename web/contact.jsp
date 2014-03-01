<%-- 
    Document   : index
    Created on : Jan 10, 2014, 2:55:00 PM
    Author     : matheus
--%>

<%@page import="CMS.Global"%>
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
	<title>Plymouth Blitz</title>
</head>

<body>
   

	<%@ include file="header.jsp" %>
	<%
      ContactUs contact = dbCon.getContactUsPage();
      
    %>
	<div id="main">
            <div class="contactContainer">
                
                <div class="contactForm">
                    
                    <form>
                        <legend>Contact Us</legend>
                        <ul>
                            <li><label for="subject">Name</label>
                            <br/>
                            <input type="text" name="subject" placeholder="Name"></li>
                            <li><label for="subject">Email</label>
                            <br/>
                            <input  type="text" name="subject" placeholder="Email"></li>
                            <li><label for="subject">Subject:</label>
                            <br/>
                            <input  type="text" name="subject" placeholder="Subject"></li>
                            <li><label for="content">Message</label>
                            <br/>
                                <textarea name="content" type="text"></textarea> </li>
                            <li><button type="submit">Send</button> </li>
                        </ul>
                    </form>
                </div>
                <div class="contactInfo">
                    <ul>
                        <li>
                            <span class="contactTitle">POSTAL ​ADDRESS</span>
                            </br>
                           <%out.print(contact.getPostFirstLine());%>
                           </br>
                            <%out.print(contact.getPostCity());%>
                            </br>
                            <%out.print(contact.getPostPostCode());%> 
                        </li>
                        <li>
                            <span class="contactTitle">PITCH ADDRESS</span>
                            </br>
                            <%out.print(contact.getGameFirstLine());%>
                            </br>
                            <%out.print(contact.getGameCity());%>
                            </br>
                            <%out.print(contact.getGamePostCode());%>
                        </li>
                        <li class="social">
                            
                            <img id="facebook"src="img/socialBG.png">
                            <img id="youTube" src="img/socialBG.png">
                            <img id="twitter" src="img/socialBG.png">
                        </li>
                    </ul>
                </div>
                
            </div>
         
	</div>
      
    

      <%@ include file="footer.jsp" %> 
  
</body>

</html>
