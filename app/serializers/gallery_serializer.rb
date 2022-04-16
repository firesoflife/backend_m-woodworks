class GallerySerializer < ActiveModel::Serializer
  attributes :id, :cover_image_url, :project_id, :alt_text, :title

  has_many :images
  belongs_to :project
end
