class ProgressSerializer < ActiveModel::Serializer
  attributes :id, :subactivity_id, :progress_percentage, :progress_date
end
