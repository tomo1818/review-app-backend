class AddDescriptionToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :description, :string, null: false
  end
end
