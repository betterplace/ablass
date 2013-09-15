class CreateSins < ActiveRecord::Migration
  def up
    create_table :sins do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :sins, [ :name ], unique: true
  end

  def down
    remove_index :sins, :column => [ :name ]
    drop_table :sins
  end
end
