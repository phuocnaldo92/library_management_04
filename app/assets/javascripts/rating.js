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
