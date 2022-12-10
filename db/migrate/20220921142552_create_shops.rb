class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.references :group, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :avg_score, null: false, default: 0
      t.boolean :done, null: false, default: false
      t.string :visit_day, null: false, default: '2022月12日1日'

      t.timestamps
    end
  end
end
