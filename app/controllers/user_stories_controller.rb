class UserStoriesController < ApplicationController
	def index
		@user_stories = UserStory.all
	end

	def show
		@user_story= UserStory.find(params[:id])
		@topics= Topic.where(:version=>"latest")

 			@check =Check.new
	end
 def check
 
 check_list_item = params[:topic_ids]
 check_list_item.each do |list|
 if Check.find_by_topic_id_and_user_story_id(list,params[:id]).nil?
 	Check.create(:user_story_id => params[:id], :topic_id => list, :boolean =>true)
 end
 
 end
 redirect_to user_stories_path
 end


 

end
