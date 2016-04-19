require 'action_view'
include ActionView::Helpers::NumberHelper
include ActionView::Helpers::TextHelper

class OrganizationsController < ApplicationController
  def index
  	@orgs = Organization.all

  end

  def view
  	@org = Organization.find(params[:id])
    @drive = Drive.find(@org.drive_id)
  	render 'view'
  end

  def new
    @org = Organization.new
  end

  def create
    @org = Organization.new(org_params)
    address = @org.address + " " + @org.address_line_2||=""

    coords = Geocoder.search(address)
    latitude = coords[0] == nil ? nil : coords[0].latitude
    longitude = coords[0] == nil ? nil : coords[0].longitude


    @org.update(:lat => latitude, :lon => longitude)

    if @org.save
      # @drive = Drive.find_by_name(params[:organization][:drives][:name])
      #if (@drive == nil)
      @drive =  Drive.new(drive_params)
      @drive.save
      #end

      @drive.organizations << @org

      # change to redirect to logged in state page
      log_in_org @org
        redirect_to orgs_registry_path
    else
        render 'new'
    end
  end

  private
      def org_params
        params.require(:organization).permit(:name, :phone_number, :password,:address, :sun_open, :sun_close, :mon_open, :mon_close, :tues_open, :tues_close, :thurs_open, :thurs_close, :fri_open, :fri_close, :sat_open, :sat_close,:address_line_2, :about, :username, drives_attributes: [:name, :city, :state, :about])
      end

      def drive_params
        params.require(:organization).require(:drives).permit(:name, :city, :state, :about)
      end
end
