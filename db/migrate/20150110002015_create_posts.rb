class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :summary
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
