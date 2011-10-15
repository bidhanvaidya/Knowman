class StaffLevelsController < ApplicationController

  def show
    @company = Company.find(params[:company_id])

    @staff_level = @company.staff_levels.find(params[:id])
  end

  
  def new
    @company = Company.find(params[:company_id])

    @staff_level = @company.staff_levels.build
  end

  # POST /companies
  # POST /companies.json
  def create
    
	@staff_level = StaffLevel.find_or_create_by_company_permalink(params[:staff_level])

    respond_to do |format|
      
	  if success = @staff_level.save
	  
        format.json { render json: @staff_level }
	
      else
	  
        #format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      
	  end #if/else
	  
    end #do
	
  end #create

  def edit
    @company = Company.find(params[:company_id])

    @staff_level = @company.staff_levels.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @staff_level = staff_level.find(params[:id])
    if @staff_level.update_attributes(params[:staff_level])
      redirect_to company_staff_level_url(@company, @staff_level)
    else
      render :action => "edit"
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @staff_level = staff_level.find(params[:id])
    @staff_level.destroy

    respond_to do |format|
      format.html { redirect_to company_staff_levels_path(@company) }
      format.xml  { head :ok }
    end
  end

end
