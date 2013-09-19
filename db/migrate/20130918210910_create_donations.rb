class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :sin_project_id, null: false
      t.integer :amount_in_cents, null: false
      t.string :token, null: false, limit: 22

      t.timestamps
    end
    add_index :donations, [ :token ], unique: true
  end
end
