function do_rating(this_object){
    $.ajax({
        url: '/create',
        data:{number_rating:this_object.title, book_id:this_object.value},
        dataType:'json',
        success: function(data) {
            alert(data.status);
        }
    });
}
function do_like(this_object){
    $.ajax({
        url: '/comment',
        data:{like:this_object.name, book_id: this_object.title},
        dataType:'json',
        success: function(data) {
            if(data.status == "success like")
            {
                document.getElementById("like").src = "/assets/unlike.png";
                document.getElementById("like").name = "unlike";
                document.getElementById("count_like").innerHTML = parseInt(document.getElementById("count_like").innerHTML)+1
            }
            if(data.status == "success unlike")
            {
                document.getElementById("like").src = "/assets/like.png";
                document.getElementById("like").name = "like";
                document.getElementById("count_like").innerHTML = parseInt(document.getElementById("count_like").innerHTML)-1
            }
           
        }        
    });
}

$(document).ready(function(){
  var tb = document.getElementById("text_comment");
  tb.value = "";      
});

function do_comment(this_object){
    var tb = document.getElementById("text_comment")
    var bt = document.getElementById("abc")
    $.ajax({
        url: '/comment',
        data:{comment:tb.value, book_id: bt.name},
        dataType:'json',
        success: function(data) {
            tb.value = "";
            var comment_all = document.getElementById("comment_all");
            comment_all.innerHTML += ("<table style='width:100%;'><tr><td width='50px'>"+data.user+"</td><td align='left'>"+data.comment+"</td></tr></table><hr style='margin-top: 0px; margin-left: 3px;'/>");         
        }
    });
}

function do_send_value(this_object){
    alert(this_object.title);
    var tb = document.getElementById("num");
    window.location = "categorys?node="+this_object.title
    tb.value = this_object.title
    // tb.value = "100"
}

$(document).ready(function(){
  $("#text_comment").on( "keydown", function(event) {
    if(event.which == 13)          
    {
      var tb = document.getElementById("text_comment")
      var bt = document.getElementById("abc")
      $.ajax({
        url: '/comment',
        data:{comment:tb.value, book_id: bt.name},
        dataType:'json',
        success: function(data) {
            tb.value = "";
            var comment_all = document.getElementById("comment_all");
            comment_all.innerHTML += ("<table style='width:100%;'><tr><td width='50px'>"+data.user+"</td><td align='left'>"+data.comment+"</td></tr></table><hr style='margin-top: 0px; margin-left: 3px;'/>");         
        }
      });
    }
    });
});

