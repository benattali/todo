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
    @allTasks = params[:list][:tasks][:description]
  	if @list.save!
      @allTasks.each do |task|
        @task = Task.new(description: task)
        @task.list_id = @list.id
        @task.save!
      end
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

  def add_task
    puts "test"
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
