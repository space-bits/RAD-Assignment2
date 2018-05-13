class AddGravatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :grav_url, :string
  end
end
