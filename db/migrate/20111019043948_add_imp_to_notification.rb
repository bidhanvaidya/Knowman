class AddImpToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :is_important, :boolean
  end
end
