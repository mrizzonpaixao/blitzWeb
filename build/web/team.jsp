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
				<li class="active"><a href="team.jsp">THE TEAM</a> <div class="navBG active" ><img class="bgarrow" src="img/bgarrow.png"/></div></li>
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
            <div class="teamListContainer">
            
            <ul class="coachesList">
                <h2>Coaches</h2>
                <li>
                    <div class="shadow">
                        <a href="#">
                            <img src="img/noPhoto.jpg"/>
                        </a>
                    </div>
                    <div class="coachName">
                        <p>Matheus Paixao</p>                           
                        <p class="pos">Linebacker Coach</p>
                    </div>
                </li>
                <li>
                    <div class="shadow">
                        <a href="#">
                            <img src="img/noPhoto.jpg"/>
                        </a>
                    </div>
                    <div class="coachName">
                        <p>Matheus Paixao</p>                           
                        <p class="pos">Linebacker Coach</p>
                    </div>
                </li>
                <li>
                    <div class="shadow">
                        <a href="#">
                            <img src="img/noPhoto.jpg"/>
                        </a>
                    </div>
                    <div class="coachName">
                        <p>Matheus Paixao</p>                           
                        <p class="pos">Linebacker Coach</p>
                    </div>
                </li>
                <li>
                    <div class="shadow">
                        <a href="#">
                            <img src="img/noPhoto.jpg"/>
                        </a>
                    </div>
                    <div class="coachName">
                        <p>Matheus Paixao</p>                           
                        <p class="pos">Linebacker Coach</p>
                    </div>
                </li>
            </ul>
                <div class="playersContainer">
                     <h2>Players</h2>
                     
                    <table id="playerTable">
                        <thead>
                            <tr>
                                <th style="text-align: center;">#</th>
                                <th style="width:200px;">Name</th>
                                <th style="width:200px;">Position</th>
                                <th>RSH YDS</th>
                                <th>PASS YDS</th>
                                <th>REC YDS</th>
                                <th>TDS</th>
                                <th>SCK</th>
                                <th>TCKL</th>
                            </tr>
                        </thead>
                            <tr class="even">
                                <td style="text-align: center;">23</td>
                                <td><a href="#">Paixao, Matheus</a></td>
                                <td>Linebacker</td>
                                <td>2</td>
                                <td>3</td>
                                <td>5</td>
                                <td>6</td>
                                <td>66</td>
                                <td>4</td>
                            </tr>
                            <tr class="odd">
                                 <td style="text-align: center;">23</td>
                                <td>Paixao, Matheus</td>
                                <td>Linebacker</td>
                                <td>2</td>
                                <td>3</td>
                                <td>5</td>
                                <td>6</td>
                                <td>66</td>
                                <td>4</td>
                            </tr>
                            <tr class="even">
                                 <td style="text-align: center;">23</td>
                                <td>Paixao, Matheus</td>
                                <td>Linebacker</td>
                                <td>2</td>
                                <td>3</td>
                                <td>5</td>
                                <td>6</td>
                                <td>66</td>
                                <td>4</td>
                            </tr>
                    </table>
                </div>
                 
            </div>
	</div>
      
    

    <div class="footer"><div class="footEmail"><img src="img/mail.png"/>plymouthblitz@team.com</div>  <div class="copyright">© Plymouth Blitz. 2014</div></div>
  
</body>

</html>
