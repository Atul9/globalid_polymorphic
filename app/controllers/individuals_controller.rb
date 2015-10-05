class IndividualsController < ApplicationController
  def index
    @individuals = Individual.all
  end

  def new
    @individual = Individual.new
  end

  def create
    @individual = Individual.new(individual_params)
    if @individual.save
      redirect_to individuals_path
    else
      render 'new'
    end
  end

  def edit
    @individual = Individual.find(params[:id])
  end

  def update
    @individual = Individual.find(params[:id])
    @individual.update_attributes(individual_params)
    if @individual.save
      redirect_to individuals_path
    else
      render 'edit'
    end
  end

  def destroy
    Individual.find(params[:id]).destroy
    redirect_to individuals_path
  end

  private
  def individual_params
    params.require(:individual).permit(:name)
  end

end
