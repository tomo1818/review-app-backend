class AddUidToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :uid, :string, default: SecureRandom.uuid, null: false
  end
end
