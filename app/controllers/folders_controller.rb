class FoldersController < ApplicationController
	before_filter :authenticate_user!
	before_filter :load_research
	def index
		@folders = @research.folders

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @folders }
		end
	end

	def show
		@folder = @research.folders.find (params[:id])

		respond_to do |format|
			format.html # show.html.erb
		end
	end


	def new
		@folder = @research.folders.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @folder }
		end
	end

	def create
		@folder = @research.folders.new(params[:folder])

		respond_to do |format|
			if @folder.save
				format.html { redirect_to research_folder_topics_path(@research, @folder), notice: 'Topic was successfully created.' }
				format.json { render json: @folder, status: :created, location: @folder }
			else
				format.html { render action: "new" }
				format.json { render json: @folder.errors, status: :unprocessable_entity }
			end
		end
	end

 private
		def load_research
			@research = Research.find_by_id(params[:research_id])
		end

end

