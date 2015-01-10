class AddIsStudentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_student, :boolean, :default => false
  end
end
