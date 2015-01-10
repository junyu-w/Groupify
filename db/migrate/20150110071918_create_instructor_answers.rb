class CreateInstructorAnswers < ActiveRecord::Migration
  def change
    create_table :instructor_answers do |t|
      t.text :content
      t.integer :topic_id
      t.integer :group_id

      t.timestamps
    end
  end
end
