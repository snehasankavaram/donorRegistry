class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :phone_number
      t.string :location

      t.timestamps
    end
  end
end
