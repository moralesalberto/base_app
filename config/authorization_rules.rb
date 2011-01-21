authorization do
  role :admin do
    has_permission_on :setup, :to => [:index, :show, :create, :update, :destroy, :new, :edit]
  end
end
