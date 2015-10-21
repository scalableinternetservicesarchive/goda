class UsersController < ApplicationController
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
           flash[:success] = "Welcome to GoDa!"
           redirect_to @user
        else
           render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:name,:password,:password_confirmation)
    end
end