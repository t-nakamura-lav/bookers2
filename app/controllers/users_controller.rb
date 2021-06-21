class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def create
    @user = User.new(user_params)
     if @user.save
     redirect_to user_path(@user.id), notice: 'Signed in successfully.'
     else
       render :new
     end
  end

  def edit
    @user = User.find(params[:id])
      if @user != current_user
        redirect_to user_path(current_user)
      end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
