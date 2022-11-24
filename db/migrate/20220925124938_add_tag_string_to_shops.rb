class AddTagStringToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :tag_string, :string
  end
end
