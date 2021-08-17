class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user,only:[:edit]

  def show
    @facilities = @user.facilities
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "プロフィールを更新しました！"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image,:image_cache, :encrypted_password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_correct_user
    if current_user.id !=  params[:id].to_i
      redirect_to new_user_session_path
    end
  end
end
