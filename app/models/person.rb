class Person < ActiveRecord::Base

  has_many :employments
  has_many :companies, :through => :employments
  
  has_many :assignments
  has_many :projects, :through => :assignments
  

end
