class CreateConstructionsitesworkers < ActiveRecord::Migration[7.0]
  def change
    create_table :constructionsitesworkers do |t|
      t.string :construction_site_id
      t.string :staff_id

      t.timestamps
    end
  end
end
