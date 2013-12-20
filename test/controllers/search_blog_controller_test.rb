require 'test_helper'

class SearchBlogControllerTest < ActionController::TestCase
  test "should get search blog" do
    get :search
    assert_response :success
  end

  test "should post find blog" do
    post :find, search_blog: {rating_up: 5, rating_down: 2, date: '20.12.2013'}
    assert_response :success
    assert_not assigns(:blogs) == blogs(:one), 'Blog not found!'
  end
end
