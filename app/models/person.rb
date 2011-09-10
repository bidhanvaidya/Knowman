class Person < ActiveRecord::Base

  has_many :employments
  has_many :companies, :through => :employments

end
