$(window).scroll(function() {
   if($(window).scrollTop() + $(window).height() == $(document).height()) {
   	 var number = parseInt(document.getElementById("feedcenter").innerHTML);
       $.ajax({
        url: '/feeds',
        data:{number: number},
        dataType:'json',
        success: function(data) {  
          document.getElementById("ffff").innerHTML += data.html;
          if(data.html.length!=0)
          document.getElementById("feedcenter").innerHTML = (number +3);
        }        
    });
   }
});
