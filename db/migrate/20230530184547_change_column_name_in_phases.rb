class ChangeColumnNameInPhases < ActiveRecord::Migration[7.0]
  def change
    rename_column :phases, :project_id, :construction_site_id
  end
  
end
