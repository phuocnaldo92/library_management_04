class RatingsController < ApplicationController

  before_action :require_login, only: :create

  def create
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
