class BooksController < ApplicationController

  include BooksHelper

  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.paginate page: params[:page], per_page: Settings.per_page_book
  end

  def show
    if UserActionBook.count_rating(@book.id).nonzero?
      count_point_rating = UserActionBook.count_point_rating(@book.id).round
      @render_rating = render_rating count_point_rating, @book.id
    else
      @render_rating = render_rating Settings.number_zero, @book.id
    end
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html {redirect_to @book, notice: t("success_created")}
        format.json {render :show, status: :created, location: @book}
      else
        format.html {render :new}
        format.json {render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html {redirect_to @book, notice: t("success_updated")}
        format.json {render :show, status: :ok, location: @book}
      else
        format.html {render :edit}
        format.json {render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html {redirect_to books_url, notice: t("success_destroyed")}
      format.json {head :no_content}
    end
  end

  private

    def find_book
      @book = Book.find_by id: params[:id]
    end

    def book_params
      params.require(:book).permit :category_id, :number_of_page,
        :publisher_id, :total_book, :title, :picture, :description
    end
end
