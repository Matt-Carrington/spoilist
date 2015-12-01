class AddCompletedAtToSpoils < ActiveRecord::Migration
  def change
    add_column :spoils, :completed_at, :datetime
  end
end
