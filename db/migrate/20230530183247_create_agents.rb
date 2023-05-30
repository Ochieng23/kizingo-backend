class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.string :avatar
      t.string :name
      t.string :email
      t.integer :phone_number
      t.integer :property_id

      t.timestamps
    end
  end
end
