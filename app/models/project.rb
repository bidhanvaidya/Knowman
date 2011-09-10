class Project < ActiveRecord::Base
   has_many :assignments
   has_many :person, :through => :assignments
end
