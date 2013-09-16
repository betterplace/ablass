class CreateSinProjects < ActiveRecord::Migration
  def change
    create_table :sin_projects do |t|
      t.integer :sin_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :betterplace_id, null: false

      t.timestamps
    end
  end
end
