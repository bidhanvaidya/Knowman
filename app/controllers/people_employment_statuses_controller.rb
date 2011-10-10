class PeopleEmploymentStatusesController < ApplicationController	  
	  
	  # POST /people
	  # POST /people.json
	  def create
		@status = Status.new(params[:person])

		respond_to do |format|
		  if @person.save
			#format.html { redirect_to @person, notice: 'Person was successfully created.' }
			format.json { render json: @person, status: :created, location: @person }
		  else
			format.html { render action: "new" }
			format.json { render json: @person.errors, status: :unprocessable_entity }
		  end
		end
	  end