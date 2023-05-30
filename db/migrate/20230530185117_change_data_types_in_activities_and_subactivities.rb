class ChangeDataTypesInActivitiesAndSubactivities < ActiveRecord::Migration[7.0]
  def change
    change_column :activities, :phase_id, :integer
    change_column :subactivities, :activity_id, 'integer USING activity_id::integer'
  end
end
