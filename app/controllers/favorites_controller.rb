class FavoritesController < ApplicationController

def index
  @favorites = current_user.favorites
end

  def create
    favorite = current_user.favorites.create(facility_id: params[:facility_id])
    # favorites = User.find_by(id: favorite.facility_id)
    redirect_to facility_path(favorite.facility_id), notice: "#{favorite.facility.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to facility_path(favorite.facility_id), notice: "#{favorite.facility.user.name}さんのブログをお気に入り解除しました"
  end
end
