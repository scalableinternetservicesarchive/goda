class HitcherLikesController < ApplicationController
  before_action :set_hitcher_like, only: [:show, :edit, :update, :destroy]

  # GET /hitcher_likes
  # GET /hitcher_likes.json
  def index
    @hitcher_likes = HitcherLike.all
  end

  # GET /hitcher_likes/1
  # GET /hitcher_likes/1.json
  def show
  end

  # GET /hitcher_likes/new
  def new
    @hitcher_like = HitcherLike.new
  end

  # GET /hitcher_likes/1/edit
  def edit
  end

  # POST /hitcher_likes
  # POST /hitcher_likes.json
  def create
    @user = current_user
    hitcher = Hitcher.find(params[:hitcher_id])
    @hitcher_like = @user.add_hitcher_like(hitcher.id)
    hitcher.like_num = @hitcher_like.quantity
    hitcher.save 
    hitcher.user.like_num = hitcher.user.total
    hitcher.user.save(validate: false)
    
    respond_to do |format|
      if @hitcher_like.save
        format.html { redirect_to hitchers_path, notice: 'Hitcher like was successfully created.' }
        format.json { render :show, status: :created, location: @hitcher_like }
      else
        format.html { render :new }
        format.json { render json: @hitcher_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hitcher_likes/1
  # PATCH/PUT /hitcher_likes/1.json
  def update
    respond_to do |format|
      if @hitcher_like.update(hitcher_like_params)
        format.html { redirect_to @hitcher_like, notice: 'Hitcher like was successfully updated.' }
        format.json { render :show, status: :ok, location: @hitcher_like }
      else
        format.html { render :edit }
        format.json { render json: @hitcher_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hitcher_likes/1
  # DELETE /hitcher_likes/1.json
  def destroy
    @hitcher_like.destroy
    respond_to do |format|
      format.html { redirect_to hitcher_likes_url, notice: 'Hitcher like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hitcher_like
      @hitcher_like = HitcherLike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hitcher_like_params
      params.require(:hitcher_like).permit(:hitcher_id, :user_id, :quantity)
    end
end
