class UsersController < ApplicationController
   
    def list

		@users = User.order(like_num: :desc)
	

        
    end
 
    def listdriver
	
		@users = User.order(driver_like_num: :desc)
	
    end
    
    def index
        @search = Search.new(User, params[:search], :per_page => 10000)
          @users = @search.run
    #     @users = User.all
    end    

    def listhitcher
	
		@users = User.order(hitcher_like_num: :desc)
	
	
    end

    def listall
#    @users = User.all
    end

    def userprofile
        @user = User.find(params[:user_id])
        @drivers = @user.drivers
        @hitchers = @user.hitchers
    end

    def new
        @user = User.new
    end
    def show
        @user = User.find(params[:id])
        @drivers = @user.drivers
        @hitchers = @user.hitchers
    end
    def create
        @user = User.new(user_params)
        if @user.save
	   log_in @user
           flash[:success] = "Welcome to GoDa!"
           redirect_to @user
        else
           render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:name,:password, :email,:password_confirmation)
    end
end
