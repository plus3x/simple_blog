require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should login" do
    post :create, name: users(:client).name, password: 'secret'
    assert_redirected_to home_url
    assert_equal users(:client).id, session[:user_id]
  end

  test "should fail login" do
    post :create, name: users(:client).name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should get create" do
    get :create, name: users(:client).name, password: 'secret'
    assert_redirected_to home_url
  end

  test "should logout if logged in" do
    login_as :client
    delete :destroy
    assert_redirected_to home_url
  end
end
