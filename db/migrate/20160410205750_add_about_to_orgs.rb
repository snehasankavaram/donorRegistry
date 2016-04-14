class AddAboutToOrgs < ActiveRecord::Migration
  def change
  	add_column :organizations, :link, :string

  	add_column :organizations, :sun_open, :datetime
  	add_column :organizations, :sun_close, :datetime

  	add_column :organizations, :mon_open, :datetime
  	add_column :organizations, :mon_close, :datetime

  	add_column :organizations, :tues_open, :datetime
  	add_column :organizations, :tues_close, :datetime

  	add_column :organizations, :wed_open, :datetime
  	add_column :organizations, :wed_close, :datetime

  	add_column :organizations, :thurs_open, :datetime
  	add_column :organizations, :thurs_close, :datetime

  	add_column :organizations, :fri_open, :datetime
  	add_column :organizations, :fri_close, :datetime

  	add_column :organizations, :sat_open, :datetime
  	add_column :organizations, :sat_close, :datetime

  	add_column :pledges, :org_id, :integer
  end
end
