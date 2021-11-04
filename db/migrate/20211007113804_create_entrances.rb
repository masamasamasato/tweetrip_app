class CreateEntrances < ActiveRecord::Migration[6.1]
  def change
    create_table :entrances do |t|

      t.timestamps
    end
  end
end
