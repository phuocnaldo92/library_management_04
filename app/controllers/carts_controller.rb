class CartsController < ApplicationController
    layout "application2"

    before_action :find_book, only: [:index]

    def index
        #open popup
    end

    def create
      @order = current_order
      @order_item = BorrowBook.new(user_id: 1, book_id: 1, from_date: "", to_date: "", number_borrow: 1, status: 1)
      @order[@order.count] = @order_item
      debugger
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

    def order_item_params
      params.require(:borrow_book).permit(:number_borrow, :from_date, :to_date)
    end
end
