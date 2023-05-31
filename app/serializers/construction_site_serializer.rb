class ConstructionSiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :media, :start_date, :end_date, :status
end
