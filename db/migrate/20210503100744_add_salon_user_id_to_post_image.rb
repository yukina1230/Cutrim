class AddSalonUserIdToPostImage < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :salon_user_id, :integer
  end
end
