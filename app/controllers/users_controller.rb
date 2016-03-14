class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
		address = @user.location

    	coords = Geocoder.search(address)
    	latitude = coords[0] == nil ? nil : coords[0].latitude
    	longitude = coords[0] == nil ? nil : coords[0].longitude

    	@user.update(:lat => latitude, :lon => longitude)

    	if @user.save
    		# change to redirect to logged in state page
    		log_in @user
      		redirect_to '/organizations'
    	else
      		render 'new'
      	end
    end

	def show
 		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def login
		@users = User.all
		render 'login'
	end

	def indexForOrgs
		@radius = 0
		@donors = User.all
		@donor_count = 0
		render 'index_org'
	end

	def filterDonors
		radius = params[:users_controller][:radius]
		donors = []

		dists = []

		for donor in User.all
			#dists << donor.get_dist(current_org)
			if donor.is_within_radius(current_org, radius)
				donors << donor
			end
		end

		@radius = radius
		@donors = donors
		@donor_count = donors.length
		render 'index_org'
		#render json: { donors: donors}
	end

	def message
		radius = params[:users_controller][:radius]
		message_body = params[:users_controller][:message]

		for donor in User.all
			if donor.is_within_radius(current_org, radius)
				#send message to donor
				uri = 'http://donormanage-donormanage.c9users.io/sms'
				#+14082210827
				client = HTTPClient.new
				body = { 'number' => '+14088576536', 'message' => message_body + donor.phone_number + donor.name}
				res = client.post(uri, body)
			end
		end
		render json: { response: res}
	end

	private
	    def user_params
	      params.require(:user).permit(:name, :phone_number, :password,:location, :username)
    end

end
