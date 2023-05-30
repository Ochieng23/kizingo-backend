class CreateProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :progresses do |t|
      t.integer :subactivity_id
      t.string :progress_percentage
      t.date :progress_date

      t.timestamps
    end
  end
end
