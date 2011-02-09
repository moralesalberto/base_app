class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, 
         :recoverable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  
  has_and_belongs_to_many :roles
 
  #declarative authorization expects a role_symbols method that returns an array of symbols of role names
  def role_symbols
    roles.map {|role| role.name.to_sym}
  end
end
