class CreateSinProjects < ActiveRecord::Migration
  def up
    create_table :sin_projects do |t|
      t.integer :sin_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :betterplace_id, null: false

      t.timestamps
    end
    add_index :sin_projects, [ :betterplace_id ], unique: true
    SinProject.create_translation_table! name: :string, description: :text
  end

  def down
    remove_index :sin_projects, :column => [ :betterplace_id ]
    drop_table :sin_projects
    SinProject.drop_translation_table!
  end
end
