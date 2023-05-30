class StaffSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :phone_number, :national_id, :payrate
end
