class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
			t.string :document_file_name
			t.string :document_content_type 
			t.integer :document_file_size
			t.datetime :document_updated_at   
			t.integer :topic_id
      t.timestamps
    end
  end
end
