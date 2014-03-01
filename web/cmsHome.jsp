<%-- 
    Document   : index
    Created on : Jan 10, 2014, 2:55:00 PM
    Author     : matheus
--%>

<%@page import="CMS.Global"%>
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

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script src='jQuery.js'></script>
        <script src='script.js'></script>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="backendCss.css" rel="stylesheet" type="text/css">
        <title>Plymouth Blitz</title>
    </head>

    <body>


        <%
            DbCon dbCon = new DbCon();

            ArrayList<NewsArticle> News;
            ArrayList<Fixture> Fixtures;
            ArrayList<Slide> SlideShow;


            Fixtures = dbCon.getAllFixtures();
            News = dbCon.getAllNews();
            SlideShow = dbCon.getAllSlides();
        %>

        <div id="main">
            <div id="slideUploader">
                <img class="closeIcon" src="img/closeIcon.png">
                <div id="slideDisplay">
                 <%
                    for (Slide s : SlideShow) {
                %> 
                <div class="imgContainer slide<%out.print(s.getSlideshowID());%>">
                    <img class="icon slide<%out.print(s.getSlideshowID());%>"src="img/MinusIcon.png" id="<%out.print(s.getSlideshowID());%>"/>
                    <img class="slideThumb slide<%out.print(s.getSlideshowID());%>"src="img/<%out.print(s.getImgSrc());%>"/>
                </div>
                <% }%>
                </div>
                <div id="uplodArea">
                    <div id="uploader" ondrop="drop(event)" ondragover="allowDrop(event)">
                        <img class="uploadImg" src="img/uploadGray.png">
                        <p class="uploadfeedback">DROP FILE HERE</p>
                    </div>
                    <input type="file" id="file" name="files[]" multiple onchange="startRead()" accept="image/*">
                    <div id="thumbContainer">
                        
                    </div>
                </div>
            </div>
<script>

    function createNews(){
    var content = $('#newsCon').val();
    var title = $('#newsTitle').val();
   
    var dataStream = 'newsContent='+ content +'&newsTitle='+title +'&opId=4'; 

  $.ajax({
    type: "POST",
    url: "EditHome",
    data: dataStream,
    cache: false,
    processData: false,
    success: function(news)
        {
            
        $('.newsCont').prepend("<article><h3>"+title+
                "</h3> <p class='newsInfo'><b>"+news.name+"</b> - "+news.date+"</p><p class='newsContent'>"+
                content+"</p> <a href='#' class='newsDelete' id='"+news.id+"' >Delete</a> </article>" );
         
        }

    }); 
}
    
    function cancel(){
    $(".uploadImgThumb").remove();
 $("#slideAdd").remove();
 $("#cancelSlideAdd").remove();
 
  $('#uploader').css({"border-color":"#222222"});
  $('.uploadfeedback').html('DROP FILE HERE');
   $(".uploadImg").attr("src","img/uploadGray.png");
    
}
 
function upload(){
var d = new Date();
var imgURL = encodeURIComponent(picFile.result);
var dataStream = 'imgData='+ imgURL +'&opId=1' +'&date= '+ d.getTime()+'&imgType='+ imgFileType; 
$.ajax({
type: "POST",
url: "EditHome",
data: dataStream,
cache: false,
processData: false,
success: function(id)
{
 cancel();
         
 $('#slideDisplay').append("<div class='imgContainer slide"+id+"'><img class='icon slide"+id+"' src=" +
"'img/MinusIcon.png' id='"+id+"'/><img class='slideThumb slide"+id+"' src='" + picFile.result + "'/></div>"); 

$('.slideshow').append("<div class='slide new"+id +" slide"+id+"'/></div>"); 
$('.new'+id).append("<img class='slide"+id+"' src='"+picFile.result+"'/>");

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

$('#thumbContainer').prepend("<img class='uploadImgThumb' src='" + picFile.result + "'" +
           "title='" + picFile.name + "'/>  <button onclick='upload()' id='slideAdd'>Upload</button> <button onclick='cancel()' id='cancelSlideAdd'>Cancel</button>");
  
   var img = new Image();
    img.src = picFile.result;
    var width = img.width,
     height = img.height; 
   var ratio = width/height;
   if(ratio !== 2.25){
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
            <div class="slideshow">
                <img class="slideEditIcon" src="img/bigEditIcon.png"/>
                <%
                    for (Slide s : SlideShow) {
                %>
                <div class="slide slide<%out.print(s.getSlideshowID());%>" /><img class="slide<%out.print(s.getSlideshowID());%>" src="img/<%out.print(s.getImgSrc());%>"/></div>
                    <% }%>
            </div>
            <div class="content">
                <div id="news">
                    <h2>Add News Article</h2>

                    <div>
                        <ul>
                            <input  type="text" id="newsTitle" name="title" placeholder="Article Title"></li>
                            <br/>
                            <li> <textarea name="article" id="newsCon" type="text" placeholder="Article Content"></textarea> </li>
                            <li><button onclick="createNews()">Publish</button> </li>
                        </ul>            
                    </div>
                    <div class="newsCont">
                        <%
                            for (NewsArticle n : News) {
                        %>
                        <article>
                            <h3><% out.print(n.getTitle());%></h3>                       
                            <p class="newsInfo"><b><% out.print(n.getMemberName());%></b> - <% out.print(n.getDateStamp());%></p>
                            <p class="newsContent"><% out.print(n.getContent());%></p>
                            <a href="#" class='newsDelete' id='<% out.print(n.getNewsID());%>' >Delete</a>
                        </article> 
                        <%
                            }
                        %>
                    </div>

                </div>
                <div id="schedule">
                    <h2>Edit Schedule & Results</h2>

                    <table>
                        <%for (Fixture f : Fixtures) {%>
                        <tr class="row edit_tr" id="<% out.print(f.getFixture_id());%>">
                           
                            <td class="date">
                                <span id="date_<% out.print(f.getFixture_id());%>" class="text" ><% out.print(f.getGameDate());%></span>
                                <input type="text" value="<%out.print(f.getGameDate());%>" class="editbox date" id="date_input_<% out.print(f.getFixture_id());%>"/>
                            </td>
                            <td class="score">
                                <span id="homeScore_<% out.print(f.getFixture_id());%>" class="text" ><% out.print(f.getBlitz_score());%></span>
                                <input type="text" value="<% out.print(f.getBlitz_score());%>" class="editbox home" id="homeScore_input_<% out.print(f.getFixture_id());%>"/>
                            </td>
                            <td class="score"><% out.print(f.getResult());%></td>
                            <td class="score">
                                <span id="OpScore_<% out.print(f.getFixture_id());%>" class="text" ><% out.print(f.getOp_score());%></span>
                                <input type="text" value="<% out.print(f.getOp_score());%>" class="editbox op" id="OpScore_input_<% out.print(f.getFixture_id());%>"/>
                            </td>
                             <td class="team2">
                                <span id="team_<% out.print(f.getFixture_id());%>" class="text" ><% out.print(f.getTeam());%></span>
                                <input type="text" value="<% out.print(f.getTeam());%>" class="editbox team" id="team_input_<% out.print(f.getFixture_id());%>"/>
                            </td>
                            <td id="edit_<% out.print(f.getFixture_id());%>"><img src="img/editIcon.png"></td>
                        </tr>
                        <tr class="spacer"></tr>
                        <%}%>
                    </table>
<script type="text/javascript">
$(document).ready(function()
{




$(".slideshow").hover(function () {

         $(".slideEditIcon").toggle();

    });        
    
$(".closeIcon").click(function () {
         $("#slideUploader").hide();
         cancel();
    });  
    
$(".slideshow").click(function () {
         $("#slideUploader").show();
    });     

$(".icon").live('click', function(){

var ID=$(this).attr('id');

 $("#slide"+ID).remove();

var dataStream = 'slideId='+ ID +'&opId=2'; 

  $.ajax({
    type: "POST",
    url: "EditHome",
    data: dataStream,
    cache: false,
    processData: false,
    success: function(html)
        {
         $('.slide'+ ID).remove();
         
        }

    }); 
});    
    
       
$(".edit_tr").click(function()
{
var ID=$(this).attr('id');
$("#date_"+ID).hide();
$("#homeScore_"+ID).hide();
$("#OpScore_"+ID).hide();
$("#team_"+ID).hide();

$("#date_input_"+ID).show();
$("#homeScore_input_"+ID).show();
$("#OpScore_input_"+ID).show();
$("#team_input_"+ID).show();
}).change(function()
{
 
var ID=$(this).attr('id');
var date = $("#date_input_"+ID).val();
var homeScore = $("#homeScore_input_"+ID).val();
var opScore = $("#OpScore_input_"+ID).val();
var team = $("#team_input_"+ID).val();

var dataString = 'fixId='+ ID +'&fixDate='+ date +'&homescore='+homeScore +'&opScore='+opScore+'&team='+team +'&opId=3';

//$("#edit_"+ID).find('img').attr('src').replace('img/load.gif'); // Loading image

if(date.length>0&& homeScore.length>0&& opScore.length>0&& team.length>0)
{
$.ajax({
type: "POST",
url: "EditHome",
data: dataString,
cache: false,
success: function(html)
{
    console.log(html);
$("#date_"+ID).html(date);
$("#homeScore_"+ID).html(homeScore);
$("#OpScore_"+ID).html(opScore);
$("#team_"+ID).html(team);
}
}); 
}
else{
    
 alert('Enter something.');   
}
});

// Edit input box click action
$(".editbox").mouseup(function() 
{
return false;
});

// Outside click action
$(document).mouseup(function()
{
$(".editbox").hide();
$(".text").show();
});

});
</script>
                </div>
            </div>
        </div>




    </body>

</html>
