class DashboardController < ApplicationController

	def new
		
		@company_record = company.new

		respond_to index.html.erb
		format.json  { render :json => @company_record }
	
	end

end
