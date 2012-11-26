class TopicsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :load_research_folder

	# GET /topics
	# GET /topics.json
	def index
			@topics = @folder.topics.search(params[:search]).order(:progress).paginate(:page => params[:page], :per_page => 10).find_all_by_version('latest')
			@user = current_user
			@notifications= Notification.all
			respond_to do |format|
				format.html # index.html.erb
				format.json { render json: @topics }
			end
	end

	def new
			@topic = @folder.topics.new
			
			respond_to do |format|
				format.html # new.html.erb
				format.json { render json: @topic }
			end
	end

	def edit
		@topic = @folder.topics.find(params[:id])
		@created_by=@topic.get_owner(@topic.id)
		@attachment = @topic.attachments.new
		@attachments = @topic.attachments.all
		@notification = @topic.notifications.new
		@notifications = @topic.notifications.all
	end

	def create
		@user =  current_user
		@topic = @folder.topics.new(params[:topic])
		@topic.user = @user
		@topic.version="latest"
		
		respond_to do |format|
			if @topic.save
				Update.create(:topic_id => @topic.id, :user_id => current_user.id, :type_of_update => "Created", :progress_status => @topic.progress)
				format.html { redirect_to edit_research_folder_topic_path(@topic.folder.research, @topic.folder,@topic), notice: 'Topic was successfully created.' }
				format.json { render json: @topic, status: :created, location: @topic }
			format.js
			
			else
				format.html { render action: "new" }
				format.json { render json: @topic.errors, status: :unprocessable_entity }
			format.js
			end
		end
	end

	def update
		@topic = @folder.topics.find(params[:id])
			@newtopic=@folder.topics.create(params[:topic])
			@newtopic.user=current_user
			@newtopic.version="latest"
			@attachments=@topic.attachments.all
				@attachments.each do |attachment|
					Attach.create(:topic_id => @newtopic.id, :attachment_id => attachment.id)
				end
			@newtopic.topic_id=@topic.get_latest(@topic.id)
			@new = Topic.find(@topic.get_latest(@topic.id)) # get the latest version
			@new.update_attributes(:version => "old")  # CHANGE THE VERSION  TO OLD IN THE LATEST ONE
			@notifications = @new.notifications
			@notifications.each do |notify|
				notify.update_attributes(:topic_id => @newtopic.id)
			end
			respond_to do |format|
				if @newtopic.update_attributes(params[:topic])
					Update.create(:topic_id => @topic.get_latest(@topic.id), :user_id => current_user.id,
					:type_of_update => "Updated", :progress_status => @new.progress)        
					format.html { redirect_to edit_research_folder_topic_path(@newtopic.folder.research, @newtopic.folder, @newtopic), 
					notice: 'Topic was successfully updated.' }
					format.json { head :ok }
				else
					format.html { render action: "edit" }
					format.json { render json: @topic.errors, status: :unprocessable_entity }
				end
			end

	
	end

	def destroy

		@topic = Topic.find(params[:id])
		if @topic.user_id == current_user.id #only owners are allowed to delete the document
			until @topic.topic_id.nil? do
				@latest_topic=@topic
				@topic=@topic.topic
				@latest_topic.destroy
			end
			@topic.destroy
			respond_to do |format|
				format.html { redirect_to :back }
				format.json { head :ok }
			end
		else
			respond_to do |format|
				format.html { redirect_to :back, alert: 'you are not allowed to delete this' }
				format.json { head :ok }
			end
		end
	end


	private
		def load_research_folder
		
			@research = Research.find_by_id(params[:research_id])
			@folder = @research.folders.find_by_id(params[:folder_id])
		end

end
