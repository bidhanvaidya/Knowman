class AddProgressToTopicsWithDefault < ActiveRecord::Migration
  def change
add_column :topics, :progress, :integer, :default => 0
  end
end
