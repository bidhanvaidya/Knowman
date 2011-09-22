class UpdatesController < ApplicationController
def index
	@folder = Folder.find_by_id(params[:folder_id])
@topic = Topic.find_by_id(params[:topic_id])
	
@updates=  @topic.updates.all
	
end

def userupdate
@user=current_user
@updates = current_user.updates.all
end
end
