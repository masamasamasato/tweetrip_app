class AddPasswordToEntrances < ActiveRecord::Migration[6.1]
  def change
    add_column :entrances, :password, :string
  end
end
