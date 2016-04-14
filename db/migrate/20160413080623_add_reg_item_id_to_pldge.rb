class AddRegItemIdToPldge < ActiveRecord::Migration
  def change
  	add_column :pledges, :registry_item_id, :integer
  end
end
