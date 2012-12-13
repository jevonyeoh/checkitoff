class User < ActiveRecord::Base
  has_many :tasks
  
  scope :usertasks, lambda { |user|
    where("email = ?", user.email)
  } 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me, :user_id
end
