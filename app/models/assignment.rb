class Assignment < ActiveRecord::Base
   
   belongs_to :person
   belongs_to :product
   
end
