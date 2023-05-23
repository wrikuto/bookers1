class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @errors = @book.errors
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "succsessfully"
    else
      @books = Book.all
      @errors = @book.errors
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    render :edit
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "updated"
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "deleted"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
