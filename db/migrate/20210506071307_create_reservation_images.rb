class CreateReservationImages < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_images do |t|
      t.integer :reservation_id
      t.string :image_id

      t.timestamps
    end
  end
end
