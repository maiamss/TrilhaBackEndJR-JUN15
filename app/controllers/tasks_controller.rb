class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: %i[ show update destroy ]
  before_action :authenticate_user, only: [:create, :index, :update, :destroy]
  

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = @user.tasks.new(task_params)

    if @task.save
      render json: @task, status: :created, location: user_task_url(@user, @task)
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end
    def set_user
      @user = User.find(params[:user_id])
    end
    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :priority, :completed, :user_id)
    end
end
