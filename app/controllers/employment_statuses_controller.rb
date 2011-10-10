class EmploymentStatusesController < ApplicationController	  
  
  def index
	@employment_status = EmploymentStatus.all

	respond_to do |format|
	#format.html # index.html.erb
	format.json { render json: @employment_status }
	end
  end
  
  # POST /people_employment_statuses
  # POST /people_employment_statuses.json
  def create
	@employment_status = EmploymentStatus.new(params[:employment_status])

	respond_to do |format|
	  if @employment_status.save
		#format.html { redirect_to @person, notice: 'Person was successfully created.' }
		format.json { render json: @employment_status, status: :created, location: @employment_status }
	  else
		format.html { render action: "new" }
		format.json { render json: @status.errors, status: :unprocessable_entity }
	  end
	end
  end
	  
end