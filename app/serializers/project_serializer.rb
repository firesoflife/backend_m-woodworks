class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :project_name, :project_tags, :project_type, :description

  has_one :gallery
end
