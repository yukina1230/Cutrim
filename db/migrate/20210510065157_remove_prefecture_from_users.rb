class RemovePrefectureFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :prefecture, :string
  end
end
