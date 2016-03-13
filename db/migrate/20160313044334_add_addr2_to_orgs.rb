class AddAddr2ToOrgs < ActiveRecord::Migration
  def change
  	add_column :organizations, :address_line_2, :string
  end
end
