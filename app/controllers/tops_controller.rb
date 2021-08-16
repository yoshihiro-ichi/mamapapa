class TopsController < ApplicationController
def index
 @tops = Top.all
end
