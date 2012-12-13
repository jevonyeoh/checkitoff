class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate_user!
  #before_filter :set_task, :except => [:destroy, :index]

  def set_task
    @task = current_user.tasks.find(params[:email])
  end
end
