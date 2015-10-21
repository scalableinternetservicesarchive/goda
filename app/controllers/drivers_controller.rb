class DriversController < ApplicationController
  before_action :logged_in_user, only: [:create]
  def index
      @drivers = Driver.all
    # @drivers = current_user.drivers
  end
  def new
     @driver = Driver.new
  end
    
    def destroy
        @driver = Driver.find(params[:id])
        @driver.destroy
        redirect_to current_user
    end
    
    def edit

        @driver = Driver.find(params[:id])
        
    end 

    def update
        @driver = Driver.find(params[:id])
        if @driver.update(driver_params)
            redirect_to current_user
        else 
            render "edit"
        end
    end   

  def create
    
    @driver = current_user.drivers.build(driver_params)
    
    if  @driver.save
        flash[:success] = "Driver post created!"
        redirect_to current_user
    else
        render "new"
    end    	
  end

  def show
     #@drivers = current_user.drivers
     @driver = Driver.find(params[:id]) 
  end

  private 
  def driver_params
    params.require(:driver).permit(:departure,:destination,:price, :depart_time,:estimated_arrival_time, :description, :car_type, :passenger_num, :contact_info)
  end
end
