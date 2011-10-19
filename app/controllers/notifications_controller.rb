class NotificationsController < ApplicationController
	def new
		@research = Research.find(params[:research_id])
		
		@folder = @research.folder.find_by_id(params[:folder_id])
		@topic = @folder.topics.find(params[:topic_id])
		@original_topic = @topic.get_original_topic(@topic.id)
		respond_to do |format|
			format.js
			format.html
		end
	end

  def create
		@user =  current_user
		
		@research = Research.find(params[:research_id])
		@folder = @research.folders.find_by_id(params[:folder_id])
		@topic = @folder.topics.find_by_id(params[:topic_id])
		@notification = @topic.notifications.new(params[:notification])
    respond_to do |format|
      if @notification.save
				format.html{ redirect_to edit_research_folder_topic_path(@research, @folder, @topic)}
      else
        format.js
      end
    end
  end
  
  def destroy
		@research = Research.find(params[:research_id])
		@folder = @research.folders.find_by_id(params[:folder_id])
  		@topic= @folder.topics.find(params[:topic_id])
  		
    @notification = @topic.notifications.find(params[:id])
 
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to edit_research_folder_topic_path(@topic.folder.research, @topic.folder, @topic) }
      format.json { head :ok }
    end
  end

end
