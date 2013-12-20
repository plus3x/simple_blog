require 'test_helper'

class SearchBlogControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get find" do
    get :find
    assert_response :success
  end

end
