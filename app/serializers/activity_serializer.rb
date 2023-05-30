class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :phase_id, :description, :start_date, :end_date, :status
end
