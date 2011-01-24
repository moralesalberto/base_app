require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  setup do
    @role = roles(:user)
    @user = users(:admin)
    sign_in @user          # sign_in(resource)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role" do
    assert_difference('Role.count') do
      post :create, :role => Role.new(:name => 'create role') 
    end

    assert_redirected_to role_path(assigns(:role))
  end

  test "should show role" do
    get :show, :id => @role.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @role.to_param
    assert_response :success
  end

  test "should update role" do
    put :update, :id => @role.to_param, :role => @role.attributes
    assert_redirected_to role_path(assigns(:role))
  end

  test "should destroy role" do
    assert_difference('Role.count', -1) do
      delete :destroy, :id => @role.to_param
    end

    assert_redirected_to roles_path
  end
end
