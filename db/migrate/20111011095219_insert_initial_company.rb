class InsertInitialCompany < ActiveRecord::Migration
  def change
  
	Company.create :name => 'Initial Company'
  
  end
end
