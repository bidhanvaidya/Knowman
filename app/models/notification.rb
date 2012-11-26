class Notification < ActiveRecord::Base
	belongs_to :topic
	validates :next_notification,
          :date => {:after => Time.now, :message => 'custom error msg'}
         
end
