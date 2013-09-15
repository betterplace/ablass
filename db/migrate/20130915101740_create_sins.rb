class CreateSins < ActiveRecord::Migration
  def up
    create_table :sins do |t|
      t.string :name, null: false
      t.text   :explanation, null: false

      t.timestamps
    end
    add_index :sins, [ :name ], unique: true
    Sin.create_translation_table! name: :string, explanation: :text
  end

  def down
    remove_index :sins, column: [ :name ]
    drop_table :sins
    Sin.drop_translation_table!
  end
end
