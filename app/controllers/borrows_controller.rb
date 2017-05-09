class BorrowsController < ApplicationController
  
  before_action :get_all_oder, only: [:create]
  before_action :check_admin, only: [:index, :destroy]
  before_action :get_type, only: [:index, :destroy, :update]
  def index
    if params[:search_in] == "books"
      redirect_to url_for(:controller => :books, :action => :index, :keyword => params[:keywords])
    end
    if params[:search_in] == "authors"
      redirect_to url_for(:controller => :authors, :action => :index, :keyword => params[:keywords])
    end    
    if @params_type == 1
      @borrow_books = BorrowBook.get_all_borrow_1
    else
      @borrow_books = BorrowBook.get_all_borrow_2
    end
  end

  def create
    @count = 0
    @total = @order.size
    delete_array_data = []
    @order.each_with_index{|in_arr, index|
      br = BorrowBook.new(user_id: in_arr["user_id"], book_id: in_arr["book_id"], from_date: in_arr["from_date"], to_date: in_arr["to_date"], number_borrow: in_arr["number_borrow"], status: 1)
      if br.save
        delete_array_data[@count] = index
        @count += 1          
      end
    }

    delete_array_data.each_with_index{|index|
      @order.delete_at(delete_array_data.size - 1 -index)
    }
    @alert = "#{@count}/#{@total} successfully"
  	respond_to do |format| 
      format.js    
    end
  end

  def destroy
      params_id = params[:id].to_i
      borrow_book = BorrowBook.find_by id: params_id
      if !borrow_book.nil?
        borrow_book.destroy
      end
      redirect_to borrows_path + "?type=" + @params_type.to_s
  end

  def update
      params_id = params[:id].to_i
      borrow_book = BorrowBook.find_by id: params_id
      if !borrow_book.nil?
        if (BorrowBook.count_total_borrow borrow_book[:book_id], borrow_book[:number_borrow]) <= ((Book.find_by id: borrow_book[:book_id])[:total_book]).to_i
          borrow_book[:status] = "2"
          borrow_book.save
        end
      end
      redirect_to borrows_path + "?type=" + @params_type.to_s
  end

  private

  def get_type
	  @params_type = params[:type].to_i
  end

  def get_all_oder
    @order = current_order
  end

  def check_admin
    if current_user.role == 0
    else
      redirect_to root_path
    end
  end
end
