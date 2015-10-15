class HitchersController < ApplicationController
  def index
     @hitchers = Hitcher.all
  end
  def new
     @hitcher = Hitcher.new
  end
  def create
     @hitcher = Hitcher.new(hitcher_params)
     @hitcher.save
     redirect_to @hitcher
  end

  def show
  end

  private
  def hitcher_params
    params.require(:hitcher).permit(:departure, :destination, :depart_time, :arrival_time, :description, :num, :contact_info)
  end
end
