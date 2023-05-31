class SubactivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :activity_id, :description, :start_date, :end_date, :status
end
