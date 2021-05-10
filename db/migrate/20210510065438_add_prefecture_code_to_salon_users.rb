class AddPrefectureCodeToSalonUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :salon_users, :prefecture_code, :string
  end
end
