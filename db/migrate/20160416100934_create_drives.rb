class CreateDrives < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.string :name
      t.string :city
      t.string :state
      t.text :about

      t.timestamps
    end
  end
end
