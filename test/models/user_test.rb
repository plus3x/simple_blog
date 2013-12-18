require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have role" do
    assert users(:admin).admin?,   "User #{  users(:admin).name } is not admin"
    assert users(:client).client?, "User #{ users(:client).name } is not client"
  end
  
  test "should user can" do
    assert users(:admin).can?(  'users',    'destroy'), "Administrator must have permission to destroy user"
    assert users(:client).can?( 'comments', 'create' ), "Client must have permission to create comment"
    refute users(:client).can?( 'blog',     'destroy'), "Client must no have permission to destroy blog"
  end
  
  test "user name must be certain format" do
    good = User.new(name: 'goodname', password: 'secret', password_confirmation: 'secret')
    assert good.valid?, 'Name must be good'
    assert_not good.errors[:name].any?, 'Name must be certain format'
    
    bad = User.new(name: 'More than twenty characters', password: 'secret', password_confirmation: 'secret')
    assert bad.invalid?, 'Bad name must be invalid'
    assert bad.errors[:name].any?, 'Bad name must be invalid format'
  end
  
  test "user after create must have role client" do
    gary = User.create(name: 'gary@kook.com', password: 'secret', password_confirmation: 'secret')
    assert gary.role,                       "Gary must have role"
    assert gary.role.title == 'client',     "Gary must have role client"
  end
end
