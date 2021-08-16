class TopController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
     if user_signed_in?
       redirect_to facilities_path(current_user)
     end
   end
end
