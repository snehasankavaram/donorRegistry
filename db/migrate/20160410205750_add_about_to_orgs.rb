class AddAboutToOrgs < ActiveRecord::Migration
  def change
  	add_column :organizations, :link, :string

  	add_column :organizations, :sun_open, :date_time
  	add_column :organizations, :sun_close, :date_time

  	add_column :organizations, :mon_open, :date_time
  	add_column :organizations, :mon_close, :date_time

  	add_column :organizations, :tues_open, :date_time
  	add_column :organizations, :tues_close, :date_time

  	add_column :organizations, :wed_open, :date_time
  	add_column :organizations, :wed_close, :date_time

  	add_column :organizations, :thurs_open, :date_time
  	add_column :organizations, :thurs_close, :date_time

  	add_column :organizations, :fri_open, :date_time
  	add_column :organizations, :fri_close, :date_time

  	add_column :organizations, :sat_open, :date_time
  	add_column :organizations, :sat_close, :date_time

  	add_column :pledges, :org_id, :integer
  end
end
