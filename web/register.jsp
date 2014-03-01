<%-- 
    Document   : index
    Created on : Jan 10, 2014, 2:55:00 PM
    Author     : matheus
--%>

<%@page import="CMS.Global"%>
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
        
	 <p id="feedback" >${feedBack}</p>
         <script>
       if($("#feedback").text() === 'Unable to complete registration, please try again'||
               $("#feedback").text() ==='Sorry, email alredy registerd with an existing account'){
              $("#feedback").show();
              $("#feedback").animate({height: "25px" });}
                      
         </script>
         
	<div id="main">
           
            <div class="regContainer">
                
                <form id="registerForm" method="POST" action="Register">
                    
                    <legend>Register</legend>
                   <ul>
                        <li>
                            <label for="firstName">First Name:</label>
                            <br/>
                            <input style="width:160px" type="text" name="firstName" value="${firstName}" placeholder="Andy" required>
                        </li>
                         <li>
                            <label for="surname">Surname:</label>
                            <br/>
                            <input style="width:160px" type="text" name="surname" value="${surname}" placeholder="Dalton" required>
                        </li>
                       
                         <li>
                            <label for="mail">Email:</label>
                            <br/>
                            <input type="email" name="mail" value="${email}" placeholder="yourname@email.com" required>
                        </li>
                        <li>
                            <label for="contactNum">Contact Number:</label>
                            <br/>                            
                            <input style="width:150px" value="${number}" type="text" pattern="^\s*\(?(020[7,8]{1}\)?[ ]?[1-9]{1}[0-9{2}[ ]?[0-9]{4})|(0[1-8]{1}[0-9]{3}\)?[ ]?[1-9]{1}[0-9]{2}[ ]?[0-9]{3})\s*$" name="contactNum" placeholder="07933245634" required>
                        </li>
                        <li>
                            <label for="password">Password:</label>
                            <br/>
                            <input type="password" name="password" placeholder="Password" required>
                        </li>
                        
                         <li>
                            <label for="cPassword">Confirm Password:</label>
                            <br/>
                            <input type="password" name="cPassword" placeholder="Confirm Password" required></li>
                         <li> 
                             
                        <button type="submit">Register</button> 
                        </li>
                   </ul>    
                    
                </form>
                
                
                
                </div>
	</div>
      
      <%@ include file="footer.jsp" %> 
  
</body>

</html>
