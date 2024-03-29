class ResearchesController < ApplicationController
  before_filter :authenticate_user!
  # GET /researches
  # GET /researches.json
  def index
    @researches = Research.paginate(:page => params[:page], :per_page => 10)
		@research = Research.new
		@notifications = Notification.find(:all, :order => :next_notification).first(9)
		@topics= Topic.find(:all, :order => :progress, :conditions => ["version = ?",'latest'], :limit => '8')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @researches }
    end
  end

  # GET /researches/1
  # GET /researches/1.json
  def show
    @research = Research.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @research }
    end
  end

  # GET /researches/new
  # GET /researches/new.json
  def new
    @research = Research.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @research }
    end
  end

  # GET /researches/1/edit
  def edit
    @research = Research.find(params[:id])
  end

  # POST /researches
  # POST /researches.json
  def create
    @research = Research.new(params[:research])

    respond_to do |format|
      if @research.save
        format.html { redirect_to researches_path, notice: 'Research was successfully created.' }
        format.json { render json: @research, status: :created, location: @research }
      else
        format.html { render action: "new" }
        format.json { render json: @research.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /researches/1
  # PUT /researches/1.json
  def update
    @research = Research.find(params[:id])

    respond_to do |format|
      if @research.update_attributes(params[:research])
        format.html { redirect_to @research, notice: 'Research was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @research.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /researches/1
  # DELETE /researches/1.json
  def destroy
    @research = Research.find(params[:id])
    @research.destroy

    respond_to do |format|
      format.html { redirect_to researches_url }
      format.json { head :ok }
    end
  end
 

end
