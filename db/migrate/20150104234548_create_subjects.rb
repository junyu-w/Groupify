class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :description
      t.text :instructor_list
      t.text :student_list
      t.string :current_instructor

      t.timestamps
    end
  end
end
