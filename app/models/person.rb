class Person < ActiveRecord::Base
  has_many :companies, :through => :people_employment_statuses
  has_many :products, :through => :assignments
end
