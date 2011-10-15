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
		
		@employment_status = EmploymentStatus.find_or_create_by_title_and_company_permalink_and_person_permalink(params[:employment_status])
		
		 respond_to do |format|
		 
		 if @employment_status.save
		   
		   format.json { render json: @employment_status }
		 
		 else
		   format.html { render action: "new" }
		   format.json { render json: @employment_status.errors, status: :unprocessable_entity }
		 end
	   
	   end
	end
end