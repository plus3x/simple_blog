require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    login_as :admin
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    login_as :client
    get :new
    assert_response :success
  end

  test "should create comment" do
    login_as :client
    assert_difference('Comment.count') do
      post :create, comment: { blog_id: @comment.blog_id, description: @comment.description, rating: @comment.rating }
    end
    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should show comment" do
    login_as :admin
    get :show, id: @comment
    assert_response :success
  end

  test "should get edit" do
    login_as :admin
    get :edit, id: @comment
    assert_response :success
  end

  test "should update comment" do
    login_as :admin
    patch :update, id: @comment, comment: { author_id: @comment.author_id, blog_id: @comment.blog_id, description: @comment.description, rating: @comment.rating }
    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should destroy comment" do
    login_as :admin
    assert_difference('Comment.count', -1) do
      delete :destroy, id: @comment
    end

    assert_redirected_to comments_path
  end
end
