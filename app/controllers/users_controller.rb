class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]

  def index
    @user = current_user
    @book = Book.new

    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new

    @books = @user.books
  end

  def edit
    @user =  User.find(params[:id])
    @book = Book.new

    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path(id: @user.id)
  end

  def update
    @user = current_user
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(id: @user.id)
    else
    render action: :edit
    end
  end

  private
  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end