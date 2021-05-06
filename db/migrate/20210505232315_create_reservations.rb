class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :salon_user_id
      t.string :dog_breed
      t.string :dog_name
      t.integer :dog_gender
      t.date :dog_birth
      t.string :menu
      t.date :day
      t.string :time
      t.text :request
      t.datetime :start_time
      t.index ["user_id"], name: "index_reservations_on_user_id"
      t.index ["salon_user_id"], name: "index_reservations_on_salon_user_id"

      t.timestamps
    end
  end
end
