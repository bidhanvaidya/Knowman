class AddTopicIdAndVersionToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :topic_id, :integer
    add_column :topics, :version, :string
  end
end
