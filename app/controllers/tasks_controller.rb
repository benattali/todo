class TasksController < ApplicationController
	before_action :set_list, only: [:new, :create]

  def new
  	@task = Task.new
  end

  def create
  	@task = Task.new(task_params)
  	@task.list = @list
  	if @task.save
  		redirect_to list_path(@list)
  	else
  		render :new
  	end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
    authorize @list
  end

  def task_params
    params.require(:task).permit(:description)
  end
end
