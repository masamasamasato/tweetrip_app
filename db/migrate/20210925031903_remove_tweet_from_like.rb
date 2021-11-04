class RemoveTweetFromLike < ActiveRecord::Migration[6.1]
  def change
    remove_reference :likes, :tweet, null: false, foreign_key: true
  end
end
