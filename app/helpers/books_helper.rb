module BooksHelper

  def render_rating number_rating, book_id
    number_five = Settings.number_five
    append_html = ""
    number_five.times do |n|
      if(number_five - n) != number_rating
        append_html += "<a href = 'javascript:void(0)'><input  type='radio' " +
          + "id='star#{number_five - n}' value = '#{book_id}' name ='rating' " +
          + "title ='#{number_five - n}' onclick= 'do_rating(this);' " +
          + "name='rating' /><label for='star#{number_five - n}'></label></a>"
      else
        append_html += "<a href = 'javascript:void(0)'><input type='radio' " +
          + "id='star#{number_five - n}' value = '#{book_id}' name ='rating' " +
          + "title = '#{number_five - n}' onclick= 'do_rating(this);' " +
          + "name='rating' checked/> <label for='star#{number_five - n}'>" +
          + "</label></a>"
      end
    end
    append_html
  end
end
