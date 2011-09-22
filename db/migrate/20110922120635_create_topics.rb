class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :user_id
      t.text :content
      t.integer :header_id

      t.timestamps
    end
  end
end
