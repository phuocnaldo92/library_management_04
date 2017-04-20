module UsersHelper

  def render_html_menu
    @categorys = Category.all
    return showCategories @categorys, 0
  end

  def showCategories categories, parent_id
    @result= ""    
    categories.each do |categorie| 
      if(categorie[:parentid]==parent_id)
          @result+="<li class='yahoo'><a href=''>" + categorie[:title] + "</a>" + "<ul>" +
            + showCategories(categories, categorie[:id]) + "</ul>" + "</li>"
      end
    end 
    return @result;
  end
end
