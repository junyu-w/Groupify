class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.text :student_list
      t.string :leader
      t.text :topic

      t.timestamps
    end
  end
end
