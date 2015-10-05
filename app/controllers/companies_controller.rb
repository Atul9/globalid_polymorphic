class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update_attributes(company_params)
    if @company.save
      redirect_to companies_path
    else
      render 'edit'
    end
  end

  def destroy
    Company.find(params[:id]).destroy
    redirect_to companies_path
  end

  private
  def company_params
    params.require(:company).permit(:name)
  end

end
