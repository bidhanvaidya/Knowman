class UpdatesController < ApplicationController
def index
	@folder = Folder.find_by_id(params[:folder_id])
@topic = Topic.find_by_id(params[:topic_id])
	@created_by=@topic.get_owner(@topic.id)
@updates=  @topic.updates.all
	
end

def userupdate
@user=current_user
@updates = current_user.updates.paginate(:page => params[:page], :per_page => 10)
end
end
