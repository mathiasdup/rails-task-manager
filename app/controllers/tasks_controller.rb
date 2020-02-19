class TasksController < ApplicationController


  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @taskshow = Task.find(params[:id])
  end

  def create
    Task.create!(task_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
