class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.float :lat
      t.float :lon
      t.string :address
      t.string :name
      t.text :about

      t.timestamps
    end
  end
end
