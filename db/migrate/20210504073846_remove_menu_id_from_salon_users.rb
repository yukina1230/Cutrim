class RemoveMenuIdFromSalonUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :salon_users, :menu_id, :integer
  end
end
