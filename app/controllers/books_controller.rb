class BooksController < ApplicationController

  include BooksHelper
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search_in] == "books"
      redirect_to url_for(:controller => :books, :action => :index, :keyword => params[:keywords])
    end
    if params[:search_in] == "authors"
      redirect_to url_for(:controller => :authors, :action => :index, :keyword => params[:keywords])
    end    
    if !params[:categori].nil?
      @books = Book.get_book(params[:categori].to_i).paginate page: params[:page], per_page: Settings.per_page_book
      return
    end
    @books = Book.search_book(params[:keyword]).paginate page: params[:page], per_page: Settings.per_page_book
  end

  def show
    Rails.cache.clear
    params_id = params[:id].to_i
    number_borrow_book = (BorrowBook.count_total_borrow params_id, 0)  
    @number_book = ((Book.find_by id: params_id)[:total_book]).to_i - number_borrow_book
    if UserActionBook.count_rating(@book.id).nonzero?
      count_point_rating = UserActionBook.count_point_rating(@book.id).round
      @render_rating = render_rating count_point_rating, @book.id
    else
      @render_rating = render_rating Settings.number_zero, @book.id
    end
    @render_comment = render_comment @book.id
    @render_like = render_like @book.id
    @render_count_like = render_count_like @book.id
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

        relation_book_author = RelationBookAuthor.new(author_params)
        relation_book_author[:book_id] = @book[:id]
        relation_book_author.save
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

    def author_params
      params.require(:book).require(:ralation_book_authors).permit :author_id        
    end
end
