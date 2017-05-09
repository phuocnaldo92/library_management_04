module BooksHelper
  include SessionsHelper

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

  def render_comment book_id
    x=""
    all_comment = UserActionBook.get_commet book_id
    all_comment.each_with_index{|in_arr, index|
      x+=("<table style='width:100%;'><tr><td width='50px'>"+(User.find_by id: in_arr[:user_id])[:email]+"</td><td align='left'>"+in_arr[:comment]+"</td></tr></table><hr style='margin-top: 0px; margin-left: 3px;'/>")
    }
    x
  end
  def render_like book_id
    if (UserActionBook.count_like_with_user book_id, current_user.id).zero?
      return "<image name = 'like' title ='"+book_id.to_s+"' id='like' src='/assets/like.png' onclick ='do_like(this)'/>"
    else
      return "<image name = 'unlike' title ='"+book_id.to_s+"' id='like' src='/assets/unlike.png' onclick ='do_like(this)'/>"
    end
  end
  def render_count_like book_id
    return UserActionBook.count_like book_id
  end
end
