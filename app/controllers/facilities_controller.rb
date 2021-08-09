class FacilitiesController < ApplicationController

  def index
    @facilities = Facility.all
  end

  def new
    @facility = Facility.new
  end
end
