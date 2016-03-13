class CreateRegistryItems < ActiveRecord::Migration
  def change
    create_table :registry_items do |t|
      t.string :name
      t.integer :amount_needed
      t.integer :amount_pledged
      t.integer :amount_received
      t.references :organization, index: true

      t.timestamps
    end
  end
end
