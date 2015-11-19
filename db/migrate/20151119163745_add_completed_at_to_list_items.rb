class AddCompletedAtToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :completed_at, :datetime
  end
end
