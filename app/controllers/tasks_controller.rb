class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
  end

  def create
    # binding.pry
    task = Task.new({
      title: params[:title],
      description: params[:description]
    })
    # binding.pry
    task.save
    # binding.pry
    redirect_to '/tasks'
  end

  def show
    # binding.pry
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update({
      title: params[:title],
      description: params[:description]
    })
    task.save
    redirect_to "/tasks/#{task.id}"
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to '/tasks'
  end
end
