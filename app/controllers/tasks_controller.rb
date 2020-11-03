class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_task)
    if @task.save
      redirect_to tasks_path, notice: 'Created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(params_task)
      redirect_to tasks_path, notice: 'Updated!'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Deleted!'
  end

  private

    def find_task
      @task = Task.find(params[:id])
    end

    def params_task
      params.require(:task).permit(:title, :content)
    end
end