class AddSubjectIdListToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subject_id_list, :text
  end
end
