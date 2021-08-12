class FacilitiesController < ApplicationController
  before_action :set_facility, only:[ :show,:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  def index
    @facilities = Facility.all
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Fcility.new(facility_params)
    @facility = current_user.id
    if params[:back]
      render :new
    else
      if @facility.save
        redirect_to facilities_path,notice:"投稿しました"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(facility_id: @facility.id)
  end

  def edit
  end

  def update
      if @facility.update(facility_params)
        redirect_to facilities_path,notice:"更新しました"
      else
        render :edit
    end
  end

  def destroy
    @facility.destroy
    redirect_to facilities_path,notice:"投稿を削除しました。"
  end
  def confirm
        @facility = current_user.facilities.build(facility_params)
      render :new if @facility.invalid?
  end
  private
  def facility_params
    params.require(:facility).permit(:title,:content,:types,:prefecture,:address,:types, :image,:image_cache,:use_id)
  end

  def set_facility
    @facility  = Facility.find(params[:id])
  end
end
