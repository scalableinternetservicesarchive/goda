class HitchercommentsController < ApplicationController
  def create
    @hitcher = Hitcher.find(params[:hitcher_id])
    @hitchercomment = @hitcher.hitchercomments.create(hitchercomment_params)
    redirect_to hitcher_path(@hitcher)
  end
 
  private
    def hitchercomment_params
      params.require(:hitchercomment).permit(:commenter, :body)
    end

end
