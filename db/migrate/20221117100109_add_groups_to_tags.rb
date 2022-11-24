class AddGroupsToTags < ActiveRecord::Migration[7.0]
  def change
    add_reference :tags, :group, foreign_key: true
  end
end
