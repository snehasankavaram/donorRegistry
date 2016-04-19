class AddOrgsToDrive < ActiveRecord::Migration
  def change
  	add_reference :organizations, :drive, index: true
  end
end
