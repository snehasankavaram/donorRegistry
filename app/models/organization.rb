class Organization < ActiveRecord::Base
	has_many :registry_items
	belongs_to :drive
	has_secure_password
end
