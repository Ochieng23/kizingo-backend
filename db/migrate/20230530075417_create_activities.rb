class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :phase_id
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
