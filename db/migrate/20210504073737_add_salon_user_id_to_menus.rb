class AddSalonUserIdToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :salon_user_id, :integer
  end
end
