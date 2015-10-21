class HitchersController < ApplicationController
  def index
     @hitchers = Hitcher.all
  end
  def new
     @hitcher = Hitcher.new
  end

  def create
    @hitcher = current_user.hitchers.build(hitcher_params)

    if @hitcher.save
        flash[:success] = "Hitcher post created!"
        redirect_to root_url
    else
        render "new"
    end
  end

  def show
     @hitcher = Hitcher.find(params[:id])
  end

  private
  def hitcher_params
    params.require(:hitcher).permit(:departure, :destination, :depart_time, :arrival_time, :description, :num, :contact_info)
  end
end
