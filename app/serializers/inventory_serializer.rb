class InventorySerializer < ActiveModel::Serializer
  attributes :id, :name, :brand, :status, :quantity, :construction_site_id, :suppliers, :suppliers_contact
end
