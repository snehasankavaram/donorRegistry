class Organization < ActiveRecord::Base
	has_many :registry_items
	has_secure_password
end
