class CreateFlames < ActiveRecord::Migration
  def change
    create_table :flames do |t|
      t.integer :amount_in_cents

      t.timestamps
    end
  end
end
