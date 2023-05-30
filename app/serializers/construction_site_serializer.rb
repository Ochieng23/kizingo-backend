class ConstructionSiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :media, :inventory_id, :staff_id, :machinery_id, :legal_id, :start_date, :end_date, :status
end
