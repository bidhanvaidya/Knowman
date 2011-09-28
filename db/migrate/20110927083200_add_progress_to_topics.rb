class AddProgressToTopics < ActiveRecord::Migration
  def up
		add_column :topics, :progress, :integer, default => 0
  end
	def down
		remove_column :topics, :progress	
	end
end