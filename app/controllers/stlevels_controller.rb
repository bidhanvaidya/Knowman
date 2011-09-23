class StlevelsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])

    @stlevels = @company.stlevels
  end

  def show
    @company = Company.find(params[:company_id])

    @stlevel = @company.stlevels.find(params[:id])
  end

  
  def new
    @company = Company.find(params[:company_id])

    @stlevel = @company.stlevels.build
  end

  def create
    @company = Company.find(params[:company_id])

    @stlevel = @company.stlevels.build(params[:stlevel])
    if @stlevel.save
      redirect_to company_stlevel_url(@company, @stlevel)
    else
      render :action => "new"
    end
  end

  def edit
    @company = Company.find(params[:company_id])

    @stlevel = @company.stlevels.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @stlevel = Stlevel.find(params[:id])
    if @stlevel.update_attributes(params[:stlevel])
      redirect_to company_stlevel_url(@company, @stlevel)
    else
      render :action => "edit"
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @stlevel = Stlevel.find(params[:id])
    @stlevel.destroy

    respond_to do |format|
      format.html { redirect_to company_stlevels_path(@company) }
      format.xml  { head :ok }
    end
  end

end
