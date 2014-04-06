<%-- 
    Document   : home
    Created on : Feb 12, 2014, 11:12:04 AM
    Author     : Matheus
--%>

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
            <li class="currentLi"> <a href="mail.jsp">MAIL</a></li>
        <% if(session.getAttribute("role") == null){
          response.sendRedirect(response.encodeRedirectURL("index.jsp"));
         }else{            
            String role = session.getAttribute("role").toString();
                   
           if(role.equals("3")){%>
             <li> <a href="profile.jsp">PROFILE</a></li>
          <li> <a href="manage.jsp">MANAGE</a></li>
           <%}else if(role.equals("4")){%>
            <li> <a href="profile.jsp">PROFILE</a></li>
           <%} } %>
         </ul>
        </div>
        </header>
         <div class='newMail'>
             <div class='newMailContainer'><img class="closeIcon" src="img/closeIcon.png">
                 <div id='searchResoults'>
                                      
                 </div>
                 <p class='toText'>To:<span class="contactHolder"> </span><input type="text" name="to" class='toSearch'id='to'></p>
                 <p>Subject: <input type="text" name="subject" id='subject'></p>
                 <div class="mailTextArea"  contenteditable="true"></div>
                 <a class="btn mailSend">Send</a>
             </div>
         </div>
          <div class='inboxMail'>
             <div class='newMailContainer'><img class="closeIcon" src="img/closeIcon.png">
                <p class='toText'>From:<span class="contactHolder"><span class="Incontact" id="16">matheuspx@yahoo.com</span></span></p>
                <p>Subject: <span class="mailSubject">fasfasfasfas</span></p>
                 <div  class="mailTextArea">sdfsdfsd <br>sdfsdfsd </div>
                 <a class="btn mailReply">Reply</a>
             </div>
         </div>
        <div id="main" class="mailMain" style="margin-top: 6px; min-height: 78%; background:#EBEBEB; ">
            <div class="mailNav">
                <p id='compose'><a>+ New Mail</a></p>
                <p class="activeMail"><a>Inbox</a></p> 
                <p><a>Sent</a></p>
            </div>
            <div class="mailContent">
                <ul class="Maillist">
                    <li>
                        <img class="email0" src="img/socialBG.png;" /><a><strong>Matheus Paixao</strong></a><strong>hey this is the subject</strong><span class="preview"> all good yehaha sgjsdhsadjhav hasd  jhad ertert tretert tretadsfsdf fdf sdf</span>
                    </li>
                    <li>
                        <img class="email1" src="img/socialBG.png;" /><a><strong>Matheus Paixao</strong></a><strong>hey this is the subject</strong><span class="preview"> all good yehaha sgjsdhsadjhav hasd  jhad ertert tretert treta</span>
                    </li>
                    <li>
                        <img class="email0" src="img/socialBG.png;" /><a><strong>Matheus Paixao</strong></a><strong>hey this is the subject</strong><span class="preview"> all good yehaha sgjsdhsadjhav hasd  jhad ertert tretert treta</span>
                    </li>
                    <li>
                        <img class="email1" src="img/socialBG.png;" /><a><strong>Matheus Paixao</strong></a><strong>hey this is the subject</strong><span class="preview"> all good yehaha sgjsdhsadjhav hasd  jhad ertert tretert treta</span>
                    </li>
                    <li>
                       <img class="email0" src="img/socialBG.png;" /> <a><strong>Matheus Paixao</strong></a><strong>hey this is the subject</strong><span class="preview"> all good yehaha sgjsdhsadjhav hasd  jhad ertert tretert treta</span>
                    </li>
                </ul> 
            </div>
       </div>
         <script>
             
           $(".mailReply").click(function () {
            
            var id = $(".Incontact").attr('id');
            var email = $(".Incontact").html();       
            var subject = $('.mailSubject').html();
            var content = $('.inboxMail').find('.mailTextArea').html();
            
          });         
             
           $(".delMail").live('click', function(){
             var temp = $(this).attr('id');
             var id = temp.replace("img", "");
             $("#"+id).remove();            
             
       });         
             
         $(".mailSend").click(function () {
             var array = [];
              var r;
            $('.contact').each(function( ) {
                r = $( this ).attr('id');
                array.push(r);                       
            });
       });          
             
             
        $(".closeIcon").click(function () {
         $(".newMail").hide();
         $(".inboxMail").hide();
         cancel();
        }); 
    
        $("#compose").click(function () {
            $(".newMail").show();
       }); 
       
        $('.resoult').live('click', function(){
            
            var id = $(this).attr('id');
            var email = $(this).find('.email').html();
            
           $('.contactHolder').prepend("<span class='contact' id='"+id+"'>"+
                   email+"<img id='img"+id
                   +"' class='delMail' src='img/closeIcon.png'></span>");
           
           $('.toSearch').val("");
           $('.toSearch').focus();
           $('.resoult').remove();
            
        });
       
       $('.toSearch').keyup(function() {
           $('.resoult').remove();
           
           var val = $(this).val();
           
           if(val !== ""){ 
               
           var dataStream ='opId=1' +'&val='+ val;
           
            $.ajax({
            type: "GET",
            url: "mail",
            data: dataStream,
            cache: false,
            processData: false,
            success: function(res)
            {
              
              
               for ( var i = 0; i < res.count; i++ ) { 
              $('#searchResoults').append("<div class='resoult' id='"+res.members[i].memberId+"'> <div> <img src='img/"+res.members[i].imgSrc
                      +"'><p>"+res.members[i].firstName+" "+
                      res.members[i].surname+"</p><p class='email'>"+res.members[i].email+
                      "</p> </div></div> ");
                }  
            }
            });
           } 
       });
         </script>
    </body>
</html>
