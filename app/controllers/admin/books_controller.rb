class Admin::BooksController < ApplicationController

  def index
    @books = Book.paginate page: params[:page], per_page: Settings.per_page_book
  end
end
