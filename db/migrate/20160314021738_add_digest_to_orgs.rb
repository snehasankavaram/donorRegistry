class AddDigestToOrgs < ActiveRecord::Migration
  def change
  	add_column :organizations, :password_digest, :string
  end
end
