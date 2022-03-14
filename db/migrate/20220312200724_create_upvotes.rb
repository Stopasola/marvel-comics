class CreateUpvotes < ActiveRecord::Migration[7.0]
  def change
    create_table :upvotes do |t|

      t.references :user, null: false, foreing_key: true
      t.string   :comic_id, null: false
      
      t.timestamps
    end
  end
end
