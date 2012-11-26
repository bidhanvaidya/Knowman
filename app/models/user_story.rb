class UserStory < ActiveRecord::Base
has_many :topics, :through => :checks
has_many :checks
end
