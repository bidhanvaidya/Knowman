class Topic < ActiveRecord::Base
belongs_to :folder
  belongs_to :user
	has_many :updates
	
end
