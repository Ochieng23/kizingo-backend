class PropertySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :listing_type, :sqft, :price, :media

  # def media
  #   object.media.map(&:url) # Assuming `media` is an association and `url` is the attribute representing the media URL
  # end
end
