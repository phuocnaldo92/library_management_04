class StaticPagesController < ApplicationController

  def home
    @books_top6 = Book.get_top6_create(6)
  end

  def help
  end

  def about
  end
end
