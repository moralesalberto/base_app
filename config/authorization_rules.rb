=begin rdoc
  
=end

authorization do

  role :security do
    has_permission_on :roles, :to => [:index, :show, :create, :update, :destroy, :new, :edit]
  end
end
