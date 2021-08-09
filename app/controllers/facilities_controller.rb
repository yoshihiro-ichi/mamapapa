class FacilitiesController < ApplicationController

  def index
    @facilities = Facility.all
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
        redirect_to facilities_path,notice:"投稿しました"
    else
     render :new
    end
  end
  private
  def facility_params
    params.require(:facility).permit(:title,:content,:types,:prefecture,:address,:types, :image)
  end
end
