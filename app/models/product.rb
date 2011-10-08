class Product < ActiveRecord::Base
  #has_many :assignments
  has_many :people, :through => :assignments

  #has_many :deployments
  has_many :companies, :through => :deployments
end
