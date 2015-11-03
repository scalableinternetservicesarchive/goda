class DrivercommentsController < ApplicationController
    def create
        @driver = Driver.find(params[:driver_id])
        @drivercomment = @driver.drivercomments.create(drivercomment_params)
        redirect_to driver_path(@driver)
    end

    private
        def drivercomment_params
            params.require(:drivercomment).permit(:commenter, :body)
        end
end
