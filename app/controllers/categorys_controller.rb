class CategorysController < ApplicationController
  
  def index
  	if params[:search_in] == "books"
  	  redirect_to url_for(:controller => :books, :action => :index, :keyword => params[:keywords])
  	end
    if params[:search_in] == "authors"
      redirect_to url_for(:controller => :authors, :action => :index, :keyword => params[:keywords])
    end
  	@x = params[:node]  	
  end

  def create
  	category = Category.new(title: params[:category][:title], parentid: params[:category][:parentid]) 
  	category.save 
  	redirect_to root_path
  end
end
