$(window).bind("load", function () {
    $(".log").click(function () {

         $(".bubble").toggle();

    });
    
   $(".slide:gt(0)").hide();

      setInterval(function() { 
        $('.slide:first')
          .fadeOut(1000)
          .next()
          .fadeIn(1000)
          .end()
          .appendTo('.slideshow');
      },  3000);
    
       
        
      $(".active").animate({ top: "0px" });
      $(".active a").css({color: "#fff"});
    
    
    
    $(".navContainer ul li").hover(function () {

         $(this).find('ul').toggle();
                 

    });
    
     $("#about").hover(function () {
        if (!$(this).find('#aboutContent').hasClass('animated')) {
            $(this).find('#aboutContent').dequeue().stop().animate({ right: "0px" });
            
                   }
    }, function () {
        $(this).find('#aboutContent').addClass('animated').animate({right: "-280px" }, "normal", "linear", function () {
            $("#about").find('#aboutContent').removeClass('animated').dequeue();
            
        });
       
    });
    
    
    $(".inactive").hover(function () {
        if (!$(this).find('.navBG').hasClass('animated')) {
            $(this).find('.navBG').dequeue().stop().animate({ top: "0px" });
            
            $(this).find("a").css({color: "#fff"});
        }
    }, function () {
        $(this).find('.navBG').addClass('animated').animate({top: "34px" }, "normal", "linear", function () {
            $(".inactive").find('.navBG').removeClass('animated').dequeue();
            
        });
        $(this).find("a").css({color: "#000"});
    });
    
 
    
//    if($("nav li").each("a").attr('href') === getPageName(document.URL)){
//        
//       $("nav li").addClass('active'); 
//    }
//        
//    
//    function getPageName(url) {
//    var index = url.lastIndexOf("/") + 1;
//    var filenameWithExtension = url.substr(index);  
//    return filenameWithExtension;                                   
//}
    
    
});


