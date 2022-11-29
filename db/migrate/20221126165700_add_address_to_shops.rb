class AddAddressToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :address, :string, default: "〒145-0061 東京都大田区 石川町1丁目31-1", null: false
  end
end
