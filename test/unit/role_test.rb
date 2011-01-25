require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "A role should have a name" do
    role = Role.new
    role.save
    assert(role.errors.size > 0, "role should not be saved with no name")
    role.name = "role name here"
    role.save
    assert_equal(0, role.errors.size)
  end

  test "A role name should not be the same" do
    role = Role.new(:name => "role name")
    role.save!

    role2 = Role.new(:name => "role name")
    role2.save
    
    assert(role2.errors.size > 0, "two roles can not have the same name")
  end
  
  test "All roles in the application consist of:" do
    %w(admin security user).sort == Role.roles.sort
  end
end
