class CreateSins < ActiveRecord::Migration
  def change
    create_table :sins do |t|
      t.string :name

      t.timestamps
    end
  end
end
