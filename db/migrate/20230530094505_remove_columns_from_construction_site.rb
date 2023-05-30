class RemoveColumnsFromConstructionSite < ActiveRecord::Migration[7.0]
  def change
    remove_column :construction_sites, :inventory_id, :integer
    remove_column :construction_sites, :staff_id, :integer
    remove_column :construction_sites, :legal_id, :integer
    remove_column :construction_sites, :machinery_id, :integer
  end
end
