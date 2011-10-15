class DashboardController < ApplicationController

	#before_filter :authenticate_user!
	def index
	  
		@companies = Company.all
		@staff_levels = StaffLevel.all

		respond_to do |format|
		  
  	  format.html # index.html.erb
		  format.json  { 
		    
		    render :json => 
		    
		      {
		    
		        :companies => @companies, 
            :staff_levels => @staff_levels
                        
          }
                    
      }
      
		end # do
		
	end # /post/index

end # class
