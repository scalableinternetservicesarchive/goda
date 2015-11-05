class UsercommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @usercomment = @user.usercomments.create(usercomment_params)
    redirect_to userprofile_path(user_id: @user)
  end
 
  private
    def usercomment_params
      params.require(:usercomment).permit(:commenter, :body)
    end
end
