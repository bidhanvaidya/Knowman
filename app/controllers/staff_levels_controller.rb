class StaffLevelsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])

    @staff_levels = @company.staff_levels
  end

  def show
    @company = Company.find(params[:company_id])

    @staff_level = @company.staff_levels.find(params[:id])
  end

  
  def new
    @company = Company.find(params[:company_id])

    @staff_level = @company.staff_levels.build
  end

  def create
    @company = Company.find(params[:company_id])

    @staff_level = @company.staff_levels.build(params[:staff_level])
    if @staff_level.save
      redirect_to company_staff_level_url(@company, @staff_level)
    else
      render :action => "new"
    end
  end

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
