class AgentSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :name, :email, :phone_number, :property_id
end
