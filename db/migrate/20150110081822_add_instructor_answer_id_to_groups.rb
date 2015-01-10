class AddInstructorAnswerIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :instructor_answer_id, :integer
  end
end
