require 'action_view'
include ActionView::Helpers::NumberHelper
include ActionView::Helpers::TextHelper

class OrganizationsController < ApplicationController
  def index
  	@orgs = Organization.all

  end

  def show
    @org = Organization.find(params[:id])

  end

  def view
  	@org = Organization.find(params[:id])
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
      # change to redirect to logged in state page
      log_in_org @org
        redirect_to orgs_registry_path
    else
        render 'new'
    end
  end

  private
      def org_params
        params.require(:organization).permit(:name, :phone_number, :password,:address, :address_line_2, :about, :username)
      end
end
