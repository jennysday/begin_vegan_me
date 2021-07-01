$(function() {
   
      //옆에 배너 기능
   var name = "#floatMenu"; 
   var menuYloc = null; 
    
      menuYloc = parseInt($(name).css("top").substring(0,$(name).css("top").indexOf("px")))
      $(window).scroll(function () { 
         offset = menuYloc+$(document).scrollTop()+"px"; 
         $(name).animate({top:offset},{duration:500,queue:false}); 
         }); 
   
      
      //밑에 top 기능      
   var topb="#topBotton";
   
      $(window).on("scroll touchmove mousewheel DOMMouseScroll", function(e) {
      if($(window).scrollTop() >= 20) $(topb).fadeIn();
      else $(topb).fadeOut();
      });
      $(topb).click(function(){
      $("html,body").animate({ scrollTop: 0 }, "fast");

      });

});