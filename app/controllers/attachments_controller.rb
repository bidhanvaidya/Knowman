class AttachmentsController < ApplicationController
  def index
  	@folder = Folder.find_by_id(params[:folder_id])
  	@topic= @folder.topics.find_by_id(params[:topic_id])
		@attachments= @topic.attachments.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attachments }
    end
  end
	def new
			@folder = Folder.find_by_id(params[:folder_id])
			@topic= @folder.topics.find(params[:topic_id])
		@attachment = @topic.attachments.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @attachment }
		end
	end

	def create
			
			@folder = Folder.find_by_id(params[:folder_id])
			@topic= @folder.topics.find(params[:topic_id])
		@attachment = Attachment.new( params[:attachment] )
		   respond_to do |format|
      if @attachment.save	
      	@attachment.attaches.create(:topic_id => @topic.id)
        format.html { redirect_to edit_folder_topic_path(@topic.folder,@topic), notice: 'attachment was successfully created.' }
        format.js 
      else
        format.html { render action: "new" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
	end
	def show
		@topic= Topic.find(params[:topic_id])
	@attachment= Attach.attachments.find(params[:id])
	 send_file @attachment.document.path, :filename => @attachment.document_file_name, :content_type => @attachment.document_content_type
	end

  def destroy
  @folder = Folder.find_by_id(params[:folder_id])
  		@topic= @folder.topics.find(params[:topic_id])
  		
    @attachment = @topic.attachments.find(params[:id])
    @attachment.document=nil
    @attachment.save
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to edit_folder_topic_path(@topic.folder, @topic) }
      format.json { head :ok }
    end
  end

	
end
