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
	<title>Plymouth Blitz</title>
</head>

<body>
    

<%@ include file="header.jsp" %>
<% 
AboutUs about =  dbCon.getAboutUsPage();
%>
	<div id="main">
            <div id="about">
            <img id="aboutImg" src="img/<%out.print(about.getImgSrc());%>"/>
            <div id="aboutContent">
                <p>              
                <%out.print( about.getAboutText());%>
                </p>
        </div>
            </div>
	</div>
      
    

     <%@ include file="footer.jsp" %> 
  
</body>

</html>
