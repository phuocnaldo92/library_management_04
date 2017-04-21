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
          result += "<li class='yahoo'><a href=''>" + 
            + categorie[:title] + "</a>" + "<ul>" +
            + show_categories(categories, categorie[:id]) + "</ul>" + "</li>"
        else
          result += "<li class='yahoo'><a href=''>" + 
          + categorie[:title] + "</a>" + "</li>"
        end
      end
    end 
    result
  end
end
