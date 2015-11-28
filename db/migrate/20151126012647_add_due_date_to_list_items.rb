class AddDueDateToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :due_date, :datetime
  end
end
