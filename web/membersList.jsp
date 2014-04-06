<%-- 
    Document   : home
    Created on : Feb 12, 2014, 11:12:04 AM
    Author     : Matheus
--%>

<%@page import="java.util.ArrayList"%>
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
             <div class="logReg">
                <%if(session.getAttribute("memberId") == null){%>
                <a class="log btn">Login</a> <a class="reg btn" href="register.jsp">Register</a>
                <%}else{%>
                <a class="btn" href="profile.jsp">Profile</a> <a class="logOut btn" onclick="window.location = 'logout';">Logout</a>
                <%}%>
            </div>
            <div class="navContainer">
        <img id="logo" src="img/plymouthblitz_logo.png">
         <ul>
            <li><a href="home.jsp">DASHBOARD</a></li>
            <li><a href="#">CMS +</a>            
                <ul >
                    <li><a href="cmsHome.jsp">Home page</a></li>
                    <li><a href="cmsAbout.jsp">About page</a></li>
                    <li><a href="cmsContact.jsp">Contact page</a></li>
                    <li><a href="#">Global</a></li>
                </ul>
            </li> 
            <li  class="currentLi"><a href="members.jsp">MEMBERS</a></li>
            <li><a href="#">EQUIPMENT</a>
                          
        </ul> 
        </div>
        </header>
         <%
        DbCon dbCon = new DbCon();
        MemberIndex members = dbCon.getAllMembers();
        ArrayList<member> Players = members.getPlayerList();
        ArrayList<member> Coaches = members.getCoachList();
        ArrayList<member> Committee = members.getCommitteeList();
        ArrayList<member> Recruits = members.getRecruitList();
         
        
         %>
        <div id="profileMain">            
            <div class="profileBlocks memberlist">
                <h3>Recruits</h3>
                 <input type="text" class="memberSearch" id="Recruits" placeholder="Recruits">
                <ul class="Recruits">
                    <%if(Recruits.isEmpty()){%>
                    There are no Recruits
                    <%}else{ 
                    for (member m : Recruits){%>
                    <li class="lines"><a href="members.jsp?id=<% out.print(m.getMember_id()); %>"><%out.print(m.getFullname());%></a></li>
                    <%}
                    }%>
                </ul>
            </div>
            <div class="profileBlocks memberlist">
                <h3>Players</h3>
                <input type="text" class="memberSearch" id="Players" placeholder="Players">
                <ul class="Players">
                 <%if(Players.isEmpty()){%>
                    There are no Players
                    <%}else{ 
                    for (member m : Players){%>
                    <li class="lines"><a href="members.jsp?id=<% out.print(m.getMember_id()); %>"><%out.print(m.getFullname());%></a></li>
                    <%}
                    }%>
                    </ul>
            </div>
            <div class="profileBlocks memberlist">
                <h3>Committee</h3>
                <input type="text" class="memberSearch" id="Committee" placeholder="Committee">
                <ul class="Committee">
                  <%if(Committee.isEmpty()){%>
                    There are no Committee
                    <%}else{ 
                    for (member m : Committee){%>
                    <li class="lines"><a href="members.jsp?id=<% out.print(m.getMember_id()); %>"><%out.print(m.getFullname());%></a></li>
                    <%}
                    }%>
                    </ul>
            </div>
            <div class="profileBlocks memberlist">
                <h3>Coaches</h3>
                <input type="text" class="memberSearch" id="Coaches" placeholder="Coaches">
                <ul class="Coaches">
                 <%if(Coaches.isEmpty()){%>
                    There are no Coaches
                    <%}else{ 
                    for (member m : Coaches){%>
                    <li class="lines"><a href="members.jsp?id=<% out.print(m.getMember_id()); %>"><%out.print(m.getFullname());%></a></li>
                    <%}
                    }%>
                    </ul>
            </div>
                      <script>                                                 
                         
                        $('.memberSearch').keyup(function() {
                            
                            var $id = $(this).attr('id');
                            var $temp = "."+ $id;
                            
                            var $rows = $($temp + " li" );

                            var val = '^(?=.*\\b' + $.trim($(this).val()).split(/\s+/).join('\\b)(?=.*\\b') + ').*$',
                                reg = RegExp(val, 'i'),
                                text;

                            $rows.show().filter(function() {
                                text = $(this).text().replace(/\s+/g, ' ');
                                return !reg.test(text);
                            }).hide();
                        });
                         
                     </script>
          </div>
    </body>
</html>
