=begin rdoc
 roles to allow access. add each role and each resource to it.  
=end

authorization do

  role :security do
    has_permission_on :roles, :to => [:index, :show, :create, :update, :destroy, :new, :edit]
  end
end
