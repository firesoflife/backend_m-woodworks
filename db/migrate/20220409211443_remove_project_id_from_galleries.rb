class RemoveProjectIdFromGalleries < ActiveRecord::Migration[7.0]
  def change
    remove_column :galleries, :project_id, :integer
  end
end
