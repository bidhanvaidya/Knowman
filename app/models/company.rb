class Company < ActiveRecord::Base

  has_many :funding_rounds, :dependent=> :destroy
  has_many :staff_levels, :dependent => :destroy
  has_many :people_employment_statuses
  has_many :people, :through => :people_employment_statuses
  has_many :products, :through => :deployments

end
