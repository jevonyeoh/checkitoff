class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  before_filter :authenticate_user!
  
  def index
    #@tasks = Task.done
    #@tasks = Task.all #get all the tasks
    #@tasks = User.usertasks(current_user).tasks
    @tasks = current_user.tasks.notdone

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @task.user = current_user
    @task.completed = false

    respond_to do |format|
      if @task.save
        #format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
        Notifications.new_task(@task).deliver
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        #format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.html { redirect_to tasks_path }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  def add
    @task = Task.new(:name => params[:todo_name])
    @task.user = current_user
    @task.completed = false
    @task.save
    
    #pop-up/warnings  
    if !@task.valid?
        flash[:error] = @task.errors.full_messages.join("<br>").html_safe
    end
    if @task.valid?
        flash[:success] = "Task successfully added!"
        Notifications.new_task(@task).deliver
    end
   
    redirect_to tasks_path
  end
  
  def complete
    if params[:todos_checkbox].nil?
        flash[:error] = "Check something off!"
        redirect_to tasks_path
        return
    end

    params[:todos_checkbox].each do |check|
       todo_id = check
       t = Task.find_by_id(todo_id)
       t.update_attribute(:completed, true)
     end
    redirect_to tasks_path

  end
end
