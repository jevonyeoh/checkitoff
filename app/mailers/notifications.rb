class Notifications < ActionMailer::Base
  default from: "jevonyeoh@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_task.subject
  #
  def new_task(task)
    @task = task
    @greeting = "Hi"

    mail to: task.user.email
  end
end
