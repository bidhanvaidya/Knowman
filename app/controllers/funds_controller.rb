class FundsController < ApplicationController
    # GET /companiew/1/funds
    def index
      @company = Company.find(params[:company_id])

       # Access all items for that order
       @funds = @company.funds
     end

     # GET /companiew/1/funds/2
     def show
       @company = Company.find(params[:company_id])

       @fund = @company.funds.find(params[:id])
     end

     # GET /companiew/1/funds/new
     def new
       @company = Company.find(params[:company_id])


       # Associate an fund object with company 1
       @fund = @company.funds.build
     end

     # POST /companies/1/funds
     def create
       @company = Company.find(params[:company_id])

       @fund = @company.funds.build(params[:fund])
       if @fund.save
         # Save the fund successfully
         redirect_to company_fund_url(@company, @fund)
       else
         render :action => "new"
       end
     end

     # GET /companiew/1/funds/2/edit
     def edit
       @company = Company.find(params[:company_id])

       @fund = @company.funds.find(params[:id])
     end

     # PUT /companies/1/funds/2
     def update
       @company = Company.find(params[:company_id])
       @fund = Fund.find(params[:id])
       if @fund.update_attributes(params[:fund])
         # Save the item successfully
         redirect_to company_fund_url(@company, @fund)
       else
         render :action => "edit"
       end
     end

     # DELETE /companies/1/funds/2
     def destroy
       @company = Company.find(params[:company_id])
       @fund = Fund.find(params[:id])
       @fund.destroy

       respond_to do |format|
         format.html { redirect_to company_funds_path(@company) }
         format.xml  { head :ok }
       end
     end


  end
