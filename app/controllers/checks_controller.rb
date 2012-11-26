class ChecksController < ApplicationController
def new
 @user_story= UserStory.find(params[:user_story_id])
 @topic = Topic.find(params[:topic_id])
 			@check =@topic.checks.new
			
			respond_to do |format|
				format.html # new.html.erb
				format.json { render json: @topic }
			end
 end

def create
 @user_story= UserStory.find(params[:user_story_id])
 @topic = Topic.find(params[:topic_id])
 			@check =@user_story.checks.new(params[:check])
 			@check.topic_id=@topic.id
 respond_to do |format|
 		if @check.save
				format.html { redirect_to user_story_path(@user_story), notice: 'Topic was successfully created.' }
						
			else
				format.html { render action: "new" }
	
		end
	
 end
 
 
 end
end
