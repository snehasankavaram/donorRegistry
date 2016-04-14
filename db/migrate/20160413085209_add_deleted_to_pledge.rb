class AddDeletedToPledge < ActiveRecord::Migration
  def change
  	add_column :pledges, :item_deleted, :boolean
  end
end
