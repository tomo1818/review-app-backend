class AddUrlToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :url, :string
  end
end
