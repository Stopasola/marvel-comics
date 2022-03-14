class AddIndexUpvote < ActiveRecord::Migration[7.0]
  def change
    add_index :upvotes, :user_id
    add_index :upvotes, :comic_id
    add_index :upvotes, [:user_id, :comic_id], unique: true
  end
end
