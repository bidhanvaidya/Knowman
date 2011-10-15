class Attachment < ActiveRecord::Base
has_attached_file :document, :styles => { :medium => "300x300>", :thumb => ["100x100", :jpg] }
has_many :attaches
has_many :topics, :through => :attaches

end
