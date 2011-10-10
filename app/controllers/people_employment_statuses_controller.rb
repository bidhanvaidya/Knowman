class PeopleEmploymentStatusesController < ApplicationController	  
  
  def index
	@people_employment_statuses = PeopleEmploymentStatus.all

	respond_to do |format|
	#format.html # index.html.erb
	format.json { render json: @people_employment_statuses }
	end
  end
  
  # POST /people_employment_statuses
  # POST /people_employment_statuses.json
  def create
	@status = PeopleEmploymentStatus.new(params[:employment_status])

	respond_to do |format|
	  if @status.save
		#format.html { redirect_to @person, notice: 'Person was successfully created.' }
		format.json { render json: @status, status: :created, location: @status }
	  else
		format.html { render action: "new" }
		format.json { render json: @status.errors, status: :unprocessable_entity }
	  end
	end
  end
	  
end