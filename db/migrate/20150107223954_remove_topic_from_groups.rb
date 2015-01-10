class RemoveTopicFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :topic, :text
  end
end
