<%-- 
    Document   : index
    Created on : Jan 10, 2014, 2:55:00 PM
    Author     : matheus
--%>

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

	<header>
	<div class="navContainer">
	<img class="logo" src="img/plymouthblitz_logo.png"/>
		<nav>
			<ul>
                                <li class="inactive"><a href="index.jsp">HOME</a><div class="navBG" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
				<li class="active"><a href="about.jsp">ABOUT US</a> <div class="navBG active" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
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
            <div id="about">
            <img id="aboutImg" src="img/team.jpg"/>
            <div id="aboutContent">
                <p>              
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut 
                labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
                laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
                voluptate velit esse cillum dolore eu fugiat nulla pariatur.
        </p>
        </div>
            </div>
	</div>
      
    

    <div class="footer"><div class="footEmail"><img src="img/mail.png"/>plymouthblitz@team.com</div>  <div class="copyright">© Plymouth Blitz. 2014</div></div>
  
</body>

</html>