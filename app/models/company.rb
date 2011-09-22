class Company < ActiveRecord::Base
  has_many :funds
  has_many :stlevels
  has_many :employments
  has_many :people, :through => :employments
  has_many :deployments
  has_many :project, :through => :deployments

end
