require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  context "The security role" do
    setup do
      @role = roles(:security)
      @user = users(:security)
      sign_in @user          # sign_in(resource)
    end

    should " get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:roles)
    end

    should " get new" do
      get :new
      assert_response :success
    end

    should "should create role" do
      assert_difference('Role.count') do
        @new_role = Role.new(:name => 'create role')
        post :create, :role =>  @new_role.attributes
      end
      assert_redirected_to role_path(assigns(:role))
    end

    should "should render new if not created" do
      new_role = Role.new(:name => '')
      post :create, :role => new_role.attributes
      assert_response :success  
    end

    should "should show role" do
      get :show, :id => @role.to_param
      assert_response :success
    end

    should "should get edit" do
      get :edit, :id => @role.to_param
      assert_response :success
    end

    should "should update role" do
      put :update, :id => @role.to_param, :role => @role.attributes
      assert_redirected_to role_path(assigns(:role))
    end

    should "should render edit if not updated" do
      @role.name = ''
      post :update, :id => @role.to_param, :role => @role.attributes
      assert_response :success  
    end

    should "should destroy role" do
      assert_difference('Role.count', -1) do
        delete :destroy, :id => @role.to_param
      end

      assert_redirected_to roles_path
    end
  end

  context "the admin role" do
    should "not get into the roles controller" do
      @user = users(:admin)
      sign_in @user
      get_with @user, :index

      assert_response 302

    end
  end
end
