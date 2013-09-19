class AddCarrierwaveToSin < ActiveRecord::Migration
  def change
    add_column :sins, :icon, :string
  end
end
