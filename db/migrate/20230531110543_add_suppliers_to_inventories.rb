class AddSuppliersToInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :suppliers, :string
    add_column :inventories, :suppliers_contact, :string
  end
end
