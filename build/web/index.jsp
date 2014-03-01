<%-- 
    Document   : index
    Created on : Jan 10, 2014, 2:55:00 PM
    Author     : matheus
--%>

<%@page import="CMS.Global"%>
<%@page import="CMS.Slide"%>
<%@page import="CMS.fixtureList"%>
<%@page import="CMS.fixtureList"%>
<%@page import="CMS.Fixture"%>
<%@page import="CMS.NewsArticle"%>
<%@page import="java.util.ArrayList"%>
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
     ArrayList<NewsArticle> News;
     ArrayList<Fixture> Fixtures;
     ArrayList<Slide> SlideShow;
    
     
     Fixtures = dbCon.getAllFixtures();
     News = dbCon.getAllNews();
     SlideShow = dbCon.getAllSlides();
     %>
	
	<div id="main">
            <div class="slideshow">
                <%
                for (Slide s : SlideShow){
                %>
                <div class="slide"><img  src="img/<%out.print(s.getImgSrc());%>"/></div>
                <% } %>
           </div>
	<div class="content">
	<div id="news">
	<h2>News</h2>
	<div class="newsCont">
        <%
          for (NewsArticle n : News){                
        %>
    <article>
    <h3><% out.print( n.getTitle()); %></h3>                       
    <p class="newsInfo"><b><% out.print(n.getMemberName()); %></b> - <% out.print( n.getDateStamp()); %></p>
    <p class="newsContent"><% out.print( n.getContent()); %></p>
    </article> 
	<%
        }
        %>
	</div>
	</div>
	<div id="schedule">
	<h2>Schedule & Results</h2>
		
	<table>
 <%for (Fixture f : Fixtures){ %>
  <tr class="row">
    <td class="date"><% out.print( f.getGameDate()); %></td>
    <td class="score"><% out.print( f.getBlitz_score()); %></td>
	<td class="score"><% out.print( f.getResult()); %></td>
	<td class="score"><% out.print( f.getOp_score()); %></td>
    <td class="team2"><% out.print( f.getTeam()); %></td>
  </tr>
  <tr class="spacer"></tr>
  <%}%>
</table>
	</div>
	</div>
	</div>
    

  <%@ include file="footer.jsp" %> 
  
</body>

</html>
