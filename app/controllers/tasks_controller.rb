class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    # @task.save
    # redirect_to task_path(@task)
    if @task.save
      redirect_to task_path(@task)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy 
    redirect_to tasks_path, status: :see_other
    #see other is for html
  end

  private 

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
