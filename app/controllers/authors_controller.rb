class AuthorsController < ApplicationController

  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search_in] == "books"
      redirect_to url_for(:controller => :books, :action => :index, :keyword => params[:keywords])
    end
    if params[:search_in] == "authors"
      redirect_to url_for(:controller => :authors, :action => :index, :keyword => params[:keywords])
    end
    @authors = Author.search_author(params[:keyword])
  end

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    if params[:follow] == "follow" 
      user_follow_author = UserFollowAuthor.new(user_id: current_user.id, author_id: params[:id].to_i)
      user_follow_author.save
      redirect_to url_for(:controller => :authors, :action => :show, id: params[:id].to_i)
      return
    end
    if params[:follow] == "unfollow" 
      user_follow_author = UserFollowAuthor.find_by user_id: current_user.id, author_id: params[:id].to_i
      user_follow_author.destroy
      redirect_to url_for(:controller => :authors, :action => :show, id: params[:id].to_i)
      return
    end
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html {redirect_to @author, notice: 'Author was successfully created.'}
        format.json {render :show, status: :created, location: @author }
      else
        format.html {render :new}
        format.json {render json: @author.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html {redirect_to @author, notice: 'Author was successfully updated.'}
        format.json {render :show, status: :ok, location: @author }
      else
        format.html {render :edit}
        format.json {render json: @author.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy

    @author.destroy
    respond_to do |format|
      format.html {redirect_to authors_url, notice: 'Author was successfully destroyed.'}
      format.json {head :no_content }
    end
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit :name, :sub_name,
        :birth_date, :death_date, :style, :picture
    end
end
