class HouseSeekerSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :user_code, :house_seeker_code, :location, :profession
end
