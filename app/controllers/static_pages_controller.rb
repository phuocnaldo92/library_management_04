class StaticPagesController < ApplicationController

  def home
  	if params[:search_in] == "books"
  	  redirect_to url_for(:controller => :books, :action => :index, :keyword => params[:keywords])
  	end
    if params[:search_in] == "authors"
      redirect_to url_for(:controller => :authors, :action => :index, :keyword => params[:keywords])
    end
    @books_top6 = Book.get_top6_create(6)
    @author_top3 = Author.get_top3_create(3)
    @get_top6_rating = Book.get_top6_rating(6)
  end

  def help
  end

  def about
  end
end
