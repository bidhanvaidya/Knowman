class FoldersController < ApplicationController
before_filter :authenticate_user!
 def index
    @folders = Folder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @folders }
    end
end

def show
@folder = Folder.find (params[:id])

respond_to do |format|
format.html # show.html.erb
end
end


def new
    @folder = Folder.new
	
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folder }
    end
  end
  # POST /topics.json
  def create
		@folder = Folder.new(params[:folder])

  
  respond_to do |format|
      if @folder.save
        format.html { redirect_to folder_topics_path(@folder), notice: 'Topic was successfully created.' }
        format.json { render json: @folder, status: :created, location: @folder }
      else
        format.html { render action: "new" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end



end

