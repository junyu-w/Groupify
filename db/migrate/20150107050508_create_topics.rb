class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      t.integer :subject_id
      t.integer :instructor_id

      t.timestamps
    end
  end
end
