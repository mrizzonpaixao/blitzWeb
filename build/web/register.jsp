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
				<li class="inactive"><a href="about.jsp">ABOUT US</a> <div class="navBG " ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
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
            <div class="regContainer">
                
                <form id="registerForm" method="POST" action="Register">
                    
                    <legend>Register</legend>
                   <ul>
                        <li>
                            <label for="firstName">First Name:</label>
                            <br/>
                            <input type="text" name="firstName" placeholder="Andy" required>
                        </li>
                         <li>
                            <label for="surname">Surname:</label>
                            <br/>
                            <input type="text" name="surname" placeholder="Dalton" required>
                        </li>
                        <li>
                         <label for="role">Role:</label>
                         <br/>
                        <select>
                        <option value="">Please Select one</option>
                        <option value="volvo">Coach</option>
                        <option value="saab">Recruit</option>
                        
                       </select>
                        
                        </li>
                         <li>
                            <label for="mail">Email:</label>
                            <br/>
                            <input type="email" name="mail" placeholder="yourname@email.com" required>
                        </li>
                        <li>
                            <label for="contactNum">Contact Number:</label>
                            <br/>                            
                            <input type="text" pattern="^\s*\(?(020[7,8]{1}\)?[ ]?[1-9]{1}[0-9{2}[ ]?[0-9]{4})|(0[1-8]{1}[0-9]{3}\)?[ ]?[1-9]{1}[0-9]{2}[ ]?[0-9]{3})\s*$" name="contactNum" placeholder="07933245634" required>
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
      
    

    <div class="footer"><div class="footEmail"><img src="img/mail.png"/>plymouthblitz@team.com</div>  <div class="copyright">© Plymouth Blitz. 2014</div></div>
  
</body>

</html>
