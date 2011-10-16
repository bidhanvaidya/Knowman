module Topics
    def get_owner(id)
				x= Topic.find_by_id(id)     	  
				if x.topic_id.nil?				# checking if the passed topic is the first!!
					x.user
				else		# if not find the older version
				
			 		until x.topic.topic_id.nil? do # until the oldest version is found
						x=x.topic 		
					end
				x.user # passes a user object
				end
    end
    def get_created_at(id)
				x= Topic.find_by_id(id)     	  
				if x.topic_id.nil?				# checking if the passed topic is the first!!
					x.created_at
				else		# if not find the older version
				
			 		until x.topic.topic_id.nil? do # until the oldest version is found
						x=x.topic 		
					end
				x.created_at # passes created date
				end
    end
		def get_latest(id)
			x= Topic.find_by_id(id)
			while x.version == "old" do
				x= Topic.find_by_topic_id(x.id)	
			
			end		
	x.id
end
  end
class Topic < ActiveRecord::Base
belongs_to :folder
  belongs_to :user
	has_many :updates
	include Topics
	has_many :attachments
  belongs_to :topic
	has_many :attaches
  has_many :attachments, :through => :attaches 
  belongs_to :topic
	has_many :notifications
end



