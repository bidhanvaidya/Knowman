class OfficesController < ApplicationController
	def index
		@offices = Office.all

		respond_to do |format|
		  #format.html # index.html.erb
		  format.json { render json: @offices }
		end
			
	end
	# POST /offices
	def create
		@office = Office.new(params[:offices])

	   respond_to do |format|
		 if @office.save
		   #format.html { redirect_to @person, notice: 'Person was successfully created.' }
		   format.json { render json: @office, status: :created, location: @office }
		 else
		   format.html { render action: "new" }
		   format.json { render json: @person.errors, status: :unprocessable_entity }
		 end
	   end
	end
	
end