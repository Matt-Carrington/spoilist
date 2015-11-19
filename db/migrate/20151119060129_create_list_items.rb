class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :content
      t.integer :point_value
      t.string :color
      t.string :list_id
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
