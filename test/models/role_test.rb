require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "Role admin have permission to change user role" do
    assert roles(:admin).permit?('users', 'update'), 'Role admin must have permissions to create new user'
  end
end
