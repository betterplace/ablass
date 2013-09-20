class AddSinDetailToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :sin_detail, :text
  end
end
