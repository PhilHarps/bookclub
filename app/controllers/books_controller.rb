class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update]

  def index
    @books = Book.all
  end

  def show
  end

  # Display the form
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:alert] = "Your book has been saved"
      redirect_to root_path
    else
      flash[:alert] = book.errors.full_messages.join('<br>')
      redirect_to new_book_path
    end
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to @book
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    return params.require(:book).permit(:title, :pub_year, :author_id)
  end
end
