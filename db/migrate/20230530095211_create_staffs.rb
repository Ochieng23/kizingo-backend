class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.integer :age
      t.integer :phone_number
      t.integer :national_id
      t.string :payrate

      t.timestamps
    end
  end
end
