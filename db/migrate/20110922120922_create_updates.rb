class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :user_id
      t.integer :topic_id
      t.string :type_of_update

      t.timestamps
    end
  end
end
