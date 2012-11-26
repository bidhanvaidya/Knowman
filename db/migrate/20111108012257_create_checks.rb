class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.text :comment
      t.integer :topic_id

      t.timestamps
    end
  end
end
