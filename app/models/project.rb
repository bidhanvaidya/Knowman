class Project < ActiveRecord::Base

  has_many :assignments
  has_many :person, :through => :assignments

  has_many :deployments
  has_many :company, :through => :deployments

end
