class TasksController < ApplicationController
	skip_before_action :authenticate_user!, only: [:new]

	def new
		@task = Task.new
	end
end
