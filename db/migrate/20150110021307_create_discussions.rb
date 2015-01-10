class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :content
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
