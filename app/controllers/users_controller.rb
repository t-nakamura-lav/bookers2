class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index

  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def edit
    @user = User.find(params[:id])
    @post_image = PostImage.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    @post_images = PostImage.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def post_image_params
    params.require(:post_image).permit(:name, :introduction, :profile_image)
  end
end
