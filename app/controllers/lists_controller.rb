class ListsController < ApplicationController
	before_action :set_list, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
  	@list = List.new
  	@task = Task.new
  end

  def create
  	@list = List.new(list_params)
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

  def edit
  	@task = @list.tasks
  end

  def update
     if @list.update(list_params)
      redirect_to list_path(@list), notice: "#{@list.title} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
  	@list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:title, tasks_attributes: [:id, :description, :_destroy])
  end

  def set_list
    @list = List.find(params[:id])
  end
end
