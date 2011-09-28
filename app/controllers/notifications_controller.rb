class NotificationsController < ApplicationController
	def new

		@folder = Folder.find_by_id(params[:folder_id])
		@notification = @folder.notifications.new
		respond_to do |format|
			format.js
			format.html
		end
	end

  def create
		@user =  current_user
		
		@folder = Folder.find_by_id(params[:folder_id])
		@notification = @folder.notifications.new(params[:notification])
    respond_to do |format|
      if @notification.save
				format.html{ redirect_to folder_topics_path(@folder)}
      else
        format.js
      end
    end
  end

end