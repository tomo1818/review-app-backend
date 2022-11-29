class AddColumsToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :latitude, :float, default: 35.60439042577099, null: false
    add_column :shops, :longitude, :float, default: 139.68384504318237, null: false
    add_column :shops, :amount_of_money, :integer, default: 0, null: false
  end
end
