class Folder < ActiveRecord::Base
has_many :topics
has_many :notifications

def notification_attributes=(notification_attributes)
  notification_attributes.each do |attributes|
    notifications.build(attributes)
  end
end




end
