class AddCarrierwaveToSinProject < ActiveRecord::Migration
  def change
    add_column :sin_projects, :small_picture, :string
    add_column :sin_projects, :big_picture, :string
  end
end
