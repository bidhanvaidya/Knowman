class TopicsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :load_folder

	# GET /topics
	# GET /topics.json
	def index
			@topics = @folder.topics.paginate(:page => params[:page], :per_page => 10)

			@notifications= @folder.notifications
			@user = current_user

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
	end

	def create
		@user =  current_user
		@topic = @folder.topics.new(params[:topic])
		@topic.user_id = @user.id
		respond_to do |format|
			if @topic.save
				Update.create(:topic_id => @topic.id, :user_id => current_user.id, :type_of_update => "Created", :progress_status => @topic.progress)
				format.html { redirect_to folder_topics_path(@folder), notice: 'Topic was successfully created.' }
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

		respond_to do |format|
			if @topic.update_attributes(params[:topic])
				Update.create(:topic_id => @topic.id, :user_id => current_user.id, :type_of_update => "Updated", :progress_status => @topic.progress)        
				format.html { redirect_to folder_topics_path(@folder), notice: 'Topic was successfully updated.' }
				format.json { head :ok }
			else
				format.html { render action: "edit" }
				format.json { render json: @topic.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy

		@topic = Topic.find(params[:id])
		if @topic.user_id == current_user.id
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

	def all
		@topics=Topic.all
		respond_to do |format|
			format.html # all.html.erb
			format.json { render json: @topics }
		end
	end

	private
		def load_folder
			@folder = Folder.find_by_id(params[:folder_id])
		end

end
