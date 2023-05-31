class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :brand
      t.string :status
      t.integer :quantity
      t.integer :construction_site_id

      t.timestamps
    end
  end
end
