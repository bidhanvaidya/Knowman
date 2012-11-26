class AddUserstoriesColumnToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :user_story_id, :integer
  end
end
