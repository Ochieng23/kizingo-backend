class CreateHouseSeekers < ActiveRecord::Migration[7.0]
  def change
    create_table :house_seekers do |t|
      t.string :avatar
      t.string :user_code
      t.string :house_seeker_code
      t.string :location
      t.string :profession

      t.timestamps
    end
  end
end
