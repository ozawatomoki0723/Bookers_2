class BooksController < ApplicationController
  before_action :correct_user, only: [:edit]

  def new
    @book = Book.new
  end

  def index
    @user = current_user
    @book = Book.new

    @books = Book.all
    @users = User.all
  end

  def show
    @user = current_user
    @book = Book.new
    @books = Book.find(params[:id])
    @users = @books.user
  end

  def edit
    @user = current_user
    @book = Book.new
    @books = Book.find(params[:id])
    @users = @books.user
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @user = current_user
    @books = Book.all
    if @book.save
    flash[:notice] = "You have creatad book successfully."
    redirect_to book_path(id: @book.id)
    else
    render action: :index
    end
  end

  def update
    # @books.user_id = current_user
    @user = current_user
    # @book.user = current_user
    @books = Book.find(params[:id])
    if @books.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(id: @book)
    else
    render action: :edit
    end
  end

  def destroy
    @books = Book.find(params[:id])
    # @book.user = current_user
    @books.destroy
    redirect_to books_path(@book)
  end

  private

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    if @user != current_user
    redirect_to books_path
    end
  end

   def book_params
     params.require(:book).permit(:user_id, :title, :body)
   end
end