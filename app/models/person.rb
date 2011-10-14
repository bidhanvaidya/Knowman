class Person < ActiveRecord::Base
  has_many :employment_statuses
  has_many :companies, :through => :employment_statuses
  has_many :assignments
  has_many :products, :through => :assignments
end
