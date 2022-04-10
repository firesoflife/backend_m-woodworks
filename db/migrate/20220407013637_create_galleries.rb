class CreateGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.string :image_url
      t.string :cover_image_url
      t.integer :project_id

      t.timestamps
    end
  end
end
