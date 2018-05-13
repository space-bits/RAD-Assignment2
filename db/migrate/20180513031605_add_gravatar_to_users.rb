class AddGravatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :string, :grav_url
  end
end
