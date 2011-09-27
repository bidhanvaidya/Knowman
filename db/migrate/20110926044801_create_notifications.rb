class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.datetime :next_notification
			t.integer :folder_id

      t.timestamps
    end
  end
end
