class RemoveImagesFromShops < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :images, :json
  end
end
