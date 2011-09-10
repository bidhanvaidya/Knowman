class Project < ActiveRecord::Base
 has_many :deployments
  has_many :company, :through => :deployments
end
