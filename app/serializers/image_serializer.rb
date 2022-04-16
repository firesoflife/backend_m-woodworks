class ImageSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :alt_text, :gallery_id

  belongs_to :gallery
end
