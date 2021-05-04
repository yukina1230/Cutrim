class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :salon_user_id
      t.string :dog_breed
      t.text :caption

      t.timestamps
    end
  end
end
