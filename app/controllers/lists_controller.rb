class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @lists = policy_scope(List)
  end

  def show
  end

  def new
    @list = List.new
    authorize @list
    @task = Task.new
  end

  def create
    @list = List.new(list_params)
    @list.title.capitalize!
    authorize @list
    @list.user = current_user
    @tasks = []
    @allTasks = params[:list][:tasks_attributes].values
    @allTasks.each do |task|
      @tasks << Task.new(description: task[:description].capitalize, list: @list)
    end
    @list.tasks = @tasks
    if @list.save!
      redirect_to list_path(@list), notice: "#{@list.title} was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tasks = params[:list][:tasks_attributes].values
    @tasks.each do |task|
      task[:description].capitalize!
    end
    if @list.update(list_params)
      redirect_to list_path(@list), notice: "#{@list.title} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def done
    @task = Task.find(params[:id]) # find the correct task
    @list = List.find(@task.list_id) # find which list this task is connected to
    @task.status = true
    @task.save
    authorize @list
    respond_to do |format|
      format.html { redirect_to list_path(@list) if @task.save! }
      format.js
    end
  end

  def undone
    @task = Task.find(params[:id])
    @list = List.find(@task.list_id)
    @task.status = false
    @task.save
    authorize @list
    respond_to do |format|
      format.html { redirect_to list_path(@list) if @task.save! }
      format.js
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, tasks_attributes: [:id, :description, :_destroy])
  end

  def set_list
    @list = List.find(params[:id])
    authorize @list
  end
end
