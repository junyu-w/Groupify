class AddActiveStatusToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :active_status, :boolean
  end
end
