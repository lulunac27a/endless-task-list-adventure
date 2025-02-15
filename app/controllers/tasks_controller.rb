class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @user = User.find_by(name: "Default User") || User.create(name: "Default User", level: 1, xp: 0, xp_required: 1, total_xp: 0)
  end

  def show
    @task = Task.find(params.fetch(:id))
  end

  def create
    @user = User.find_by(name: "Default User")
    @task = @user.tasks.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params.fetch(:id))
    render "tasks/_form"
  end

  def complete
    @task = Task.find(params.fetch(:id))
    @task.complete
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params.fetch(:id))
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :due_date, :repeat_frequency, :repeat_interval, :user_id)
  end

  def destroy
    @task = Task.find(params.fetch(:id))
    if @task.destroy
      redirect_to tasks_path
    end
  end
end
