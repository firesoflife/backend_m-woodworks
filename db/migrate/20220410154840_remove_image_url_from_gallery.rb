class RemoveImageUrlFromGallery < ActiveRecord::Migration[7.0]
  def change
    remove_column :galleries, :image_url, :string
  end
end
