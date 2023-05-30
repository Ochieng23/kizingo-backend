class ChangeDataTypesInConstructionsitesworkers < ActiveRecord::Migration[7.0]
  def change
    change_column :constructionsitesworkers, :construction_site_id, :integer, using: 'construction_site_id::integer'
    change_column :constructionsitesworkers, :staff_id, :integer, using: 'staff_id::integer'
  end
end
