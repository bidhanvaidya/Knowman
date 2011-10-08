class DashboardController < ApplicationController

	def create
		@company = company.new

		respond_to do |f|
		
			f.json { render json: @folder }
		
		end
	end

end
