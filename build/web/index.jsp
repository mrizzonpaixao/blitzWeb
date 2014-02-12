<%-- 
    Document   : index
    Created on : Jan 10, 2014, 2:55:00 PM
    Author     : matheus
--%>

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
    <% 
     DbCon dbCon = new DbCon();
     ArrayList<NewsArticle> News;
     ArrayList<Fixture> Fixtures;
     ArrayList<Slide> SlideShow;
     
     Fixtures = dbCon.getAllFixtures();
     News = dbCon.getAllNews();
     SlideShow = dbCon.getAllSlides();
     %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script src='jQuery.js'></script>
        <script src='script.js'></script>
	<link href="style.css" rel="stylesheet" type="text/css">
	<title>Plymouth Blitz</title>
</head>

<body>

	<header>
	<div class="navContainer">
	<img class="logo" src="img/plymouthblitz_logo.png"/>
		<nav>
			<ul>
                                <li class="active"><a href="index.jsp">HOME</a><div class="navBG active" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
				<li class="inactive"><a href="about.jsp">ABOUT US</a> <div class="navBG" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
				<li class="inactive"><a href="team.jsp">THE TEAM</a> <div class="navBG" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
				<li class="inactive"><a href="contact.jsp">CONTACT US</a> <div class="navBG" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
			</ul>
		</nav>
		</div>
            <div class="logReg"> <a class="log btn">Login</a> <a class="reg btn" href="register.jsp">Register</a> </div>
            <div class="bubble">
                <img src="img/pointLog.png" />
                <div class="bubbleContent">                
                <form>
                   <ul>
                        <li>
                            <label for="usermail">Email:</label>
                            <br/>
                            <input type="email" name="usermail" placeholder="yourname@email.com">
                        </li>
                        <li>
                            <label for="password">Password:</label>
                            <br/>
                            <input type="password" name="password" placeholder="Password"></li>
                         <li>
                        <button type="submit">Login</button> 
                        </li>
                   </ul>    
                    
                </form>
                </div>
            </div>
	</header>
	
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
	<img src="img/newsbg.png"/>
	<div class="newsCont">
        <%
          for (NewsArticle n : News){                
        %>
    <article>
    <h3><% out.print( n.getTitle()); %></h3>                       
    <p class="newsInfo"><b>Matheus Paixao</b> - <% out.print( n.getDateStamp()); %></p>
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
      
    

    <div class="footer"><div class="footEmail"><img src="img/mail.png"/>plymouthblitz@team.com</div>  <div class="copyright">© Plymouth Blitz. 2014</div></div>
  
</body>

</html>
