class RenameBodyColumnToMessages < ActiveRecord::Migration[6.1]
  def change
    rename_column :messages, :body, :content
  end
end
