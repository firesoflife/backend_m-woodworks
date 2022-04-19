class CreateProjects < ActiveRecord::Migration[7.0]

  def change
    create_table :projects do |t|
      t.string "project_name"
      t.string "project_type"
      t.string "project_tags"
      t.string "description"
    end
  end
end


