class ChangeToFolderInTopic < ActiveRecord::Migration
  def up
		rename_column :topics, :header_id, :folder_id
  end

  def down
	rename_column :topics, :folder_id, :header_id 
 end
end
