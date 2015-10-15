class DriversController < ApplicationController
  def index
     @drivers = Driver.all
  end
  def new
     @driver = Driver.new
  end
  def create
     @driver = Driver.new(driver_params)
     @driver.save
     redirect_to @driver    	
  end

  def show
    @driver = Driver.find(params[:id]) 
  end

  private 
  def driver_params
    params.require(:driver).permit(:departure,:destination,:price, :depart_time,:estimated_arrival_time, :description, :car_type, :passenger_num, :contact_info)
  end
end
