class AdminSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :full_name, :user_code
end
