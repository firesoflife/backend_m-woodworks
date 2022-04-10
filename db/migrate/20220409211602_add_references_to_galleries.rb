class AddReferencesToGalleries < ActiveRecord::Migration[7.0]
  def change
    add_reference :galleries, :project, null: false, foreign_key: true
  end
end
