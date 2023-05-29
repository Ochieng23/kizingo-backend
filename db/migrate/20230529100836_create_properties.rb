class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :location
      t.string :media
      t.string :description
      t.string :listing_type
      t.string :sqft
      t.string :price

      t.timestamps
    end
  end
end
