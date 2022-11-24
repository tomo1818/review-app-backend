class RemoveTagsFromShops < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :tags, :string
  end
end
