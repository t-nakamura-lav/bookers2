class BooksController < ApplicationController
  def index
    @book = Book.new

  end

  def show
  end

  def edit
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/show'
  end

  private

  def book_params
    params.require(:list).permit(:title, :opinion)
  end
end
