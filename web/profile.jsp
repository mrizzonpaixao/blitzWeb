<%-- 
    Document   : home
    Created on : Feb 12, 2014, 11:12:04 AM
    Author     : Matheus
--%>

<%@page import="Equipament.ShoulderPad"%>
<%@page import="Equipament.Helmet"%>
<%@page import="Equipament.EquipamentLet"%>
<%@page import="memberInfo.Fees"%>
<%@page import="memberInfo.Stats"%>
<%@page import="memberInfo.member"%>
<%@page import="memberInfo.MemberIndex"%>
<%@page import="DBCon.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='jQuery.js'></script>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="backendCss.css" rel="stylesheet" type="text/css">
        <title>Plymouth Blitz</title>
    </head>
    <body>
        <% if(session.getAttribute("memberId") == null){
         response.sendRedirect(response.encodeRedirectURL("index.jsp"));
         } %>
        <header>
            <p class="welcome">Welcome, <%out.print(session.getAttribute("email"));%> </p>
             <div class="logReg">
                 
                <%if(session.getAttribute("memberId") == null){%>
                <a class="log btn">Login</a> <a class="reg btn" href="register.jsp">Register</a>
                <%}else{%>
                <a class="btn" href="index.jsp">Home</a> <a class="logOut btn" onclick="window.location = 'logout';">Logout</a>
                <%}%>
            </div>
            <div class="navContainer">
        <img id="logo" src="img/plymouthblitz_logo.png">
        
        <ul>
        
            <li ><a href="home.jsp">NOTICES</a></li>
        <% if(session.getAttribute("role") == null){
          response.sendRedirect(response.encodeRedirectURL("index.jsp"));
         }else{
            
            String role = session.getAttribute("role").toString();
                   
           if(role.equals("1")){%>
               <li> <a href="mail.jsp">MAIL</a></li>
           <%}else if(role.equals("2")){%>
               <li><a href="mail.jsp">MAIL</a></li>
           <%} else if(role.equals("3")){%>
           <li><a href="#">MAIL</a></li>
         <li class="currentLi"> <a href="profile.jsp">PROFILE</a></li>
          <li> <a href="manage.jsp">MANAGE</a></li>
           <%} else if(role.equals("4")){%>
          <li> <a href="cms.jsp">MAIL</a></li>
          <li class="currentLi"> <a href="profile.jsp">PROFILE</a></li>
           <%} } %>
         </ul>
        </div>
        </header>
         <%
        DbCon dbCon = new DbCon();
        MemberIndex members = dbCon.getAllMembers();
         member m ;
         m = members.getMemberAtIndex(Integer.parseInt(session.getAttribute("memberId").toString()));
         %>
        <div id="profileMain">            
            <div class="profileBlocks detail">
                 <h3>Details</h3>
                <div class="leftdashPost">
  <div class="ProfileleftpostContent">
    <img class="leftspeechPic" src="img/<%out.print(m.getImgSrc());%>">
    <br>
    <a class="postNameLeft"><%out.print(m.getFirstName()+" "+m.getSurname());%></a>
    
    <a class="postNameLeft"><%out.print(m.getPossition());%></a>

  </div>
  <div class="leftspeechBubble">
    <img class="leftspeechPoint" src="img/speechBubbleProfile.png">
    <div class="profilespeechBubbleContent content55"><%out.print(m.getDescription());%></div>
  </div>
      <table class="statTable">
                                     
                        <thead>
                         
                            <tr>
                                <th>RSH YDS</th>
                                <th>PASS YDS</th>
                                <th>REC YDS</th>
                                <th>TDS</th>
                                <th>SCK</th>
                                <th>TCKL</th>
                            </tr>
                        </thead>
                       <%Stats stats = m.getStats();%>
                        <tbody><tr class="odd rows">

                                <td><%out.print(stats.getRushYds());%></td>
                                <td><%out.print(stats.getPasYds());%></td>
                                <td><%out.print(stats.getRecvYds());%></td>
                                <td><%out.print(stats.getTds());%></td>
                                <td><%out.print(stats.getScks());%></td>
                                <td><%out.print(stats.getTckls());%></td>
                            </tr>
                        </tbody>
                    </table>
</div>
            </div>          
      
         <div class="profileBlocks equip">
             <h3>Equipment</h3>
             <%
             EquipamentLet let = m.getLet();
             Helmet h;
             ShoulderPad sp;
             if(let==null){
             sp = null;
             h = null;
             }else{
             h = let.getHelmet();
             sp = let.getPad();
             %>
              <div class="equipFee paid<%out.print(let.getFee());%>">Deposit</div>
             <%
             }
             %>
             
            
             
             <div class="helmet">
                 <h4>Helmet</h4>
                 <%if(h != null){%>
                 <img src="img/riddleHelmet.png"/>
                 <p><strong>Brand:</strong> <% out.print(h.getBrand());%></p>
                 <p><strong>Size:</strong> <% out.print(h.getSize());%></p>
                 <%}else{%>
                 <p><strong>NONE</strong></p>
                 <%}%>
             </div>
             <div class="pads"> 
                 <h4>Shoulder Pad</h4>
                  <%if(sp != null){%>
                <img src="img/riddlePads.png"/>
                 <p><strong>Brand:</strong> <% out.print(sp.getBrand());%></p>
                 <p><strong>Size:</strong> <% out.print(sp.getSize());%></p>
                 <%}else{%>
                 <p><strong>NONE</strong></p>
                 <%}%>
                 
             </div>
              
         </div>
         <div class="profileBlocks fees">
             <% Fees f = m.getFees();
             int[] game = f.getGameDayFees();
             %>
             <h3>Fees</h3>
             <div class="topFees paid<%out.print(f.getLeagueFee());%>">League Fee</div> <div class="topFees paid<%out.print(f.getTeamFee());%>">Team Fee</div>
             <h4>Game Day Fees </h4>
              <div class="gameFees paid<%out.print(game[0]);%>">1</div> <div class="gameFees paid<%out.print(game[1]);%>">2</div> <div class="gameFees paid<%out.print(game[2]);%>">3</div> <div class="gameFees paid<%out.print(game[3]);%>">4</div>
              <div class="gameFees paid<%out.print(game[4]);%>">5</div> <div class="gameFees paid<%out.print(game[5]);%>">6</div> <div class="gameFees paid<%out.print(game[6]);%>">7</div> <div class="gameFees paid<%out.print(game[7]);%>">8</div> 
              <div class="key"><a id="paid"></a><a>Paid</a>  <a id="unpaid"></a><a>Unpaid</a> </div>
         </div>
          </div>
    </body>
</html>
