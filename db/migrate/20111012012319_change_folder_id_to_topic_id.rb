class ChangeFolderIdToTopicId < ActiveRecord::Migration
  def change
  	rename_column :notifications, :folder_id, :topic_id
  end

end
