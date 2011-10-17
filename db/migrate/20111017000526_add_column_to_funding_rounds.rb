class AddColumnToFundingRounds < ActiveRecord::Migration
  def change
    add_column :funding_rounds, :funded_day, :integer
  end
end
