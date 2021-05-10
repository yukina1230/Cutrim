class RemovePrefectureFromSalonUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :salon_users, :prefecture, :string
  end
end
