class CreateConstructionSites < ActiveRecord::Migration[7.0]
  def change
    create_table :construction_sites do |t|
      t.string :name
      t.text :description
      t.string :media
      t.integer :inventory_id
      t.integer :staff_id
      t.integer :machinery_id
      t.integer :legal_id
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
