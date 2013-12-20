require 'test_helper'

class BlogsControllerTest < ActionController::TestCase
  setup do
    @blog = blogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blogs)
  end

  test "should get new" do
    login_as :client
    get :new
    assert_response :success
  end

  test "should create blog" do
    login_as :client
    assert_difference('Blog.count') do
      post :create, blog: {category_id: @blog.category, description: @blog.description, title: @blog.title}
    end
    assert_redirected_to blog_path(assigns(:blog))
  end

  test "should show blog" do
    get :show, id: @blog
    assert_response :success
  end

  test "should get edit" do
    login_as :admin
    get :edit, id: @blog
    assert_response :success
  end

  test "should update blog" do
    login_as :admin
    patch :update, id: @blog, blog: { author_id: @blog.author_id, category_id: @blog.category_id, description: @blog.description, title: @blog.title }
    assert_redirected_to blog_path(assigns(:blog))
  end

  test "should destroy blog" do
    login_as :admin
    assert_difference('Blog.count', -1) do
      delete :destroy, id: @blog
    end
    assert_redirected_to blogs_path
  end
end
