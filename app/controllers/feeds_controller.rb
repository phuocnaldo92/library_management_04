class FeedsController < ApplicationController
  def index
    if params[:search_in] == "books"
      redirect_to url_for(:controller => :books, :action => :index, :keyword => params[:keywords])
    end
    if params[:search_in] == "authors"
      redirect_to url_for(:controller => :authors, :action => :index, :keyword => params[:keywords])
    end
    if !params[:number].nil?
      numberTruoc = params[:number].to_i
      number_sau = (params[:number].to_i + 3)
      @feeds = current_user.user_follow_authors
      str=""
      @feeds.each_with_index do |feed, index|
        x = feed[:author_id].to_i
        author = Author.find x
        relation_book_author = RelationBookAuthor.get_book x
        relation_book_author.each_with_index do |rl, index2|
          if (index2 <= number_sau && index2 > numberTruoc )         
            str += "<div class='feeds'><p class='feedsp'><a href = 'authors/" + author[:id].to_s + "'>" + author[:name] + "</a> posted <a href = 'books/" + rl[:book_id].to_s + "'>" + (Book.find rl[:book_id].to_i).title + "</a></p></div><br>"      
          end        
        end       
      end
      
      @result = {html: str}    
      respond_to do |format|
          format.json {render json: @result}
      end
      return
    end
  	
  	@feeds = current_user.user_follow_authors
  	@str=""
  	@feeds.each_with_index do |feed, index|
      
  	  x = feed[:author_id].to_i
  	  author = Author.find x
  	  relation_book_author = RelationBookAuthor.get_book x
  	  relation_book_author.each_with_index do |rl, index2|

        if index2 <= 2
  	    @str += "<div class='feeds'><p class='feedsp'><a href = 'authors/" + author[:id].to_s + "'>" + author[:name] + "</a> posted <a href = 'books/" + rl[:book_id].to_s + "'>" + (Book.find rl[:book_id].to_i).title + "</a></p></div><br>"  		

      end
  	  end  

  	end
  end
end
