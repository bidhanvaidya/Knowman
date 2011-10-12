class Attachment < ActiveRecord::Base
has_attached_file :document, :styles => { :medium => "300x300>", :thumb => ["100x100", :jpg] }
belongs_to :topic
end
