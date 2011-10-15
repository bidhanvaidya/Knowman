class Attach < ActiveRecord::Base
belongs_to :topic
belongs_to :attachment
end
