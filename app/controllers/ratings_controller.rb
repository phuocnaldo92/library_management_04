class RatingsController < ApplicationController

  before_action :require_login, only: :create

  def create
    if  params[:like] == "like"
      @result = {status: "success like", like: params[:like]}
      useractionbook = UserActionBook.new(user_id: current_user.id,
        book_id: params[:book_id], action: 7)
      unless useractionbook.save
        @result.status = I18n.t "unsuccess"
      end
      respond_to do |format|
          format.json {render json: @result}
      end
      return
    end

    if  params[:like] == "unlike"
      @result = {status: "success unlike", like: params[:like]}
      useractionbook = UserActionBook.find_by book_id: params[:book_id], user_id: current_user.id, action: 7
      unless useractionbook.destroy
        @result.status = I18n.t "unsuccess"
      end
      respond_to do |format|
          format.json {render json: @result}
      end
      return
    end

    if  !params[:comment].nil?
      @result = {status: I18n.t("success_rate"), comment: params[:comment], user: current_user.email}
      useractionbook = UserActionBook.new(user_id: current_user.id,
        book_id: params[:book_id], action: 6, comment: params[:comment])
      unless useractionbook.save
        @result.status = I18n.t "unsuccess"
      end
      respond_to do |format|
          format.json {render json: @result}
      end
      return
    end
    @result = {status: I18n.t("success_rate"),
      number_rating: params[:number_rating], book_id: params[:book_id]}
    if UserActionBook.check_exist_rating(params[:book_id], current_user.id) ==
      Settings.number_zero
      useractionbook = UserActionBook.new(user_id: current_user.id,
        book_id: params[:book_id], action: params[:number_rating])
      unless useractionbook.save
        @result.status = I18n.t "unsuccess"
      end
      respond_to do |format|
          format.json {render json: @result}
      end
    else
        update
    end
  end

  def update
    useractionbook =
      UserActionBook.get_exist_rating params[:book_id], current_user.id
    useractionbook.action = params[:number_rating]
    unless useractionbook.save
      @result.status = I18n.t "unsuccess"
    end
    respond_to do |format|
      format.json {render json: @result}
    end
  end

  private

    def require_login
      unless logged_in?
        return
      end
    end
end
