class AddTagsToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :tags, :string
  end
end
