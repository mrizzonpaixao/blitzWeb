<%-- 
    Document   : index
    Created on : Jan 10, 2014, 2:55:00 PM
    Author     : matheus
--%>

<%@page import="CMS.Global"%>
<%@page import="memberInfo.Stats"%>
<%@page import="memberInfo.member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memberInfo.MemberIndex"%>
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
            MemberIndex members = dbCon.getAllMembers();
            ArrayList<member> Players = members.getPlayerList();
            ArrayList<member> Coaches = members.getCoachList();
            Stats stats;
           
            %>
	
	
	<div id="main">
            <div class="teamListContainer">
            
            <ul class="coachesList">
                <h2>Coaches</h2>
                <%
                  if(Coaches.isEmpty()){%>
                  <p class="pos">No coaches information available.</p>    
                      
                  <%}else{
                                  
                 for (member m : Coaches){%>
                <li>
                    <div class="shadow">
                        <a href="#">
                            <img src="img/<%out.print(m.getImgSrc());%>"/>
                        </a>
                    </div>
                    <div class="coachName">
                        <p><%out.print(m.getFullname());%></p>                           
                        <p class="pos"><%out.print(m.getPossition());%></p>
                    </div>
                </li>
                <%}}%>
              </ul>
                <div class="playersContainer">
                     <h2 style="float:left;">Players</h2>
                     <input type="text" class="searchBox" placeholder="Player Name or Position">
                     
                    <table id="playerTable">
                        <thead>
                            <tr>
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
                        <%
            int cnt = 0;
            String temp = "even";
            
                for (member m : Players){
                    stats = m.getStats();
                    if(cnt==0){temp = "odd";}else{temp = "even";}
                %>
                            <tr class="<%out.print(temp);%> rows">
                                <td><a href="#"><%out.print(m.getFullname());%></a></td>
                                <td><%out.print(m.getPossition());%></td>
                                <td><%out.print(stats.getRushYds());%></td>
                                <td><%out.print(stats.getPasYds());%></td>
                                <td><%out.print(stats.getRecvYds());%></td>
                                <td><%out.print(stats.getTds());%></td>
                                <td><%out.print(stats.getScks());%></td>
                                <td><%out.print(stats.getTckls());%></td>
                            </tr>
                    <%++cnt;}
                    if(cnt==1){cnt=0;}
                    %>        
                        </table>
                        <script>
                         
                         var $rows = $('.rows');
                        $('.searchBox').keyup(function() {

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
                 
            </div>
	</div>
 <%@ include file="footer.jsp" %> 
  
</body>

</html>
