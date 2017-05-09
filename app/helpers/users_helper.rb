module UsersHelper

  def render_html_menu
    categories = Category.all
    show_categories categories, 0
  end

  def show_categories categories, parent_id
    result = ""
    categories.each do |categorie|
      if categorie[:parentid] == parent_id
        if categories.where(parentid: categorie[:id]).count != 0
          result += "<li class='yahoo' style='z-index: 50;'><a href='http://localhost:3000/books?categori="+ categorie[:id].to_s+"'>"  + 
            + categorie[:title] + "</a>" + "<ul>" +
            + show_categories(categories, categorie[:id]) + "</ul>" + "</li>"
        else
          result += "<li style='z-index: 50;' class='yahoo'><a href='http://localhost:3000/books?categori="+ categorie[:id].to_s+"'>" + 
          + categorie[:title] + "</a>" + "</li>"
        end
      end
    end 
    result
  end

  def render_html_menu2
    categories = Category.all
    show_categories2 categories, 0
  end

  def show_categories2 categories, parent_id
    result = ""
    categories.each do |categorie|
      if categorie[:parentid] == parent_id
        if categories.where(parentid: categorie[:id]).count != 0
          result += "<li  title ='"+categorie[:id].to_s+"' onclick= 'do_send_value(this);'>" + 
            + categorie[:title] + "<ul>" +
            + show_categories2(categories, categorie[:id]) + "</ul>" + "</li>"
        else
          result += "<li title ='"+categorie[:id].to_s+"'onclick= 'do_send_value(this);'>" + 
          + categorie[:title]  + "</li>"
        end
      end
    end 
    result
  end
end
