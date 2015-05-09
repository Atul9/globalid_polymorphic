class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @c = Company.all
    @i = Individual.all
  end

  def create
    p params
    p task_params
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :global_client)
  end

end
