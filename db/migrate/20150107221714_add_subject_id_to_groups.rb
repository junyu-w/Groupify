class AddSubjectIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :subject_id, :integer
  end
end
