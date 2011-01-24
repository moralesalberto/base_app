class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, 
         :recoverable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  #declarative authorization expects a roles method that returns an array of symbols of role names
  #so we change the habtm to access_lists so that the roles method can be written to be what
  #declarative authorization wants
  has_and_belongs_to_many :access_lists, :join_table => 'roles_users', :class_name => 'Role' 
  
  def roles
    access_lists.map {|role| role.name.to_sym}
  end
end
