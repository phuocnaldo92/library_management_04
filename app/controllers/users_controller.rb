class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def index
    if params[:search_in] == "books"
      redirect_to url_for(:controller => :books, :action => :index, :keyword => params[:keywords])
    end
    if params[:search_in] == "authors"
      redirect_to url_for(:controller => :authors, :action => :index, :keyword => params[:keywords])
    end
    @user = User.all
  end

  def export
    @user = User.all
    respond_to do |format|
      format.html
      format.csv {send_data @user.to_csv, filename: "users-#{Date.today}.csv"}
    end
  end
  
  def show
    @user = User.find_by id: params[:id]
    if @user.nil?
      render :error
    end
  end

  def create
    @user = User.new user_params
    @user.role = 1
    if @user.save
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
      params_id = params[:id].to_i
      user = User.find_by id: params_id
      if !user.nil?
        user.destroy
      end
      redirect_to users_path
  end

  

  private
    
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
