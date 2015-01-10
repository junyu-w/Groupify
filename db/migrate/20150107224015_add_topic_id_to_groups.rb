class AddTopicIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :topic_id, :integer
  end
end
