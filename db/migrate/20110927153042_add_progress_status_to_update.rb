class AddProgressStatusToUpdate < ActiveRecord::Migration
  def change
		add_column :updates, :progress_status, :integer
  end
end
