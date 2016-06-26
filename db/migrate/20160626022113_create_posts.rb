class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
       t.string :title
       t.string :url, unique: true, null: false
       t.integer :vote_count, default: 0

      t.timestamps null: false
    end
  end
end
