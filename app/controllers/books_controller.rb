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
      redirect_to book_path(@book), notice: "create successfully"
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
      redirect_to @book, notice: "update successfully"
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = 'delete sucsessfully'
    else
      flash[:alert] = 'Failed to delete the book.'
    end
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
