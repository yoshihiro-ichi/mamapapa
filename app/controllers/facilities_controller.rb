class FacilitiesController < ApplicationController
  before_action :set_facility, only:[ :show,:edit, :update, :destroy]
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
  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def facility_params
    params.require(:facility).permit(:title,:content,:types,:prefecture,:address,:types, :image)
  end

  def set_facility
    @facility  = Facility.find(params[:id])
  end
end
