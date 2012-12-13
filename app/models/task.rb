class Task < ActiveRecord::Base
  belongs_to :user
  
  scope :notdone, where(completed: false)
  scope :done, where(completed: true)
  
  scope :ut, where('user_id = ?', 1)
  
  scope :usertasks, lambda { |user|
    where("email = ?", user.email)
  } 
  
  validates :name, presence: true
  
  #from the controller
  #@newusers = Newuser.class_of_2015
  
  attr_accessible :name, :description, :duedate, :user, :completed, :user_id, :id
  
end
