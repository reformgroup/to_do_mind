class TasksController < ApplicationController
  before_action :set_parent
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET lists/1/tasks
  # GET lists/1/tasks.json
  def index
    @lists = List.all.order(:position)
    @tasks = @list.tasks.order(:position)
  end

  # GET lists/1/tasks/1
  # GET lists/1/tasks/1.json
  def show
  end

  # GET lists/1/tasks/new
  def new
    @task = @list.tasks.build
  end

  # GET lists/1/tasks/1/edit
  def edit
  end

  # POST lists/1/tasks
  # POST lists/1/tasks.json
  def create
    @task = @list.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to [@list, @task], notice: 'Task was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT lists/1/tasks/1
  # PATCH/PUT lists/1/tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to [@list, @task], notice: 'Task was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.js
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE lists/1/tasks/1
  # DELETE lists/1/tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # PATCH /lists/1/tasks/sort
  def sort
    Task.find(params[:object_id]).insert_at(params[:position].to_i)
    head :ok
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @lists = List.all.order(:position)
      @list = List.find(params[:list_id])
    end
    
    def set_task
      @task = @list.tasks.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :list_id)
    end
end
