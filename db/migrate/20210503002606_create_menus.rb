class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.text :caption
      t.integer :amount

      t.timestamps
    end
  end
end
