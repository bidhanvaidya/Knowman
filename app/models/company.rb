class Company < ActiveRecord::Base

  has_many :funds, :dependent=> :destroy
  has_many :stlevels, :dependent => :destroy
  has_many :employments
  has_many :people, :through => :employments
  has_many :deployments
  has_many :project, :through => :deployments

end
