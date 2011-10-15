class DashboardController < ApplicationController

	#before_filter :authenticate_user!
	def index

		@companies = Company.all
		@staff_levels = StaffLevel.all
		@people = Person.all
		@offices = Office.all
		@products = Product.all

		respond_to do |format|
		  
  	  format.html # index.html.erb
		  
		    format.json  { 
		  
		        render :json => 

  		      { 

  		        :companies => @companies[2][:permalink],
  		        :staff_level => @staff_levels[2][:number_of_employees]

  		      }

  		  }
		    
		  #  render :json => 
		    
		  #    {
		    
		  #      :companies => @companies, 
      #      :staff_levels => @test,
      #      :people => @people,
      #      :offices => @offices,
      #      :products => @products,
                        
      #    }
                
      #}
      
		end # do
		
	end # /post/index

end # class
