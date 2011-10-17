class FundingRoundsController < ApplicationController
    def index

  	@funding_rounds = FundingRound.all

  	respond_to do |format|
  	    #format.html # index.html.erb
  	    format.json { render json: @employment_status }
  	  end
    end

    # POST /funding_round
    # POST /funding_round.json
    def create

  		@funding_round = FundingRound.find_or_create_by_company_permalink_and_round_code(params[:funding_round])

  		 respond_to do |format|

  		 if @funding_round.save

  		   format.json { render json: @funding_round }

  		 else
  		   format.html { render action: "new" }
  		   format.json { render json: @funding_round.errors, status: :unprocessable_entity }
  		 end

  	   end
  	end
end