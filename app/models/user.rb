require 'geocoder'

class User < ActiveRecord::Base
	 has_secure_password
	 has_many :pledges

	 def is_within_radius(org, radius)


	 	if org.lat!=nil and org.lon!=nil and self.lat!=nil and self.lon!=nil
		 	org_loc = [org.lat, org.lon]
		 	self_loc = [self.lat, self.lon]

		 	dist = Geocoder::Calculations.distance_between( org_loc, self_loc, {:units=> :mi})

		 	if dist <= radius.to_i
		 		return true
		 	else
		 		return false
		 	end
		 else
		 	return false
		 end
	 end

	 def get_dist(org)
	 	org_loc = [org.lat, org.lon]
		self_loc = [self.lat, self.lon, org.lat, org.lon]
	 	# dist = Geocoder.distance_between( org_loc, self_loc, {:units=> :mi})
	 end


end
