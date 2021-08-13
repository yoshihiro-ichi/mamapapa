class FavoritesController < ApplicationController

def index
  @favorites = current_user.favorites.all
end

  def create
    favorite = current_user.favorites.create(facility_id: params[:facility_id])
    redirect_to facilities_path, notice: "#{favorite.facility.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to facilities_path, notice: "#{favorite.facility.user.name}さんのブログをお気に入り解除しました"
  end
end
