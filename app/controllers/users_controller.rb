class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :img,:img_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
