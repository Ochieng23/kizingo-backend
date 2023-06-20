class AddArchitecturalDesignAndCurrentProgressToConstructionSites < ActiveRecord::Migration[6.1]
  def up
    remove_column :construction_sites, :media

    add_column :construction_sites, :architecturalDesign, :text, array: true, default: []
    add_column :construction_sites, :currentProgress, :text, array: true, default: []
  end

  def down
    remove_column :construction_sites, :architecturalDesign
    remove_column :construction_sites, :currentProgress

    add_column :construction_sites, :media, :string
  end
end
