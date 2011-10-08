class FundingRoundsController < ApplicationController
    # GET /companiew/1/funding_rounds
    def index
      @company = Company.find(params[:company_id])

       # Access all items for that order
       @funding_rounds = @company.funding_rounds
     end

     # GET /companiew/1/funding_rounds/2
     def show
       @company = Company.find(params[:company_id])

       @funding_round = @company.funding_rounds.find(params[:id])
     end

     # GET /companiew/1/funding_rounds/new
     def new
       @company = Company.find(params[:company_id])


       # Associate an fund object with company 1
       @funding_round = @company.funding_rounds.build
     end

     # POST /companies/1/funding_rounds
     def create
       @company = Company.find(params[:company_id])

       @funding_round = @company.funding_rounds.build(params[:funding_round])
       if @funding_round.save
         # Save the fund successfully
         redirect_to company_funding_round_url(@company, @funding_round)
       else
         render :action => "new"
       end
     end

     # GET /companiew/1/funding_rounds/2/edit
     def edit
       @company = Company.find(params[:company_id])

       @funding_round = @company.funding_rounds.find(params[:id])
     end

     # PUT /companies/1/funding_rounds/2
     def update
       @company = Company.find(params[:company_id])
       @funding_round = FundingRound.find(params[:id])
       if @funding_round.update_attributes(params[:funding_round])
         # Save the item successfully
         redirect_to company_fund_url(@company, @funding_round)
       else
         render :action => "edit"
       end
     end

     # DELETE /companies/1/funding_rounds/2
     def destroy
       @company = Company.find(params[:company_id])
       @funding_round = FundingRound.find(params[:id])
       @funding_round.destroy

       respond_to do |format|
         format.html { redirect_to company_funding_rounds_path(@company) }
         format.xml  { head :ok }
       end
     end


  end
