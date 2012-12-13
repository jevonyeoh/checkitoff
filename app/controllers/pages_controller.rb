class PagesController < ApplicationController
  def about
  end
  
  def contact  
  end
  
  def home
    if user_signed_in?
      @tasks = current_user.tasks.notdone
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
    end
   
    redirect_to home_path
  end  
  
  def complete
    if params[:todos_checkbox].nil?
        flash[:error] = "Check something off!"
        redirect_to home_path
    end
    if !params[:todos_checkbox].nil?
      params[:todos_checkbox].each do |check|
         todo_id = check
         t = Task.find_by_id(todo_id)
         t.update_attribute(:completed, true)
       end
      redirect_to home_path
    end
  end
  
end
