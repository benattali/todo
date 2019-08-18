class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @lists = List.where(user: current_user).order(:title)
  end

  def show
  end

  def new
    @list = List.new
    @task = Task.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    @tasks = []
    @allTasks = params[:list][:tasks_attributes].values
    @allTasks.each do |task|
      @tasks << Task.new(description: task[:description], list: @list)
    end
    @list.tasks = @tasks
    if @list.save!
      redirect_to list_path(@list), notice: "#{@list.title} was successfully created."
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  def done
    @task = Task.find(params[:id]) # find the correct task
    @list = List.find(@task.list_id) # find which list this task is connected to
    @task.status = true
    redirect_to list_path(@list) if @task.save!
  end

  def undone
    @task = Task.find(params[:id])
    @list = List.find(@task.list_id)
    @task.status = false
    redirect_to list_path(@list) if @task.save!
  end

  private

  def list_params
    params.require(:list).permit(:title, tasks_attributes: [:id, :description, :_destroy])
  end

  def set_list
    @list = List.find(params[:id])
  end
end
