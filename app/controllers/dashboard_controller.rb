class DashboardController < ApplicationController

	def new
		@company = company.new

		respond_to do |f|
		
			f.json { render json: @folder }
		
		end
	end

end
