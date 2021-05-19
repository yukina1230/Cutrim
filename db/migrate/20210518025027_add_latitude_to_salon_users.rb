class AddLatitudeToSalonUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :salon_users, :latitude, :float
    add_column :salon_users, :longitude, :float
  end
end
