class DashboardController < ApplicationController

  #before_filter :authenticate_user!
	def index

		@people = Person.all
		@offices = Office.all
		@products = Product.all
		@companies = Company.all
		@staff_levels = StaffLevel.all
		@funding_rounds = FundingRound.all
		@employment_statuses = EmploymentStatus.all

		respond_to do |format|
		
  	  format.html # index.html.erb
  	  
  		format.json { 
  		  
  		  render json: {
  		
  		    :person => @people,
  		    :employment_statuses => @employment_statuses
  		  
  		  }  
  		  
  		}
       
      
		end # do
		
	end # /post/indexs

end # class


