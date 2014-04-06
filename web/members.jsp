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
         member m ;
         
         m = members.getMemberAtIndex(Integer.parseInt(request.getParameter("id")));
         %>
        <div id="profileMain">  
            <div class="ContEditMemberDetail">
                <div class="editMemberDetail">
                    <img class="closeIcon" src="img/closeIcon.png">
                    <div id="uplodArea" class="editUpArea">
                    <div id="uploader" class="profileUploader" ondrop="drop(event)" ondragover="allowDrop(event)">
                        <img class="uploadImg edituploadImg" src="img/uploadGray.png">
                        <p class="uploadfeedback">Drop Profile Picture</p>
                    </div>
                    <input type="file" id="file" name="files[]" multiple onchange="startRead()" accept="image/*">
                     <div id="thumbContainer">
                        
                    </div>
                </div>
                    <h4>Personal Details</h4>
                   <p >
                        <select id="pos" class="memberDetail">
                            <option value="1">Not Specified</option>
                            <option value="2">Linebacker</option>
                            <option value="3">Cornerback</option>
                            <option value="4">Defensive Line</option>
                             <option value="5">Offensive Line</option>
                              <option value="6">Quarterback</option>
                              <option value="7">Runningback</option>
                              <option value="8">Widereciver</option>
                              <option value="9">Head Coach</option>
                              <option value="10">Assistant Head Coach</option>
                              <option value="11">Special Teams Coach</option>
                              <option value="12">Defensive Coach</option>
                              <option value="13">Offensive Coach</option>
                       </select>
                    </p>
                    <p>
                        <select id="role" class="memberDetail">
                            <option value="1">Recruit</option>
                            <option value="4">Player</option>
                            <option value="2">Coach</option>
                            <option value="3">Committee</option>
                       </select>
                    </p>
                    <p>
                    <a id="firstName" class="memberDetail" contenteditable="true"><%out.print(m.getFirstName());%></a>
                    <a id="surname" class="memberDetail" contenteditable="true"><%out.print(m.getSurname());%></a>
                    </p>
                    <p><a id="email" class="memberDetail" contenteditable="true"><%out.print(m.getEmail());%></a></p>
                    <p> <a id="contact" class="memberDetail" contenteditable="true"><%out.print(m.getContactNumber());%></a></p>
                    
                </div>
            </div>
            <div class="profileBlocks detail">
                 <h3>Details</h3>
                <div class="leftdashPost">
  <div class="ProfileleftpostContent">
    <img class="leftspeechPic" src="img/<%out.print(m.getImgSrc());%>">
    <br>
    <a class="postNameLeft" id="fullName"><%out.print(m.getFirstName()+" "+m.getSurname());%></a>
    
    <a class="postNameLeft" id="memPoss"><%out.print(m.getPossition());%></a>

  </div>
  <div class="leftspeechBubble">
    <img class="leftspeechPoint" src="img/speechBubbleProfile.png">
    <div class="profilespeechBubbleContent"contenteditable="true" ><%out.print(m.getDescription());%></div>
  </div>
      <table class="statTable ">                                     
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
                                <td>
                                <span id="RushYds" class="statSpan" ><%out.print(stats.getRushYds());%></span>
                                <input type="text" id="RushYdsEdit" value="<%out.print(stats.getRushYds());%>" class="statEdit"/>
                                </td>                                
                                 <td>
                                <span id="PasYds" class="statSpan" ><%out.print(stats.getPasYds());%></span>
                                <input type="text" id="PasYdsEdit" value="<%out.print(stats.getPasYds());%>" class="statEdit"/>
                                </td>                                
                                <td>
                                <span id="RecvYds" class="statSpan" ><%out.print(stats.getRecvYds());%></span>
                                <input type="text" id="RecvYdsEdit" value="<%out.print(stats.getRecvYds());%>" class="statEdit"/>
                                </td>
                                <td>
                                <span id="Tds" class="statSpan" ><%out.print(stats.getTds());%></span>
                                <input type="text" id="TdsEdit" value="<%out.print(stats.getTds());%>" class="statEdit"/>
                                </td>
                                <td>
                                <span id="Scks" class="statSpan" ><%out.print(stats.getScks());%></span>
                                <input type="text" id="ScksEdit" value="<%out.print(stats.getScks());%>" class="statEdit"/>
                                </td>
                                 <td>
                                <span id="Tckls" class="statSpan" ><%out.print(stats.getScks());%></span>
                                <input type="text" id="TcklsEdit" value="<%out.print(stats.getScks());%>" class="statEdit"/>
                                </td>                                
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
             <div id="league_fee" class="memberFee topFees paid<%out.print(f.getLeagueFee());%>">League Fee</div> <div id="team_fee" class="memberFee topFees paid<%out.print(f.getTeamFee());%>">Team Fee</div>
             <h4>Game Day Fees </h4>
              <div id="game_one" class="memberFee gameFees paid<%out.print(game[0]);%>">1</div> <div id="game_two" class="memberFee gameFees paid<%out.print(game[1]);%>">2</div> <div id="game_three" class=" memberFee gameFees paid<%out.print(game[2]);%>">3</div> <div id="game_four" class=" memberFee gameFees paid<%out.print(game[3]);%>">4</div>
              <div id="game_five" class="memberFee gameFees paid<%out.print(game[4]);%>">5</div> <div id="game_six" class="memberFee gameFees paid<%out.print(game[5]);%>">6</div> <div id="game_seven" class="memberFee gameFees paid<%out.print(game[6]);%>">7</div> <div id="game_eight" class="memberFee gameFees paid<%out.print(game[7]);%>">8</div> 
              <div class="key"><a id="paid"></a><a>Paid</a>  <a id="unpaid"></a><a>Unpaid</a> </div>
         </div>
          </div>
<script>
function nl2br (str, is_xhtml) {   
    var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';    
    return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ breakTag +'$2');
}    
$(document).ready(function()
{  

$(".memberFee").click(function(){
 var val;
 var row = $(this).attr('id');
 var memberId ='<%out.print(m.getMember_id());%>';
 
         if($(this).hasClass("paid0")){
            
            $(this).removeClass('paid0');
            $(this).addClass('paid1');
            val = 1;
                      
        }else{
            
            $(this).removeClass('paid1');
            $(this).addClass('paid0');
            val = 0;
        };

var dataString = 'opId=5'+'&row='+row+'&memberId='+memberId+'&val='+val;

$.ajax({
type: "POST",
url: "EditMembers",
data: dataString,
cache: false,
success: function(msg)
{

}
}); 

});

$( ".profilespeechBubbleContent" ).focus(function() {
  $(this).css({"background":"#ffffcc"});  
});
$( ".profilespeechBubbleContent" ).focusout(function(){
  
   var desc = $(".profilespeechBubbleContent").html();
  
  var readyDesc = nl2br (desc, true);
  
 $(".profilespeechBubbleContent").css({"background":"#F0F0F0"});


var dataString = 'opId=4'+'&desc='+readyDesc+'&memberId='+<%out.print(m.getMember_id());%>;

if(desc.length > 0){
    
$.ajax({
type: "POST",
url: "EditMembers",
data: dataString,
cache: false,
success: function(msg)
{$(".profilespeechBubbleContent").html(desc); }
}); 
}else{

alert("cant be empty");

}
});

   
        
$( ".statTable" ).click(function() {
    $(".statSpan").hide();
    $(".statEdit").show();
}).change(function()
{
 
var ID= "<%out.print(stats.getStasID());%>";
var RushYds = $("#RushYdsEdit").val();
var PasYds = $("#PasYdsEdit").val();
var RecYds = $("#RecvYdsEdit").val();
var Tds = $("#TdsEdit").val();
var Sck = $("#ScksEdit").val();
var Tckl = $("#TcklsEdit").val();

var dataString = 'statId='+ ID +'&RushYds='+ RushYds +'&PasYds='+PasYds +
        '&RecYds='+RecYds+'&Tds='+Tds +'&opId=3'+'&Sck='+Sck+'&Tckl='+Tckl;

if(RushYds.length>0 && PasYds.length>0 && RecYds.length>0 && Tds.length>0 && Sck.length>0&& Tckl.length>0)
{
$.ajax({
type: "POST",
url: "EditMembers",
data: dataString,
cache: false,
success: function(msg)
{
$("#RushYdsEdit").html(RushYds);
$("#PasYdsEdit").html(PasYds);
$("#RecvYdsEdit").html(RecYds);
$("#TdsEdit").html(Tds);
$("#ScksEdit").html(Sck);
$("#TcklsEdit").html(Tckl);

$("#RushYds").html(RushYds);
$("#PasYds").html(PasYds);
$("#RecvYds").html(RecYds);
$("#Tds").html(Tds);
$("#Scks").html(Sck);
$("#Tckls").html(Tckl);


}
}); 
}
else{
    
 alert('Enter something.');   
}
});  

// Edit input box click action
$(".statEdit").mouseup(function() 
{
return false;
});

// Outside click action
$(document).mouseup(function()
{
 $(".statSpan").show();
 $(".statEdit").hide();

});

    var theText = "<%out.print(m.getPossition());%>";
    $("#pos option:contains(" + theText + ")").attr('selected', 'selected');

    $('#role').val("<%out.print(m.getRole());%>");
    
    $( ".memberDetail" ).focus(function() {        
      $(this).css({"background":"#ffffcc","color":"#000"});
    });

    $( ".memberDetail" ).focusout(function() {
         $(this).css({"background":"none"});
        updateContent();
    });
    
    $("#about").hover(function () {

         $(".slideEditIcon").toggle();

    }); 
    
    $(".closeIcon").click(function () {
         $(".ContEditMemberDetail").hide();
         cancel();
    }); 
    
     $(".leftspeechPic").click(function () {
         $(".ContEditMemberDetail").show();
    }); 
    
  });   
  
function updateContent(){
    
var pos = $('#pos').val(); 
var role = $('#role').val();
var firstName = $('#firstName').html().trim(" ");
var surname = $('#surname').html().trim(" ");
var email= $('#email').html().trim(" ");
var contact= $('#contact').html().trim(" ");

var dataStream ='opId=2' +'&pos='+ pos + '&role='+role + '&firstName='+
        firstName + '&Surname='+surname+ '&email='+ email+ '&contact='+contact+'&memberId=<%out.print(m.getMember_id());%>';

$.ajax({
type: "POST",
url: "EditMembers",
data: dataStream,
cache: false,
processData: false,
success: function(msg)
{
 cancel();      
 $("#fullName").html(firstName +" "+surname);
 var pos = $("#pos option:selected").text();
$("#memPoss").html(pos);
}
});
    
}  
function cancel(){
 $(".profileThumb").remove();
 $("#slideAdd").remove();
 $("#cancelSlideAdd").remove();
 $('.editMemberDetail h4').css({"margin-top": "0px"});
 $(".editMemberDetail").css({height: "500px"});
 
  $('#uploader').css({"border-color":"#222222"});
  $('.uploadfeedback').html('Drop Profile Picture');
  $(".uploadImg").attr("src","img/uploadGray.png");
    
}
 
function upload(){
var d = new Date();
var imgURL = encodeURIComponent(picFile.result);
var dataStream = 'imgData='+ imgURL +'&opId=1' +'&date= '+ d.getTime()+'&imgType='+ imgFileType +'&memberId=<%out.print(m.getMember_id());%>'; 
$.ajax({
type: "POST",
url: "EditMembers",
data: dataStream,
cache: false,
processData: false,
success: function(msg)
{
 cancel();
  
  $(".leftspeechPic").attr("src", picFile.result);       
 
}
});
}

function startRead(evt) {
    var file = document.getElementById('file').files[0];
    
    checkFile(file);
 
    }

function checkFile(file){
    
    if(file.type.match("image.*")){
      sendFile(file);  
      var temp = file.type;
      imgFileType = temp.replace("image/","");
      
   }else{
   $('#uploader').css({"border-color":"#FF5C5C"});
   $('.uploadfeedback').html('FILE TYPE NOT PERMITED');
   $(".uploadImg").attr("src","img/uploadRed.png");
   }
}

function allowDrop(ev)
{
ev.preventDefault();
}

function drop(evt){
evt.preventDefault();
var file =evt.dataTransfer.files[0];
 
checkFile(file);
 
}

function sendFile(file){
    
var reader = new FileReader();     
 reader.addEventListener("load",function(event){
 picFile = event.target;
 
 $(".uploadImgThumb").remove();
 $("#slideAdd").remove();
 $("#cancelSlideAdd").remove();
 
 $('.editMemberDetail h4').css({"margin-top": "400px"});
 $(".editMemberDetail").css({height: "630px"});

$('#thumbContainer').prepend("<img class='profileThumb' src='" + picFile.result + "'" +
           "title='" + picFile.name + "'/>  <button onclick='upload()' id='slideAdd'>Upload</button> <button onclick='cancel()' id='cancelSlideAdd'>Cancel</button>");
  
   var img = new Image();
    img.src = picFile.result;
    var width = img.width,
     height = img.height; 
   var ratio = width/height;
   if(ratio !== 1){
   $('#uploader').css({"border-color":"#d4d43d"});
  $('.uploadfeedback').html('IMAGE SIZE MAY CAUSE DISTORTION');
   $(".uploadImg").attr("src","img/uploadYel.png");
   }else{   
  $('#uploader').css({"border-color":"#5C9D5C"});
  $('.uploadfeedback').html('CORRECT FILE TYPE');
   $(".uploadImg").attr("src","img/uploadGreen.png");
   }      
       
                
});
    
 reader.readAsDataURL(file);  


}

    
    
               
</script>    
    </body>
</html>
