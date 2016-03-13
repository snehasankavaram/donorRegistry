class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.string :item_name
      t.string :quantity
      t.boolean :fulfilled
      t.datetime :delivery_date
      t.boolean :expired

      t.timestamps
    end
  end
end
