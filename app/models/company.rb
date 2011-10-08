class Company < ActiveRecord::Base

  has_many :funding_rounds, :dependent=> :destroy
  has_many :staff_levels, :dependent => :destroy
  has_many :employments
  has_many :people, :through => :employments
  has_many :deployments
  has_many :projects, :through => :deployments

end
