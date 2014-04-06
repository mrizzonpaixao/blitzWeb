<%-- 
    Document   : header
    Created on : Feb 13, 2014, 1:44:05 PM
    Author     : Matheus
--%>

<%@page import="DBCon.DbCon"%>
<%@page import="CMS.Global"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
 DbCon dbCon = new DbCon();
 Global global = dbCon.getGlobalElements();
%>
	<header>
             <p class="welcome">Welcome, <%out.print(session.getAttribute("email"));%> </p>
	<div class="navContainer">
	<img class="logo" src="img/<%out.print(global.getLogoSrc());%>"/>
		<nav>
			<ul>
                                <li class="active"><a href="index.jsp">HOME</a><div class="navBG active" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
				<li class="inactive"><a href="about.jsp">ABOUT US</a> <div class="navBG" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
				<li class="inactive"><a href="team.jsp">THE TEAM</a> <div class="navBG" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
				<li class="inactive"><a href="contact.jsp">CONTACT US</a> <div class="navBG" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
			</ul>
                    </nav>
		</div>
            <div class="logReg">
                <%if(session.getAttribute("memberId") == null){%>
                <a class="log btn">Login</a> <a class="reg btn" href="register.jsp">Register</a>
                <%}else{%>
                <a class="btn" href="home.jsp">Dashboard</a> <a class="logOut btn" onclick="window.location = 'logout';">Logout</a>
                <%}%>
            </div>
            <div class="bubble">
                <img src="img/pointLog.png" />
                <div class="bubbleContent">                
                <form  method="POST" action="Login">
                    <p id="loginFeedback">${error}</p>
                    <script>
                         if($("#loginFeedback").text() ==="Incorrect email or password")
                         {
                            $(".bubble").show();   
                         }
                        
                    </script>
                   
                   <ul>
                        <li>
                            <label for="usermail">Email:</label>
                            <br/>
                            <input type="email" value="${email}" name="usermail" placeholder="yourname@email.com">
                        </li>
                        <li>
                            <label for="password">Password:</label>
                            <br/>
                            <input type="password" value="${psw}" name="password" placeholder="Password"></li>
                         <li>
                        <button type="submit">Login</button> 
                        </li>
                   </ul>    
                    
                </form>
                </div>
            </div>
	</header>
