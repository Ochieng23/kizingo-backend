class AdminSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :admin_code, :full_name, :email, :user_code
end
