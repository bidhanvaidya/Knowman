class AlterTableFundingRounds < ActiveRecord::Migration
  def change
    drop_table :funding_rounds
    
    create_table :funds do |t|
      t.integer :funded_year
      t.integer :funded_month
      t.integer :raised_amount
      t.string :raised_currency_code
      t.string :round_code
      t.string :source_description
      t.string :source_url
      t.string :company_permalink
      
      t.timestamps
    end
  end
end


