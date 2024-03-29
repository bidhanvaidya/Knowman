class Company < ActiveRecord::Base

  has_many :funding_rounds, :dependent=> :destroy
  has_many :staff_levels
  has_many :employment_statuses
  has_many :people, :through => :employment_statuses
  has_many :offices
  has_many :deployments
  has_many :products, :through => :deployments

end
