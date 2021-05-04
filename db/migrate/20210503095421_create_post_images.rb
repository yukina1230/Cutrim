class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :post_image_id
      t.text :description
      t.string :dog_breed

      t.timestamps
    end
  end
end
