class ModifyPropertiesTable < ActiveRecord::Migration[7.0]
  def up
    add_column :properties, :temp_media, :text, array: true, default: []

    Property.all.each do |property|
      property.update(temp_media: [property.media])
    end

    remove_column :properties, :media
    rename_column :properties, :temp_media, :media
  end

  def down
    add_column :properties, :temp_media, :string, array: false

    Property.all.each do |property|
      property.update(temp_media: property.media[0])
    end

    remove_column :properties, :media
    rename_column :properties, :temp_media, :media
  end
end
