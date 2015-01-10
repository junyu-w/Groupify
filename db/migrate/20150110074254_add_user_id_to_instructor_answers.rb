class AddUserIdToInstructorAnswers < ActiveRecord::Migration
  def change
    add_column :instructor_answers, :user_id, :integer
  end
end
