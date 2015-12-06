class HitchersController < ApplicationController
  before_action :logged_in_user,  only: [:create, :edit, :destroy ]
  def index
    @flag = false
    @search = Search.new(Hitcher.includes(:user), params[:search], :per_page => 20) 
#    @hitchers = Hitcher.all
    if params[:search] == nil
        @hitchers = Hitcher.includes(:user).paginate(page: params[:page], per_page: 20) if stale?([Hitcher.includes(:user).paginate(page: params[:page], per_page: 20)])
        @flag = true
    else
        @flag = false
        @hitchers = @search.run
    end
  end
  def new
     @hitcher = Hitcher.new if stale?([current_user])
  end

  def create
    @hitcher = current_user.hitchers.build(hitcher_params)

    if @hitcher.save
        flash[:success] = "Hitcher post created!"
        redirect_to current_user
    else
        render "new"
    end
  end
       
    def edit
        @hitcher = Hitcher.find(params[:id])
   	if current_user != @hitcher.user	
		flash[:notice]="Wrong User!"
		redirect_to root_url
	end
    end
 
    def update
        @hitcher = Hitcher.find(params[:id])
        if @hitcher.update(hitcher_params)
            redirect_to current_user
        else
            render "edit"
        end    
    end


  def show
     @hitcher = Hitcher.find(params[:id])
     expires_in 3.minutes, :public => true
  end

  def destroy
     @hitcher = Hitcher.find(params[:id])
     if current_user == @hitcher.user
     	@hitcher.destroy
     	redirect_to current_user
     else
	flash[:notice]="Wrong User!"
	redirect_to root_url
     end
  end

  private
  def hitcher_params
    params.require(:hitcher).permit(:departure, :destination, :depart_time, :arrival_time, :description, :num, :contact_info)
  end
end
