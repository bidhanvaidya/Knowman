class CreateAttaches < ActiveRecord::Migration
  def change
    create_table :attaches do |t|
      t.integer :topic_id 
      t.integer :attachment_id 

      t.timestamps
    end
  end
end
