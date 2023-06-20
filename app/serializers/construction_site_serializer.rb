class ConstructionSiteSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :architecturalDesign, :currentProgress, :start_date, :end_date, :status
end
