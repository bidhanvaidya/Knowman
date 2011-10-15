class MakePermalinkPrimaryKey < ActiveRecord::Migration
  def change
    
    drop_table :employment_statuses
    
    create_table :employment_statuses, {:id => false} do |t|
      t.boolean  :is_past
      t.string   :title
      t.string   :first_name
      t.string   :last_name
      t.string   :company_permalink
      t.string   :person_permalink
    end
    execute "ALTER TABLE employment_statuses ADD PRIMARY KEY (title, person_permalink, company_permalink);"
  
  end
end
