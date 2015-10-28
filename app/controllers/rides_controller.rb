class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create]
  # GET /rides
  # GET /rides.json
  def index
    @rides = Ride.all
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  # POST /rides
  # POST /rides.json
  def create
  #  if params['my_input'].to_i.to_s == params['my_input']    

    flag = Integer(params['my_input']) rescue false
    if !flag || params['my_input'].to_i <= 0
        flash[:notice] = 'Please input a positive number'
        redirect_to drivers_path
        return
    end
    

    @user = current_user
    driver = Driver.find(params[:driver_id])
    if driver.left > 0 && params[:'my_input'].to_i < driver.left
#    @ride = @user.book(driver.id, params[:quantity].to_i)
  
   	 @ride = @user.book(driver.id, params['my_input'].to_i)
 	# driver.left -= params[:quantity].to_i
 	 driver.left -= params['my_input'].to_i
   	 driver.save
   
   	 respond_to do |format|
      	if @ride.save
        	format.html { redirect_to @ride.user, notice: 'Ride was successfully created.' }
        	format.json { render :show, status: :created, location: @ride }
        else
        	format.html { render :new }
        	format.json { render json: @ride.errors, status: :unprocessable_entity }
      	end
    	end
     else 
	flash[:notice] = 'No enough space left!'
	redirect_to drivers_path
    end
    end

  # PATCH/PUT /rides/1
  # PATCH/PUT /rides/1.json
  def update
    respond_to do |format|
      if @ride.update(ride_params)
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { render :show, status: :ok, location: @ride }
      else
        format.html { render :edit }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    @ride.destroy
    respond_to do |format|
      format.html { redirect_to rides_url, notice: 'Ride was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.require(:ride).permit(:driver_id, :user_id)
    end
end
