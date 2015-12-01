class CreateSpoils < ActiveRecord::Migration
  def change
    create_table :spoils do |t|
      t.text :content
      t.integer :point_value
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
