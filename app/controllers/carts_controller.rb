class CartsController < ApplicationController
    # layout "application2"
    layout "application2", only:[:show]
    before_action :find_book, only: [:show]
    before_action :check_login, only: [:create]
    def index
      @order = current_order
      @book = Book.new
    end

    def show
      
    end

    def create
      @order = current_order
      params_cart = params[:cart]
      from_date = Date.new params_cart["from_date(1i)"].to_i, params_cart["from_date(2i)"].to_i, params_cart["from_date(3i)"].to_i
      to_date = Date.new params_cart["to_date(1i)"].to_i, params_cart["to_date(2i)"].to_i, params_cart["to_date(3i)"].to_i
      @order_item = BorrowBook.new(user_id: @current_user.id, book_id: params[:cart][:book_id].to_i, from_date: from_date, to_date: to_date, number_borrow: params[:cart][:number_borrow], status: 1)
      handling_data @order, @order_item
      render :exit
    end


    def update
    end

    def destroy
    end

    private

    def find_book
      @book = Book.find_by id: params[:id]
    end

    def check_login
      if logged_in?
      else
        render :exit
      end
    end

    # def order_item_params
    #   params.require(:borrow_book).permit(:number_borrow, :from_date, :to_date)
    # end
end
