class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @user = User.find_by(name: 'Default User')
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def create
    @user = User.find_by(name: 'Default User')
    @task = @user.tasks.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def complete
    @task = Task.find(params[:id])
    @task.complete
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date, :repeat_frequency, :repeat_interval, :user_id)
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to task_path
    end
  end
end