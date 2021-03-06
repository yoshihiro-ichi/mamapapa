class FacilitiesController < ApplicationController
  before_action :set_facility, only:[ :show,:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index,:new, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]
  before_action :login_check, only:[:edit,:destroy]
  def index
    @facilities = Facility.all.order(created_at: :desc).page(params[:page]).per(10)
    @q = Facility.ransack(params[:q])
    @faciliti = @q.result(distinct: true)
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = current_user.facilities.build(facility_params)

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
    @comments = @facility.comments.order(created_at: :desc)
    @comment = @facility.comments.build
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

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Facility.ransack(params[:q])
  end

  def facility_params
    params.require(:facility).permit(:title,:content,:types,:prefecture,:address,:types, :image,:image_cache,:use_id)
  end

  def set_facility
    @facility  = Facility.find(params[:id])
  end

  def login_check
    unless Facility.find(params[:id]).user_id == current_user.id
      flash[:alert]="不正な操作です"
      redirect_to facilities_path
    end
  end
end
