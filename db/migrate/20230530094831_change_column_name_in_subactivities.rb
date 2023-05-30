class ChangeColumnNameInSubactivities < ActiveRecord::Migration[7.0]
  def change
    rename_column :subactivities, :acitivity_id, :activity_id
  end
  
end
