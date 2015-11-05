class DriverLikesController < ApplicationController
  before_action :set_driver_like, only: [:show, :edit, :update, :destroy]

  # GET /driver_likes
  # GET /driver_likes.json
  def index
    @driver_likes = DriverLike.all
  end

  # GET /driver_likes/1
  # GET /driver_likes/1.json
  def show
  end

  # GET /driver_likes/new
  def new
    @driver_like = DriverLike.new
  end

  # GET /driver_likes/1/edit
  def edit
  end

  # POST /driver_likes
  # POST /driver_likes.json
  def create
    
    driver = Driver.find(params[:driver_id])
    
    @driver_likes =  driver.driver_likes
    @driver_like = @driver_likes.first
    if !@driver_like.nil?
                @driver_like.quantity += 1
    else
                @driver_like = driver_likes.build(driver_id: driver.id)
    end
        
    driver.like_num = @driver_like.quantity
    driver.save
    driver.user.like_num = driver.user.total
    driver.user.driver_like_num = driver.user.total_driver
    driver.user.save(validate: false)
   	
    respond_to do |format|
      if @driver_like.save
        format.html { redirect_to drivers_path }
        format.json { render :show, status: :created, location: @driver_like }
      else
        format.html { render :new }
        format.json { render json: @driver_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driver_likes/1
  # PATCH/PUT /driver_likes/1.json
  def update
    respond_to do |format|
      if @driver_like.update(driver_like_params)
        format.html { redirect_to @driver_like, notice: 'Driver like was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver_like }
      else
        format.html { render :edit }
        format.json { render json: @driver_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver_likes/1
  # DELETE /driver_likes/1.json
  def destroy
    @driver_like.destroy
    respond_to do |format|
      format.html { redirect_to driver_likes_url, notice: 'Driver like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver_like
      @driver_like = DriverLike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_like_params
      params.require(:driver_like).permit(:driver_id, :quantity)
    end
end
