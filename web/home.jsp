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
        <title>JSP Page</title>
    </head>
    <body>
        <%if(session.getAttribute("firstTime") == "true"){%>
         <h1>Your registration was success!</h1>
       <%}%>
       
    </body>
</html>
