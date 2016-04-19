class DrivesController < ApplicationController
	def create
	    @drive = Drive.new(drive_params)
	    @drive.save
    end

    private
      def drive_params
        params.require(:organization).permit(:name, :city, :state, :about)
      end
end
