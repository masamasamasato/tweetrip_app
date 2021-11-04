class AddEntryUserIdToEntrances < ActiveRecord::Migration[6.1]
  def change
    add_column :entrances, :entry_user_id, :integer
  end
end
