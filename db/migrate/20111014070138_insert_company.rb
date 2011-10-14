class InsertCompany < ActiveRecord::Migration
  def change
  
	Company.create :name => 'Initial Company', :permalink => 'initial-company'
  
  end
end
