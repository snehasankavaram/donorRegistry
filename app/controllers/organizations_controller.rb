class OrganizationsController < ApplicationController
  def index
  	@orgs = Organization.all

  end

  def show
    @org = Organization.find(params[:id])

  end

  def view
  	@org = Organization.find(params[:id])
    address = @org.address


    coords = Geocoder.search(address)
    latitude = coords[0] == nil ? nil : coords[0].latitude
    longitude = coords[0] == nil ? nil : coords[0].longitude

    @org.update(:lat => latitude, :lon => longitude)
    @org.save

    @hash = Gmaps4rails.build_markers(@org) do |org, marker|
      marker.lat org.lat
      marker.lng org.lon
    end
  	render 'view'

  end

  def new
  end
end
