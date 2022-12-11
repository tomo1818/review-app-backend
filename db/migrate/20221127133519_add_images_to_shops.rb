class AddImagesToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :images, :json
  end
end
