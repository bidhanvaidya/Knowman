class ActuallyCreateTableOffices < ActiveRecord::Migration
  def change
  
	  create_table :offices do |t|
      
		  t.text	:description
		  t.text	:address1
		  t.text	:address2
		  t.integer :zip_code
		  t.string	:city
		  t.string	:state_code
		  t.string	:country_code
		  t.decimal	:latitude
		  t.decimal	:longitude
		  
		  t.timestamps
	  
	  end
	  
  end
end
