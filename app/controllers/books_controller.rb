class BooksController < ApplicationController
  def index
  	@books=Book.all
  	@book=Book.new
  end

  def show
  	@book= Book.find(params[:id])
  end

  def create
  	#create newの意味
  	@book=Book.new(book_params)
  	if@book.save
  	flash[:succees]="Book was successfully created."
  	redirect_to book_path(@book.id)
    else
    @books=Book.all

    render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book= Book.find(params[:id])
  	if@book.update(book_params)
  	flash[:succees]="Book was successfully update."
  	redirect_to book_path(@book)
  else
  	render :edit
  end
  end
  def destroy
  	@book=Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end
  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
