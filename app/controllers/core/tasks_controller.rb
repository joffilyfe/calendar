class Core::TasksController < ApplicationController

  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to core_tasks_url, notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to core_tasks_url, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to core_tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :date)
    end

end
