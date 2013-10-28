class AddLongDescriptionToProject < ActiveRecord::Migration
  def change
    add_column :sin_projects, :long_description, :text
    add_column :sin_project_translations, :long_description, :text
  end
end
